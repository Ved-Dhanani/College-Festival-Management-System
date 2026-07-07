-- ================================================================
-- College Festival Management System
-- File    : Best_Queries.sql
-- Database: PostgreSQL
-- 15 best retrieval queries — tested on sample data
-- ================================================================
-- SQL features covered:
--   INNER JOIN, LEFT JOIN (multi-table)
--   GROUP BY / HAVING
--   Aggregate: COUNT, SUM, AVG, MIN, MAX
--   CASE expression
--   Correlated subquery / subquery in FROM
--   NOT EXISTS
--   CTE  (WITH clause)
--   Window functions: RANK() OVER, SUM() OVER
--   TO_CHAR() for date formatting
--   Date arithmetic  (End_Date - Start_Date)
--   COALESCE, ROUND, DISTINCT
-- ================================================================


-- ================================================================
-- Query 01
-- Question : List all festivals with organizing college,
--            committee, duration in days, ordered by start date.
-- Features : Multi-table JOIN, date arithmetic (End_Date - Start_Date)
-- ================================================================
SELECT
    F.Festival_ID,
    F.Festival_Name,
    F.Festival_Type,
    F.Start_Date,
    F.End_Date,
    (F.End_Date - F.Start_Date + 1)  AS Duration_Days,
    C.Committee_Name,
    CL.College_Name
FROM Festival  F
JOIN Committee C  ON F.Committee_ID = C.Committee_ID
JOIN College   CL ON C.College_ID   = CL.College_ID
ORDER BY F.Start_Date;


-- ================================================================
-- Query 02
-- Question : For each event, show total registrations and total
--            completed revenue, ordered by revenue descending.
-- Features : Multi-table LEFT JOIN, CASE, COALESCE, GROUP BY
-- ================================================================
SELECT
    E.Event_ID,
    E.Event_Name,
    E.Event_Category,
    F.Festival_Name,
    E.Ticket_Price,
    COUNT(DISTINCT R.Person_ID)                                     AS Total_Registrations,
    COALESCE(SUM(CASE WHEN PAY.Payment_Status = 'Completed'
                      THEN PAY.Payment_Amount END), 0)              AS Revenue_Collected
FROM Event         E
JOIN Festival      F   ON E.Festival_ID  = F.Festival_ID
LEFT JOIN Registration R   ON E.Event_ID = R.Event_ID
LEFT JOIN Ticket       T   ON E.Event_ID = T.Event_ID
LEFT JOIN Payment      PAY ON T.Ticket_ID = PAY.Ticket_ID
GROUP BY E.Event_ID, E.Event_Name, E.Event_Category,
         F.Festival_Name, E.Ticket_Price
ORDER BY Revenue_Collected DESC;


-- ================================================================
-- Query 03
-- Question : Full festival dashboard — events, participants,
--            stalls, and total revenue per festival.
-- Features : 5-table LEFT JOIN, CASE, multi-aggregate, GROUP BY
-- ================================================================
SELECT
    F.Festival_Name,
    F.Festival_Type,
    F.Start_Date,
    F.End_Date,
    COUNT(DISTINCT E.Event_ID)                                       AS Total_Events,
    COUNT(DISTINCT R.Person_ID)                                      AS Total_Participants,
    COUNT(DISTINCT S.Stall_ID)                                       AS Total_Stalls,
    COALESCE(SUM(CASE WHEN PAY.Payment_Status = 'Completed'
                      THEN PAY.Payment_Amount END), 0)               AS Total_Revenue
FROM Festival      F
LEFT JOIN Event        E   ON F.Festival_ID  = E.Festival_ID
LEFT JOIN Registration R   ON E.Event_ID     = R.Event_ID
LEFT JOIN Stall        S   ON F.Festival_ID  = S.Festival_ID
LEFT JOIN Ticket       T   ON E.Event_ID     = T.Event_ID
LEFT JOIN Payment      PAY ON T.Ticket_ID    = PAY.Ticket_ID
GROUP BY F.Festival_ID, F.Festival_Name, F.Festival_Type,
         F.Start_Date, F.End_Date
ORDER BY Total_Revenue DESC;


-- ================================================================
-- Query 04
-- Question : Find participants who registered for more than one
--            event — show name, college, and event count.
-- Features : GROUP BY + HAVING
-- ================================================================
SELECT
    P.Person_ID,
    P.Name,
    P.Gender,
    P.College_Name,
    COUNT(R.Event_ID)  AS Events_Registered
FROM Participant  P
JOIN Registration R ON P.Person_ID = R.Person_ID
GROUP BY P.Person_ID, P.Name, P.Gender, P.College_Name
HAVING COUNT(R.Event_ID) > 1
ORDER BY Events_Registered DESC;


