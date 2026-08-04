CREATE TABLE loans (
id INT PRIMARY KEY,
issue_year VARCHAR(5),
issue_date DATE,
final_d INT,
emp_length_int INT,
home_ownership VARCHAR(20),
home_ownership_cat INT,
income_category VARCHAR(15),
annual_inc INT,
income_cat INT,
loan_amount INT,
term VARCHAR(20),
term_cat INT,
application_type VARCHAR(20),
application_type_cat INT,
purpose VARCHAR(20),
purpose_cat INT,
interest_payments VARCHAR(10),
interest_payment_cat INT,
loan_condition VARCHAR(10),
loan_condition_cat INT,
interest_rate FLOAT,
grade VARCHAR(4),
grade_cat INT,
dti FLOAT,
total_pymnt FLOAT,
total_rec_prncp FLOAT,
recoveries FLOAT,
installment FLOAT,
region VARCHAR(20)
);

ALTER TABLE loans
ALTER COLUMN emp_length_int TYPE FLOAT; 

---Display the first 10 records from the table to confirm successful loading.
SELECT * FROM loans LIMIT (10)

ALTER TABLE loans
ALTER COLUMN issue_year TYPE INTEGER
USING issue_year :: INTEGER

---Check the total number of records and distinct loan years.
SELECT COUNT(*) AS total_records FROM loans

SELECT DISTINCT issue_year FROM loans ORDER BY issue_year

----List all unique values for key categorical variables like home_ownership, loan_condition, and purpose.
SELECT DISTINCT home_ownership FROM loans
SELECT DISTINCT loan_condition FROM loans  
SELECT DISTINCT purpose FROM loans

--- Identify missing or null values in critical columns (loan_amount, interest_rate, annual_inc, loan_condition, purpose).

SELECT 
	SUM(CASE WHEN loan_amount IS NULL THEN 1 ELSE 0 END) AS null_loan_amount,
	SUM(CASE WHEN interest_rate IS NULL THEN 1 ELSE 0 END) AS null_interest_rate,
	SUM(CASE WHEN annual_inc IS NULL THEN 1 ELSE 0 END) AS null_annual_inc,
	SUM(CASE WHEN loan_condition IS NULL THEN 1 ELSE 0 END) AS null_loan_conditions,
	SUM(CASE WHEN purpose IS NULL THEN 1 ELSE 0 END) AS null_purpose_count
FROM loans

--- Replace missing income values with the median income of all borrowers.

SELECT ROUND(AVG(annual_inc),0) AS avg_income FROM loans

---Standardize categorical values — for example, convert all home_ownership entries to uppercase for consistency.

UPDATE loans
SET home_ownership = UPPER(home_ownership);

---Create a new column profitability that measures the difference between total_pymnt and loan_amount.
ALTER TABLE loans
ADD COLUMN profitability DECIMAL(15,2);

UPDATE loans
SET profitability = total_pymnt - loan_amount

---Create a new column risk_flag based on the loan condition:
ALTER TABLE loans
ADD COLUMN risk_flag INT;

UPDATE loans
SET risk_flag = CASE WHEN loan_condition = 'Bad Loan' THEN 1 ELSE 0 END;

SELECT loan_condition,
       risk_flag,
       COUNT(*) AS total
FROM loans
GROUP BY loan_condition, risk_flag;

----Create a new table loans_cleaned containing only cleaned and transformed records (no nulls in key fields).

CREATE TABLE loans_cleaned AS
SELECT *
FROM loans
WHERE loan_amount IS NOT NULL
AND interest_rate IS NOT NULL
AND annual_inc IS NOT NULL
AND loan_condition IS NOT NULL
AND purpose IS NOT NULL;

---Add a default_rate_indicator column that computes the ratio of defaulted loans (Bad Loan) to total loans within the same year.

ALTER TABLE loans_cleaned
ADD COLUMN default_rate_indicator DECIMAL(10, 2)

SELECT * FROM loans_cleaned limit 10

UPDATE loans_cleaned lc
SET default_rate_indicator = yr.default_rate
FROM (
    SELECT
        issue_year,
        SUM(CASE
                WHEN loan_condition = 'Bad Loan'
                THEN 1
                ELSE 0
            END)::NUMERIC
        /
        COUNT(*) AS default_rate
    FROM loans_cleaned
    GROUP BY issue_year
) yr
WHERE lc.issue_year = yr.issue_year;

---Extract loan term as numeric value (e.g., convert ‘36 months’ → 36).

ALTER TABLE loans_cleaned
ADD COLUMN term_numeric INT;

UPDATE loans_cleaned 
SET term_numeric = REPLACE(term, 'months', '') :: INTEGER

SELECT * from loans_cleaned limit 10

-----Add a new column income_to_loan_ratio calculated as the borrower’s annual income divided by the loan amount.

ALTER TABLE loans_cleaned
ADD COLUMN income_to_loan_ration DECIMAL(15, 4)

UPDATE loans_cleaned
SET income_to_loan_ration = annual_inc / loan_amount;

ALTER TABLE loans_cleaned
RENAME COLUMN income_to_loan_ration TO income_to_loan_ratio;

