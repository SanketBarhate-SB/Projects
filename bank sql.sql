create database finance;
use finance;

SELECT SUBSTRING(issue_d, -2) AS issue_d_year, sum(loan_amnt) as loan_amount_status
from finance_1
group by issue_d_year
order by issue_d_year asc;

select grade, sub_grade, sum(revol_bal) from finance_1
inner join finance_2
on finance_1.id = finance_2.ï»¿id
group by grade, sub_grade
order by grade,sub_grade;

select verification_status , round(sum(total_pymnt)) as total_payment_status
from finance_1
inner join finance_2
on (finance_1.id=finance_2.ï»¿id)
group by verification_status;


select verification_status, concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_Payment
from finance_1
inner join finance_2
on (finance_1.id=finance_2.ï»¿id)
group by verification_status;

select addr_state,substring(issue_d,1,3) as month_,loan_status
from finance_1;

select home_ownership ,substring(last_pymnt_d,-2) as last_payment_date
from finance_1
inner join finance_2
on finance_1.id=finance_2.ï»¿id



