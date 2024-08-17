SELECT * FROM bank_loan.bank_loan_;
UPDATE bank_loan_
SET issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');
describe bank_loan_;

-- 1.Total loan applications
select count(id) as Total_loan_appllication from bank_loan_ ;

-- 2.Month-to-date Loan Applications
select count(id) as MTD_Total_loan_appllication from bank_loan_ 
where month(issue_date)='12' and year(issue_date)='2021';

-- 3.Previous-month-to-date Loan Applications
select count(id) as PMTD_Total_loan_appllication from bank_loan_ 
where month(issue_date)=11 and year(issue_date)=2021;

-- 4.Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from bank_loan_;

-- 5.MTD Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_
where month(issue_date)=12 and year(issue_date)=2021;

-- 6.PMTD Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_
where month(issue_date)=11 and year(issue_date)=2021;

-- 7.Total Amount Recieved
select sum(total_payment) as Total_Amount_Recieved from bank_loan_;

-- 8.MTD Total Amount Received
select sum(total_payment) as MTD_Total_Amount_Recieved from bank_loan_
where month(issue_date)=12 and year(issue_date)=2021;

-- 9.PMTD Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_Recieved from bank_loan_
where month(issue_date)=11 and year(issue_date)=2021;

-- 10.Average Interest Rate
select avg(int_rate)*100 as AVG_Interest_rate from bank_loan_;

-- 11.MTD Average Interest
select avg(int_rate)*100 as MTD_AVG_Interest_rate from bank_loan_
where month(issue_date)=12 and year(issue_date)=2021; 

-- 12.PMTD Average Interest
select avg(int_rate)*100 as PMTD_AVG_Interest_rate from bank_loan_
where month(issue_date)=11 and year(issue_date)=2021;

-- 13.Avg Debt-to-income
select avg(dti)*100 as AVG_DTI from bank_loan_;

-- 14.MTD Avg DTI
select avg(dti)*100 as MTD_AVG_DTI from bank_loan_
where month(issue_date)=12 and year(issue_date)=2021;

-- 15.PMTD Avg DTI
select avg(dti)*100 as PMTD_AVG_DTI from bank_loan_
where month(issue_date)=11 and year(issue_date)=2021;

-- 16.Good Loan Percentage
select(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100.0)/count(id) as Good_Loan_Percentage
from bank_loan_;

-- 17.Good Loan Application
select count(id) as Good_loan_application from bank_loan_
where loan_status= 'Fully Paid' or loan_status = 'Current';

-- 18.Good Loan Funded Amount
select sum(loan_amount) as Good_loan_funded_amount from bank_loan_
where loan_status= 'Fully Paid' or loan_status = 'Current';

-- 19.Good Loan Amount Received
select sum(total_payment) as Good_loan_amount_received from bank_loan_
where loan_status= 'Fully Paid' or loan_status = 'Current';

-- 20.Bad Loan Percentage
select (count(case when loan_status='Charged Off' then id end)*100.0)/count(id) as Bad_loan_percentage
from bank_loan_;

-- 21.Bad Loan Applications
select count(id) as Bad_loan_application from bank_loan_ where loan_status='Charged Off';

-- 22.Bad Loan Funded Amount
select sum(loan_amount) as Bad_loan_funded_amount from bank_loan_ where loan_status='Charged Off';

-- 23.Bad Loan Amount Received
select sum(total_payment) as Bad_loan_amount_recieved from bank_loan_ where loan_status='Charged Off';

-- LOAN STATUS
select loan_status,
count(id) as Total_loan_applications,
sum(total_payment) as Total_amount_received,
sum(loan_amount) as Total_funded_amount,
avg(int_rate*100) as Interest_rate,
avg(dti) as DTI 
from bank_loan_
group by loan_status; 

-- MTD LOAN STATUS
select loan_status,
sum(total_payment) as MTD_Total_amount_recieved,
sum(loan_amount) as MTD_Total_funded_amount from bank_loan_
where month(issue_date)=12 and year(issue_date)=2021
group by loan_status;

-- MONTH
select month(issue_date) as Month_number,
monthname(issue_date) as Month_name,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by month(issue_date),monthname(issue_date)
order by month(issue_date);

-- STATE
select address_state as State,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by address_state
order by address_state;

-- TERM
select term as Term,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by term
order by term;

-- EMPLOYEE LENGTH
select emp_length as Employee_length,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by emp_length
order by emp_length;

-- PURPOSE
select purpose as Purpose,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by purpose
order by purpose;


-- HOME OWNERSHIP
select home_ownership as Home_ownership,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received from bank_loan_
group by home_ownership
order by home_ownership;