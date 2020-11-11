--DATA ENGINEERING--

-- Dropping tables if they exist--
Drop table if exists departments;
Drop table if exists dept_emp;
Drop table if exists dept_manager;
Drop table if exists employees;
Drop table if exists salaries;
Drop table if exists titles;
-------------------
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");



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
select employee number, last name, first name, sex, and salary.





-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