-- ================================================================
-- Query 05
-- Question : Rank all events by revenue using RANK() window
--            function. Show rank, event, festival, revenue.
-- Features : Subquery in FROM, RANK() OVER window function
-- ================================================================
SELECT
    RANK() OVER (ORDER BY COALESCE(REV.Revenue, 0) DESC)  AS Revenue_Rank,
    E.Event_Name,
    E.Event_Category,
    F.Festival_Name,
    E.Ticket_Price,
    COALESCE(REV.Revenue, 0)                               AS Total_Revenue
FROM Event    E
JOIN Festival F ON E.Festival_ID = F.Festival_ID
LEFT JOIN (
    SELECT T.Event_ID,
           SUM(PAY.Payment_Amount) AS Revenue
    FROM Ticket  T
    JOIN Payment PAY ON T.Ticket_ID = PAY.Ticket_ID
    WHERE PAY.Payment_Status = 'Completed'
    GROUP BY T.Event_ID
) REV ON E.Event_ID = REV.Event_ID
ORDER BY Revenue_Rank;


-- ================================================================
-- Query 06
-- Question : Payment status breakdown — count, total amount,
--            and percentage share for each status.
-- Features : SUM() OVER() window function, ROUND, GROUP BY
-- ================================================================
SELECT
    Payment_Status,
    COUNT(Payment_ID)                                              AS Transaction_Count,
    SUM(Payment_Amount)                                            AS Total_Amount,
    ROUND(100.0 * COUNT(Payment_ID) /
          SUM(COUNT(Payment_ID)) OVER (), 2)                       AS Percentage
FROM Payment
GROUP BY Payment_Status
ORDER BY Transaction_Count DESC;


-- ================================================================
-- Query 07
-- Question : Find participants who registered for events but
--            have NOT made any payment — using NOT EXISTS.
-- Features : NOT EXISTS correlated subquery
-- ================================================================
SELECT DISTINCT
    P.Person_ID,
    P.Name,
    P.Email,
    P.College_Name,
    E.Event_Name,
    R.Registration_Date
FROM Participant  P
JOIN Registration R ON P.Person_ID  = R.Person_ID
JOIN Event        E ON R.Event_ID   = E.Event_ID
WHERE NOT EXISTS (
    SELECT 1
    FROM Payment PAY
    JOIN Ticket  T  ON PAY.Ticket_ID = T.Ticket_ID
    WHERE PAY.Person_ID = P.Person_ID
      AND T.Event_ID    = E.Event_ID
)
ORDER BY P.Name;


-- ================================================================
-- Query 08
-- Question : Each organizer with sponsor count and total
--            sponsorship managed — ordered by amount.
-- Features : Multi-table JOIN, LEFT JOIN, GROUP BY, COALESCE
-- ================================================================
SELECT
    O.Organizer_ID,
    O.Organizer_Name,
    O.Department,
    C.Committee_Name,
    CL.College_Name,
    COUNT(SP.Sponsor_ID)                    AS Sponsors_Managed,
    COALESCE(SUM(SP.Sponsorship_Amount), 0) AS Total_Sponsorship
FROM Organizer O
JOIN Committee C      ON O.Committee_ID = C.Committee_ID
JOIN College   CL     ON C.College_ID   = CL.College_ID
LEFT JOIN Sponsor SP  ON O.Organizer_ID = SP.Organizer_ID
GROUP BY O.Organizer_ID, O.Organizer_Name, O.Department,
         C.Committee_Name, CL.College_Name
ORDER BY Total_Sponsorship DESC;


-- ================================================================
-- Query 09
-- Question : College-wise participation summary — unique
--            participants, registrations, and total money spent.
-- Features : LEFT JOIN, CASE, GROUP BY across 3 tables
-- ================================================================
SELECT
    P.College_Name,
    COUNT(DISTINCT P.Person_ID)                                      AS Total_Participants,
    COUNT(R.Registration_ID)                                         AS Total_Registrations,
    COALESCE(SUM(CASE WHEN PAY.Payment_Status = 'Completed'
                      THEN PAY.Payment_Amount END), 0)               AS Total_Spent
FROM Participant  P
LEFT JOIN Registration R   ON P.Person_ID = R.Person_ID
LEFT JOIN Payment      PAY ON P.Person_ID = PAY.Person_ID
GROUP BY P.College_Name
ORDER BY Total_Spent DESC;


-- ================================================================
-- Query 10
-- Question : Find the most expensive event in each festival
--            using a correlated subquery.
-- Features : Correlated subquery in WHERE clause
-- ================================================================
SELECT
    F.Festival_Name,
    E.Event_Name,
    E.Event_Category,
    E.Event_Venue,
    E.Ticket_Price  AS Max_Ticket_Price
