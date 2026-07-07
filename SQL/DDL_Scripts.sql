-- ================================================================
-- College Festival Management System
-- File    : DDL_Scripts.sql
-- Database: PostgreSQL
-- Run this FIRST before INSERT or SELECT scripts
-- ================================================================

-- Drop tables if re-running (order respects FK constraints)
DROP TABLE IF EXISTS Payment             CASCADE;
DROP TABLE IF EXISTS Ticket              CASCADE;
DROP TABLE IF EXISTS Merchandise         CASCADE;
DROP TABLE IF EXISTS Stall               CASCADE;
DROP TABLE IF EXISTS Sponsor             CASCADE;
DROP TABLE IF EXISTS Volunteer_Assignment CASCADE;
DROP TABLE IF EXISTS Volunteer           CASCADE;
DROP TABLE IF EXISTS Registration        CASCADE;
DROP TABLE IF EXISTS Participant         CASCADE;
DROP TABLE IF EXISTS Event               CASCADE;
DROP TABLE IF EXISTS Festival            CASCADE;
DROP TABLE IF EXISTS Organizer           CASCADE;
DROP TABLE IF EXISTS Committee           CASCADE;
DROP TABLE IF EXISTS College             CASCADE;

-- ── College ──────────────────────────────────────────────────
CREATE TABLE College (
    College_ID      SERIAL          PRIMARY KEY,
    College_Name    VARCHAR(150)    NOT NULL,
    Location        VARCHAR(200),
    Contact_Email   VARCHAR(100)    UNIQUE
);

-- ── Committee ────────────────────────────────────────────────
CREATE TABLE Committee (
    Committee_ID    SERIAL          PRIMARY KEY,
    Committee_Name  VARCHAR(150)    NOT NULL,
    Total_Members   INTEGER         CHECK (Total_Members > 0),
    College_ID      INTEGER         NOT NULL,
    FOREIGN KEY (College_ID) REFERENCES College(College_ID) ON DELETE CASCADE
);

-- ── Organizer ────────────────────────────────────────────────
CREATE TABLE Organizer (
    Organizer_ID    SERIAL          PRIMARY KEY,
    Organizer_Name  VARCHAR(100)    NOT NULL,
    Department      VARCHAR(100),
    Email           VARCHAR(100)    UNIQUE NOT NULL,
    Contact_Number  VARCHAR(15),
    Committee_ID    INTEGER         NOT NULL,
    FOREIGN KEY (Committee_ID) REFERENCES Committee(Committee_ID) ON DELETE CASCADE
);

-- ── Festival ─────────────────────────────────────────────────
CREATE TABLE Festival (
    Festival_ID     SERIAL          PRIMARY KEY,
    Festival_Name   VARCHAR(150)    NOT NULL,
    Festival_Type   VARCHAR(50),
    Start_Date      DATE            NOT NULL,
    End_Date        DATE            NOT NULL,
    Committee_ID    INTEGER         NOT NULL,
    CHECK (End_Date >= Start_Date),
    FOREIGN KEY (Committee_ID) REFERENCES Committee(Committee_ID) ON DELETE CASCADE
);

-- ── Event ────────────────────────────────────────────────────
CREATE TABLE Event (
    Event_ID        SERIAL          PRIMARY KEY,
    Event_Name      VARCHAR(150)    NOT NULL,
    Event_Category  VARCHAR(100),
    Event_Venue     VARCHAR(200),
    Event_Date      DATE            NOT NULL,
    Event_Time      TIME,
    Ticket_Price    NUMERIC(10,2)   CHECK (Ticket_Price >= 0),
    Festival_ID     INTEGER         NOT NULL,
    FOREIGN KEY (Festival_ID) REFERENCES Festival(Festival_ID) ON DELETE CASCADE
);

-- ── Participant ──────────────────────────────────────────────
CREATE TABLE Participant (
    Person_ID       SERIAL          PRIMARY KEY,
    Name            VARCHAR(100)    NOT NULL,
    Gender          VARCHAR(10)     CHECK (Gender IN ('Male','Female','Other')),
    Email           VARCHAR(100)    UNIQUE NOT NULL,
    Contact_Number  VARCHAR(15),
    College_Name    VARCHAR(150)
);

