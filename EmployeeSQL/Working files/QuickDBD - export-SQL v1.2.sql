--DATA ENGINEERING--

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE "departments" ("dept_no" VARCHAR   NOT NULL,
							"dept_name" VARCHAR   NOT NULL,
							CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
						   );

CREATE TABLE "dept_emp" ("emp_no" INT   NOT NULL,
						 "dept_no" VARCHAR   NOT NULL,
						 CONSTRAINT "pk_dept_emp" PRIMARY KEY("emp_no" , "dept_no")
						);

CREATE TABLE "dept_manager" ("dept_no" VARCHAR   NOT NULL,
							 "emp_no" INT   NOT NULL,
							 CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no")
							);

CREATE TABLE "employees" ("emp_no" INT   NOT NULL,
						  "emp_title_id" VARCHAR   NOT NULL,
						  "birth_date" DATE   NOT NULL,
						  "first_name" VARCHAR   NOT NULL,
						  "last_name" VARCHAR   NOT NULL,
						  "sex" VARCHAR   NOT NULL,
						  "hire_date" DATE   NOT NULL,
						  CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
						  );

CREATE TABLE "salaries" ("emp_no" INT   NOT NULL,
						 "salary" INT   NOT NULL,
						 CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no")
						);

CREATE TABLE "titles" ("title_id" VARCHAR   NOT NULL ,
					   "title" VARCHAR   NOT NULL,
					   CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
					  );

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");



--Query -- Selecting * from each table to confirm data
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from employees;
select count(*) from salaries;
select count(*) from titles;

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees 
join salaries on employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees 
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments 
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no =  departments.dept_no
where departments.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "frequency"
from employees 
group by last_name
order by "frequency" desc;


------Bonus----------