FROM Event    E
JOIN Festival F ON E.Festival_ID = F.Festival_ID
WHERE E.Ticket_Price = (
    SELECT MAX(E2.Ticket_Price)
    FROM Event E2
    WHERE E2.Festival_ID = E.Festival_ID
)
ORDER BY Max_Ticket_Price DESC;


-- ================================================================
-- Query 11
-- Question : List volunteers with events assigned and flag
--            unassigned volunteers using CASE expression.
-- Features : LEFT JOIN, CASE expression, GROUP BY
-- ================================================================
SELECT
    V.Volunteer_ID,
    V.Volunteer_Name,
    V.Volunteer_Role,
    COUNT(VA.Event_ID)                              AS Events_Assigned,
    CASE WHEN COUNT(VA.Event_ID) = 0
         THEN 'Not Assigned'
         ELSE 'Active'
    END                                             AS Status
FROM Volunteer V
LEFT JOIN Volunteer_Assignment VA ON V.Volunteer_ID = VA.Volunteer_ID
GROUP BY V.Volunteer_ID, V.Volunteer_Name, V.Volunteer_Role
ORDER BY Events_Assigned DESC;


-- ================================================================
-- Query 12
-- Question : Month-wise registration trend — total registrations
--            and unique participants per month.
-- Features : TO_CHAR() date formatting, COUNT DISTINCT, GROUP BY
-- ================================================================
SELECT
    TO_CHAR(R.Registration_Date, 'YYYY-MM')  AS Month,
    COUNT(R.Registration_ID)                  AS Total_Registrations,
    COUNT(DISTINCT R.Person_ID)               AS Unique_Participants
FROM Registration R
GROUP BY TO_CHAR(R.Registration_Date, 'YYYY-MM')
ORDER BY Month;


-- ================================================================
-- Query 13
-- Question : Merchandise inventory summary per festival —
--            item types, stock, inventory value, min/max price.
-- Features : JOIN, MIN, MAX, SUM, COUNT aggregates
-- ================================================================
SELECT
    F.Festival_Name,
    COUNT(M.Merchandise_ID)            AS Item_Types,
    SUM(M.Stock_Quantity)              AS Total_Stock,
    SUM(M.Price * M.Stock_Quantity)    AS Total_Inventory_Value,
    MIN(M.Price)                       AS Cheapest_Item,
    MAX(M.Price)                       AS Most_Expensive_Item
FROM Festival    F
JOIN Merchandise M ON F.Festival_ID = M.Festival_ID
GROUP BY F.Festival_ID, F.Festival_Name
ORDER BY Total_Inventory_Value DESC;


-- ================================================================
-- Query 14
-- Question : Find events where volunteer count is greater than
--            or equal to participant count.
-- Features : LEFT JOIN, GROUP BY, HAVING on two COUNT DISTINCTs
-- ================================================================
SELECT
    E.Event_ID,
    E.Event_Name,
    F.Festival_Name,
    COUNT(DISTINCT VA.Volunteer_ID)  AS Volunteers,
    COUNT(DISTINCT R.Person_ID)      AS Participants
FROM Event E
JOIN Festival               F   ON E.Festival_ID = F.Festival_ID
LEFT JOIN Volunteer_Assignment  VA  ON E.Event_ID = VA.Event_ID
LEFT JOIN Registration          R   ON E.Event_ID = R.Event_ID
GROUP BY E.Event_ID, E.Event_Name, F.Festival_Name
HAVING COUNT(DISTINCT VA.Volunteer_ID) >= COUNT(DISTINCT R.Person_ID)
ORDER BY Volunteers DESC;


-- ================================================================
-- Query 15
-- Question : Using a CTE, find top 5 participants by total
--            amount paid (completed payments only).
-- Features : CTE (WITH clause), RANK() OVER, LIMIT
-- ================================================================
WITH ParticipantSpend AS (
    SELECT
        P.Person_ID,
        P.Name,
        P.Gender,
        P.College_Name,
        SUM(PAY.Payment_Amount)  AS Total_Paid,
        COUNT(PAY.Payment_ID)    AS Payment_Count
    FROM Participant P
    JOIN Payment PAY ON P.Person_ID = PAY.Person_ID
    WHERE PAY.Payment_Status = 'Completed'
    GROUP BY P.Person_ID, P.Name, P.Gender, P.College_Name
)
SELECT
    RANK() OVER (ORDER BY Total_Paid DESC)  AS Rank,
    Person_ID,
    Name,
    Gender,
    College_Name,
    Payment_Count,
    Total_Paid
FROM ParticipantSpend
ORDER BY Total_Paid DESC
LIMIT 5;


-- ================================================================
-- END OF BEST QUERIES
-- ================================================================
