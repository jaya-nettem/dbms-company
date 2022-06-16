use company;

create table Employee( Fname varchar(10), Minit char, Lname varchar(10), Ssn varchar(9) primary key, Bdate date, Address varchar(50), Sex char, Salary float, Dno int, Pteamno int );
INSERT INTO Employee VALUES("John", "B", "Smith", "123456789", "1965-01-09", "731 Fondren, Houstan, TX", "M", 30000, 1, 2);
INSERT INTO Employee VALUES("Franklin", "T", "Wong", "333445555", "1955-12-08", "638 Voss, Houston, TX", "M", 40000, 2, 3);
INSERT INTO Employee VALUES("Alicia", "T", "Zelaya", "999887777", "1968-01-19", "3321 Castle, Spring, TX", "F", 25000, 3, 1);
INSERT INTO Employee VALUES("Jennifer", "S", "Wallace", "987654321", "1941-06-20", "291 Berry, Bellaire, TX", "F", 43000, 1, 2);
INSERT INTO Employee VALUES("Ramesh", "K", "Narayan", "666884444", "1962-09-15", "975 Fire Oak, Humble, TX", "M", 38000, 2, 3);

create table Department( Dname varchar(20), Dnumber int primary key, Mgrssn varchar(10));
INSERT INTO Department VALUES("Research", 1, "123456789");
INSERT INTO Department VALUES("Administration", 2, "333445555");
INSERT INTO Department VALUES("Headquarters", 3, "999887777");

create table Project( Pname varchar(10), Pteamno int primary key, Dno int);
insert into Project values("ProjectX", 3, 2);
insert into Project values("ProjectY", 1, 3);
insert into Project values("ProjectZ", 2, 1);

create table Skills( Essn varchar(9), Sname varchar(20), YearsOfExp int, primary key(essn, sname));
insert into Skills values("123456789", "Linux", 5);
insert into Skills values("123456789", "Technical Support", 4);
insert into Skills values("333445555", "AI and ML", 3);
insert into Skills values("333445555", "Linux", 2);
insert into Skills values("999887777", "Oracle", 4);
insert into Skills values("987654321", "Python", 6);
insert into Skills values("666884444", "Oracle", 3);

alter table Employee add foreign key (Dno) references Department (Dnumber);
alter table Employee add foreign key (Pteamno) references Project (Pteamno);
alter table Department add foreign key (Mgrssn) references Employee (Ssn);
alter table Project add foreign key (Dno) references Department (Dnumber);
alter table Skills add foreign key (Essn) references Employee (Ssn);

-- Basic Queries

-- 1. Retrieve the birthdate and address of the employee whose name is "John B. Smith"
select bdate, address from Employee where Fname = "John" and Minit = "B" and Lname = "Smith";

-- 2. List the employees working in department 1
select * from Employee where dno = 1;

-- 3. find all the employees who have more than one skill.
select essn from Skills group by essn having count(*) >= 2; 

-- 4. find all employee working in "Research" department.
select fname from Employee, Department where dno = dnumber and dname = "Research";

-- 5. List the names and salaries of employees earning a salary of 35000 or more.
select fname from employee where salary >= 35000;

-- Q6. Retrieve the names of managers of each department
select fname from employee, department where dno = dnumber and mgrssn = ssn;

-- Q7. Retrieve the names of employees who work in project team 3.
select fname from employee, project where employee.pteamno = project.pteamno and project.pteamno = 3;

-- Q8. Count the number of employees working in each project;
select count(*), p.pteamno from employee as e, project as p where e.pteamno = p.pteamno group by p.pteamno;
select * from Employee;
select * from Department;
select * from Project;
select * from Skills;
