-- Select data from employees and titles and insert into Retirement table.
-- Using birth_date from the employees table, filter for only people born between 1952 and 1955.
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
into retirement
from employees as e
left join titles as t on e.emp_no = t.emp_no
where (e.birth_date >= '1952-01-01' and e.birth_date <= '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
select distinct on (emp_no) emp_no, first_name, last_name, title
into unique_titles
from retirement
where to_date = '9999-01-01'
order by emp_no, to_date desc;

-- Count the number of employees about to retire by title
select u.title, count(u.title) as "title count"
into retiring_titles
from unique_titles as u
group by u.title
order by "title count" desc;
