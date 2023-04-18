/* README
Student ID: 46228241
Student Name: Jeremy Hong
BUSA8090 Task 1 - Case Study 2 - ProApp
File purpose: Queries for business case questions
*/

USE ProApp;

/* 1. How long does it take to onboard a new tradesmen?
1a. Who took the longest time?
1b. Who took the shortest time? 
1c. What is the average time to onboard a new tradesperson?
*/

DROP VIEW IF EXISTS Tradespeople_Onboarding;

CREATE VIEW Tradespeople_Onboarding AS
SELECT t1.TRADE_APP_ID, t1.USER_ID, trade_type, Date_created, police_check_date, onboard_date, 
	-DATEDIFF(Date_created, police_check_date) as days_to_police_check,
    -DATEDIFF(Date_created, onboard_date) as days_to_onboard
FROM TRADE_APPLICANT as t1
INNER JOIN TRADEPERSON as t2
ON t1.TRADE_APP_ID = t2.TRADE_APP_ID
INNER JOIN USER as t3
ON t1.USER_ID = t3.USER_ID
;

# Create view of query
SELECT * FROM Tradespeople_Onboarding
ORDER BY days_to_onboard DESC, days_to_police_check DESC;

# 1a Tradesperson that took the longest time to onboard 
DROP VIEW IF EXISTS Q1a_longest_case;

CREATE VIEW Q1a_longest_case AS
SELECT * FROM Tradespeople_Onboarding
WHERE days_to_onboard = (SELECT MAX(days_to_onboard) FROM Tradespeople_Onboarding);

SELECT * FROM Q1a_longest_case;

# 1b Tradesperson that took the shortest time to onboard 
DROP VIEW IF EXISTS Q1b_fastest_case;

CREATE VIEW Q1b_fastest_case AS
SELECT * FROM Tradespeople_Onboarding
WHERE days_to_onboard = (SELECT MIN(days_to_onboard) FROM Tradespeople_Onboarding);

SELECT * FROM Q1b_fastest_case;

# 1c. Average amount of time to onboard a new tradesmen
DROP VIEW IF EXISTS Q1c_avg_onboard_time;

CREATE VIEW Q1c_avg_onboard_time AS
SELECT AVG(days_to_onboard) FROM Tradespeople_Onboarding;

SELECT * FROM Q1c_avg_onboard_time;



#2. How many tradesperson assessment centers should we have and where? 

# 2a. Which postcode has the most number of Tradeperson applicants? (Where to place assessment centers?)
DROP VIEW IF EXISTS Q2a_most_trade_appl_postcode;

CREATE VIEW Q2a_most_trade_appl_postcode AS
SELECT Tradesperson_postcode, COUNT(TRADE_APP_ID) as Tradie_count
FROM TRADE_APPLICANT
GROUP BY Tradesperson_postcode
ORDER BY COUNT(TRADE_APP_ID) DESC
;

SELECT * FROM Q2a_most_trade_appl_postcode;

# 2b. In each post code area, what are proportions of types of tradepeople? 
# (What type of assessment services are required more at each center?)
DROP VIEW IF EXISTS Q2b_trade_appl_prop;

CREATE VIEW Q2b_trade_appl_prop AS
SELECT Trade_type, Tradesperson_postcode, COUNT(TRADE_APP_ID) as Tradie_count
FROM TRADE_APPLICANT
GROUP BY Trade_type, Tradesperson_postcode
ORDER BY Trade_type DESC, Tradesperson_postcode ASC, COUNT(TRADE_APP_ID) DESC
;

SELECT * FROM Q2b_trade_appl_prop;


# 3a. What number of applicants are in each stage of approval? 
# (Where should we focus onboarding efforts more?)
# (Rejected, Not yet started, in progress, in training, approved) 
DROP VIEW IF EXISTS Q3_onboard_stages;

CREATE VIEW Q3_onboard_stages AS
SELECT Appl_desc, COUNT(TRADE_APP_ID)
FROM TRADE_APPLICANT as t1
INNER JOIN APPLICANT_STATUS as t2 
ON t1.APPL_CODE = t2.APPL_CODE
GROUP BY t2.APPL_CODE
;

SELECT * FROM Q3_onboard_stages;


#3b by Trade
DROP VIEW IF EXISTS Q3_onboard_stages_bytrade;

CREATE VIEW Q3_onboard_stages_bytrade AS
SELECT Trade_Type, Appl_desc, COUNT(TRADE_APP_ID) as Tradie_count
FROM TRADE_APPLICANT as t1
LEFT JOIN APPLICANT_STATUS as t2 
ON t1.APPL_CODE = t2.APPL_CODE
GROUP BY t2.APPL_CODE, Trade_Type
ORDER BY Trade_Type DESC, t2.APPL_CODE ASC
;

SELECT * FROM Q3_onboard_stages_bytrade;

# 4. Are there enough tradies to meet customer needs? 
# (What are the proportion of Tradies to Customers?)
DROP VIEW IF EXISTS Tradies_postcode_count;
DROP VIEW IF EXISTS Customer_postcode_count;

# create tradie count view
CREATE VIEW Tradies_postcode_count AS
SELECT Tradesperson_postcode, COUNT(TRADEPERSON_ID) as Tradie_count
FROM TRADEPERSON as t1
INNER JOIN TRADE_APPLICANT as t2 
ON t1.TRADE_APP_ID = t2.TRADE_APP_ID
GROUP BY Tradesperson_postcode
;

# create customer count view
CREATE VIEW Customer_postcode_count AS
SELECT Customer_postcode, COUNT(CUSTOMER_ID) as Customer_count
FROM CUSTOMER
GROUP BY Customer_postcode
;

# join both both views into a single output
DROP VIEW IF EXISTS Q4_Tradie_to_Cust;

CREATE VIEW Q4_Tradie_to_Cust AS
SELECT Tradesperson_postcode as Postcode, Tradie_count, Customer_count
FROM Tradies_postcode_count as v1
INNER JOIN Customer_postcode_count as v2
on v1.Tradesperson_postcode = v2.Customer_postcode
ORDER BY Postcode ASC
;

SELECT * FROM Q4_Tradie_to_Cust;
