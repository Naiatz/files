drop table employees
create table employees
(
	Employee_id INT identity(1,1) primary key,
	Last_name VARCHAR(20) not null,
	Hire_date DATETIME default(GETDATE()) not null,
	Salary money default (5000) not null,
	Email VARCHAR(30) not null unique,
	Department_ID INT,
	FOREIGN KEY (Department_ID) REFERENCES Departments(department_id)
)