-- ── Registration ─────────────────────────────────────────────
CREATE TABLE Registration (
    Registration_ID SERIAL          PRIMARY KEY,
    Person_ID       INTEGER         NOT NULL,
    Event_ID        INTEGER         NOT NULL,
    Registration_Date DATE          NOT NULL,
    UNIQUE (Person_ID, Event_ID),
    FOREIGN KEY (Person_ID) REFERENCES Participant(Person_ID) ON DELETE CASCADE,
    FOREIGN KEY (Event_ID)  REFERENCES Event(Event_ID)        ON DELETE CASCADE
);

-- ── Volunteer ────────────────────────────────────────────────
CREATE TABLE Volunteer (
    Volunteer_ID    SERIAL          PRIMARY KEY,
    Volunteer_Name  VARCHAR(100)    NOT NULL,
    Contact_Number  VARCHAR(15),
    Volunteer_Role  VARCHAR(100)
);

-- ── Volunteer_Assignment ─────────────────────────────────────
CREATE TABLE Volunteer_Assignment (
    Assignment_ID   SERIAL          PRIMARY KEY,
    Volunteer_ID    INTEGER         NOT NULL,
    Event_ID        INTEGER         NOT NULL,
    UNIQUE (Volunteer_ID, Event_ID),
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID) ON DELETE CASCADE,
    FOREIGN KEY (Event_ID)     REFERENCES Event(Event_ID)         ON DELETE CASCADE
);

-- ── Sponsor ──────────────────────────────────────────────────
CREATE TABLE Sponsor (
    Sponsor_ID          SERIAL          PRIMARY KEY,
    Sponsor_Name        VARCHAR(100)    NOT NULL,
    Organization_Name   VARCHAR(150),
    Contact_Number      VARCHAR(15),
    Email               VARCHAR(100),
    Sponsorship_Amount  NUMERIC(12,2)   CHECK (Sponsorship_Amount >= 0),
    Organizer_ID        INTEGER         NOT NULL,
    FOREIGN KEY (Organizer_ID) REFERENCES Organizer(Organizer_ID)
);

-- ── Ticket ───────────────────────────────────────────────────
CREATE TABLE Ticket (
    Ticket_ID       SERIAL          PRIMARY KEY,
    Ticket_Price    NUMERIC(10,2)   CHECK (Ticket_Price >= 0),
    Event_ID        INTEGER         NOT NULL,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID) ON DELETE CASCADE
);

-- ── Payment ──────────────────────────────────────────────────
CREATE TABLE Payment (
    Payment_ID      SERIAL          PRIMARY KEY,
    Payment_Amount  NUMERIC(10,2)   NOT NULL CHECK (Payment_Amount >= 0),
    Payment_Date    DATE            NOT NULL,
    Payment_Status  VARCHAR(20)     CHECK (Payment_Status IN
                        ('Pending','Completed','Failed','Refunded')),
    Person_ID       INTEGER         NOT NULL,
    Ticket_ID       INTEGER         NOT NULL,
    FOREIGN KEY (Person_ID)  REFERENCES Participant(Person_ID) ON DELETE CASCADE,
    FOREIGN KEY (Ticket_ID)  REFERENCES Ticket(Ticket_ID)      ON DELETE CASCADE
);

-- ── Stall ────────────────────────────────────────────────────
CREATE TABLE Stall (
    Stall_ID        SERIAL          PRIMARY KEY,
    Stall_Name      VARCHAR(100)    NOT NULL,
    Stall_Type      VARCHAR(50),
    Contact_Number  VARCHAR(15),
    Vendor_Name     VARCHAR(100),
    Festival_ID     INTEGER         NOT NULL,
    FOREIGN KEY (Festival_ID) REFERENCES Festival(Festival_ID) ON DELETE CASCADE
);

-- ── Merchandise ──────────────────────────────────────────────
CREATE TABLE Merchandise (
    Merchandise_ID   SERIAL          PRIMARY KEY,
    Merchandise_Name VARCHAR(150)    NOT NULL,
    Price            NUMERIC(10,2)   CHECK (Price >= 0),
    Stock_Quantity   INTEGER         CHECK (Stock_Quantity >= 0),
    Festival_ID      INTEGER         NOT NULL,
    FOREIGN KEY (Festival_ID) REFERENCES Festival(Festival_ID) ON DELETE CASCADE
);

-- ================================================================
-- END OF DDL
-- ================================================================
