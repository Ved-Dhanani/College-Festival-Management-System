# College Festival Management System

**Course:** Database Management Systems  
**University:** Dhirubhai Ambani University  

## Group Members

| Name | SID |
|---|---|
| Ved Dhanani | 202401048 |
| Dev Sanghani | 202401047 |

---

## Project Description

A relational database system to manage college festivals,
including events, participants, volunteers, sponsors,
stalls, merchandise, and payments.

---

## Repository Structure

| Folder | Contents |
|---|---|
| `ER_Diagram/` | Peter Chen ER Diagram (1976 notation) |
| `Relational_Schema/` | Relational Schema Diagram |
| `SQL/` | DDL Scripts, INSERT Scripts, Best Queries |
| `PDF_Submissions/` | Final PDF submissions |

---

## Database Overview

**14 Tables:** College, Committee, Organizer, Festival,
Event, Participant, Registration, Volunteer,
Volunteer_Assignment, Sponsor, Ticket,
Payment, Stall, Merchandise

**Normalization:** All relations verified in BCNF

---

## How to Run

1. Open pgAdmin 4
2. Create a new database
3. Run `SQL/DDL_Scripts.sql` — creates all 14 tables
4. Run `SQL/INSERT_Scripts.sql` — inserts sample data
5. Run `SQL/Best_Queries.sql` — executes all queries
