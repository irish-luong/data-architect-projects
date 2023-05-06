# Project Data Architect Foundation - HR Database Design

## BUSINESS CONTEXT

```
Tech ABC Corp saw explosive growth with a sudden appearance onto the gaming scene with their new AI-powered video game console. As a result, they have gone from a small 10 person operation to 200 employees and 5 locations in under a year. HR is having trouble keeping up with the growth, since they are still maintaining employee information in a spreadsheet. While that worked for ten employees, it has becoming increasingly cumbersome to manage as the company expands.

As such, the HR department has tasked you, as the new data architect, to design and build a database capable of managing their employee information.
```

## STEP BY STEP

## Business Requirement Analysis

| Criteria                       | Description            |
| ------------------------------ | ---------------------- |
| Purpose of the new database | HR  department requested IT department design and build databases to convert HR record spreadsheet into a database. |
| Current data management solution | Currently, HR department is using a spreadsheet to store all relevant data. |
| Current data available | Employee information is on a spreadsheet.|
| Additional data requests | HR department want database can ensure integrity and security because this database will contain many sensitive information and have ability to connect with the payroll department's system in the future. |
| Who will own/manage data | HR and management level employees. |
| Who will have access to database | Any employes with domain login. |
| Estimated size of database | 206 rows.|
| Estimated annual employees data growth | Estimate in the next 5 years: 513 rows (20% per year) |
| Estimated annual location data growth |  From 2 offices to 4 location nationwide. |
| Is any of the data sensitive/restricted| Salary information. |


## Technical Requirement Analysis

| Criteria                       | Description            |
| ------------------------------ | ---------------------- |
| Justification for the new database | Restructure the data model to adapt 3NF. |
| Current data management solution | Currently, HR department is using a spreadsheet to store all relevant data. |
| Database objects | We have 4 objects include Employee, Office, Department, Location.|
| Data ingestion | Migration phase: use ETL to convert current data in the HR spreadsheet fit to designed data models. Future we expect can use API to interact with payroll department's system. |
| Data governance | Ownership by HR department and access by any users with domain login.|
| Scalability | we should apply replication for this databases to scale our read ability when more and more users read this. |
| Flexibility | Able to connect with the payroll department's system in the future.|
| Storage | With data in year we store in-memory with backup data for legal purpose we store in disk |
| Retention |  7 years. |
| Backup | We will apply critical backup. |

**Convention** :
- Backups: 

All database backup schedules should be set based on priority (Standard, Archived, Critical):

    - Standard: Backup schedule is a full backup 1x per week.

    - Archive: Backup schedule is a full backup 1x per month.

    - Critical: Backup schedule is full backup 1x per week, incremental backup daily.

- Storage: 

    - All databases are given a standard partition of 1 GB by the server group. Ask users about the expected growth of data. Databases larger than or expected to exceed 10K rows of data in the next year should ask for a large partition space.

    - Databases are stored on spinning disk by default. In-memory storage is available, but only for data that requires higher level computations (advanced analytics, machine learning applications).

- Data Ingestion:
    - Direct Feeds: If setting up a direct feed from another database, please ensure a functional username is created by IT security. This will ensure an expiring username does not cause a data flow error.
    - API: If working with API, please submit the API address and information to IT security for evaluation before proceeding.
    - ETL: ETL is the current best practice for working with flat files. If the flat file will be regularly updated, an automated ETL process can be set up.


## Design

![diagram](./DBMS%20ER%20diagram%20(UML%20notation)%20-%20DBMS%20ER%20diagram%20(UML%20notation).png)
