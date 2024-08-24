--First we add the cleanup script
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_Emp CASCADE;
DROP TABLE IF EXISTS Dept_Manager CASCADE;

--Assuming we start from a blank slate
--Create the tables in above order
CREATE TABLE Titles (
	title_id VARCHAR(255) PRIMARY KEY NOT NULL,
	title VARCHAR(255)
);

CREATE TABLE Employees (
	emp_no BIGSERIAL PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE
);

CREATE TABLE Salaries (
	emp_no BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	salary BIGINT
);

CREATE TABLE Departments (
	dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255)
);

--Create the junction tables
CREATE TABLE Dept_Emp (
	emp_no BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Dept_Manager (
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	emp_no BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

