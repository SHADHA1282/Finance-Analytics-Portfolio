-- ============================================
-- BANKING & FINANCE SQL PROJECT
-- Concepts: JOINs, CTEs, Window Functions, Views, Stored Procedures
-- ============================================

-- TABLES
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  city VARCHAR(50),
  segment VARCHAR(20)
);

CREATE TABLE transactions (
  txn_id INT PRIMARY KEY,
  customer_id INT,
  txn_date DATE,
  txn_type VARCHAR(20),
  amount DECIMAL(12,2),
  channel VARCHAR(20)
);

CREATE TABLE loans (
  loan_id INT PRIMARY KEY,
  customer_id INT,
  loan_type VARCHAR(30),
  principal DECIMAL(12,2),
  interest_rate DECIMAL(5,2),
  tenure_months INT,
  status VARCHAR(20)
);

CREATE TABLE repayments (
  repayment_id INT PRIMARY KEY,
  loan_id INT,
  due_date DATE,
  paid_date DATE,
  amount_due DECIMAL(12,2),
  amount_paid DECIMAL(12,2)
);

CREATE TABLE financials (
  period VARCHAR(10),
  revenue DECIMAL(14,2),
  operating_expenses DECIMAL(14,2),
  loan_interest_income DECIMAL(14,2),
  provisions DECIMAL(14,2)
);

-- SAMPLE DATA
INSERT INTO customers VALUES
(1,'Aisha Khan','Mumbai','Retail'),
(2,'Ravi Mehta','Delhi','SME'),
(3,'Priya Nair','Bangalore','Corporate'),
(4,'Omar Farooq','Chennai','Retail'),
(5,'Sneha Iyer','Hyderabad','SME');

INSERT INTO transactions VALUES
(1,1,'2024-01-05','Credit',50000,'Online'),
(2,1,'2024-01-15','Debit',12000,'ATM'),
(3,2,'2024-01-10','Credit',150000,'Branch'),
(4,2,'2024-02-01','Debit',40000,'Online'),
(5,3,'2024-01-20','Credit',500000,'Branch'),
(6,3,'2024-02-10','Debit',200000,'Online'),
(7,4,'2024-02-05','Credit',30000,'ATM'),
(8,5,'2024-02-15','Credit',80000,'Online'),
(9,5,'2024-03-01','Debit',25000,'Branch');

INSERT INTO loans VALUES
(1,1,'Personal',200000,12.5,36,'Active'),
(2,2,'Business',1500000,10.0,60,'Active'),
(3,3,'Home',5000000,8.5,240,'Active'),
(4,4,'Personal',100000,14.0,24,'Defaulted'),
(5,5,'Business',800000,11.0,48,'Closed');

INSERT INTO repayments VALUES
(1,1,'2024-01-31','2024-01-30',6000,6000),
(2,1,'2024-02-29','2024-03-05',6000,6000),
(3,2,'2024-01-31','2024-01-31',28000,28000),
(4,2,'2024-02-29','2024-02-28',28000,28000),
(5,3,'2024-01-31','2024-01-31',45000,45000),
(6,4,'2024-01-31','2024-02-15',5000,2000),
(7,4,'2024-02-29',NULL,5000,0),
(8,5,'2024-01-31','2024-01-31',20000,20000);

INSERT INTO financials VALUES
('2024-01',850000,420000,95000,30000),
('2024-02',920000,450000,102000,25000),
('2024-03',780000,390000,88000,40000),
('2024-04',1050000,480000,115000,20000);

-- ============================================
-- 1. JOINs: Customer Transaction Summary
-- ============================================
SELECT c.customer_name, c.segment,
  COUNT(t.txn_id) AS total_txns,
  SUM(t.amount) AS total_volume
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_name, c.segment
ORDER BY total_volume DESC;

-- ============================================
-- 2. CTEs: Loan Default Risk Analysis
-- ============================================
WITH loan_summary AS (
  SELECT l.loan_id, l.customer_id, l.principal,
    SUM(r.amount_paid) AS total_paid,
    l.principal - SUM(r.amount_paid) AS outstanding
  FROM loans l
  LEFT JOIN repayments r ON l.loan_id = r.loan_id
  GROUP BY l.loan_id, l.customer_id, l.principal
),
risk_flag AS (
  SELECT *,
    CASE 
      WHEN outstanding > principal * 0.5 THEN 'High Risk'
      WHEN outstanding > 0 THEN 'Medium Risk'
      ELSE 'Cleared'
    END AS risk_level
  FROM loan_summary
)
SELECT c.customer_name, r.principal, r.outstanding, r.risk_level
FROM risk_flag r
JOIN customers c ON r.customer_id = c.customer_id
ORDER BY r.outstanding DESC;

-- ============================================
-- 3. Window Functions: Running Balance & Ranking
-- ============================================
SELECT customer_id, txn_date, txn_type, amount,
  SUM(CASE WHEN txn_type = 'Credit' THEN amount ELSE -amount END)
    OVER (PARTITION BY customer_id ORDER BY txn_date) AS running_balance,
  RANK() OVER (ORDER BY amount DESC) AS txn_rank
FROM transactions;

-- ============================================
-- 4. View: Monthly P&L Dashboard
-- ============================================
CREATE VIEW vw_monthly_pnl AS
SELECT period, revenue, operating_expenses,
  loan_interest_income, provisions,
  (revenue + loan_interest_income - operating_expenses - provisions) AS net_profit,
  ROUND((revenue + loan_interest_income - operating_expenses - provisions) / revenue * 100, 2) AS net_margin_pct
FROM financials;

SELECT * FROM vw_monthly_pnl ORDER BY period;

-- ============================================
-- 5. Stored Procedure: Loan Status Report
-- ============================================
DELIMITER //
CREATE PROCEDURE GetLoanStatus(IN p_status VARCHAR(20))
BEGIN
  SELECT l.loan_id, c.customer_name, l.loan_type,
         l.principal, l.interest_rate, l.status
  FROM loans l
  JOIN customers c ON l.customer_id = c.customer_id
  WHERE l.status = p_status;
END //
DELIMITER ;

CALL GetLoanStatus('Defaulted');
CALL GetLoanStatus('Active');
