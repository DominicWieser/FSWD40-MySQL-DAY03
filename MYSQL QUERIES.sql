
/* 
1. Report:
	How many rows do we have in each table in employees database?
 */
 	/*DISPLAY EVERY ROW IN DATABASE --> SUM*/
	SELECT SUM(TABLE_ROWS) 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'employees';
    /*DISPLAY EVERY ROW IN EVERY TABLE*/
    SELECT table_name, table_rows
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'employees';
/*
2. Report:
	How many employees with the first name "Mark" do we have in our company?
*/
	SELECT COUNT(first_name)
	FROM employees
    WHERE first_name = 'Mark';
/*
3. Report:
	How many employees with the first name "Eric" and the last name beginning with "A" do we have in our company?
*/
	SELECT COUNT(first_name)
	FROM employees
    WHERE first_name = 'Eric'
    and last_name
    LIKE 'A%';
/*
4. Report:
	How many employees do we have that are working for us since 1985 and who are they?
*/
	SELECT hire_date, first_name
	FROM employees
	WHERE hire_date >= 1985
/*
5. Report:
	How many employees got hired from 1990 until 1997 and who are they?
*/
	SELECT first_name
	FROM employees
	WHERE hire_date >= '1990-01-01' and hire_date <= '1997-12-31'
/*
6. Report:
	How many employees have salaries higher than EUR 70 000,00 and who are they? 
*/
	/*YOU CANT COMBINE COUNT AND DISPLAY QUERIES*/
	/*
	SELECT COUNT(*)
	FROM employees
	INNER JOIN salaries
	ON salaries.emp_no = employees.emp_no
	WHERE salary > 70000
	*/

	SELECT employees.first_name, salaries.salary
	FROM employees
	INNER JOIN salaries
	ON salaries.emp_no = employees.emp_no
	WHERE salary > 70000
/*
7. Report:
	How many employees do we have in the Research Department, who are working for us since 1992 and who are they? 
*/
	SELECT employees.first_name, departments.dept_name
	FROM employees
	LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE departments.dept_no = 'd008' and dept_emp.from_date >= '1992-01-01'
/*
8. Report:
	How many employees do we have in the Finance Department, who are working for us since 1985 until now and who have salaries higher than EUR 75 000,00 - who are they?
*/
	SELECT employees.first_name, departments.dept_name, dept_emp.from_date, salaries.salary
	FROM employees
	LEFT JOIN salaries ON salaries.emp_no = employees.emp_no
	LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE dept_emp.from_date between '1985-01-01' and '2018-06-14' and departments.dept_no = 'd002'
/*
9. Report:
	We need a table with employees , who are working for us at this moment: first and last name, date of birth, gender, hire_date, title and salary.
*/
	SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary
	FROM employees
	LEFT JOIN titles ON titles.emp_no = employees.emp_no
	LEFT JOIN salaries ON salaries.emp_no = employees.emp_no
	WHERE salaries.to_date = '9999-01-01'
