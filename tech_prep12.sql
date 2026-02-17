create database techprep12;
use techprep12;

-- create table  

CREATE TABLE employees ( 
EMPNO INTEGER PRIMARY KEY, 
ENAME varchar(255) NOT NULL, 
JOB varchar(255) NOT NULL, 
MGR INTEGER, 
HIREDATE date NOT NULL, 
Salary INTEGER NOT NULL, 
COMM varchar(255), 
DEPTNO INTEGER NOT NULL 
); 
-- insert
INSERT INTO employees  
VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20), 
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30), 
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30), 
(7566, 'JONES', 'MANAGER', 7839, '1980-08-02', 2975, NULL, 20), 
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30), 
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30), 
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 20), 
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3100, NULL, 30), 
(7839, 'KING', 'PRESIDENT',NULL , '1981-11-17', 5000, NULL, 10), 
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30), 
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20), 
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30), 
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20), 
(7934, 'MILLER', 'CLERK', 7782, '1983-01-23', 1300, NULL, 20);



-- CREATE TABLE 2"  
CREATE TABLE depts ( 
DEPTNO INTEGER PRIMARY KEY, 
DNAME varchar(255) NOT NULL, 
Location varchar(255) NOT NULL 
);

 -- insert  
INSERT INTO depts  
VALUES (10, 'accounting', 'New York'), 
(20, 'research', 'Dallas'), 
(30, 'sales', 'Chicago'), 
(40, 'operations', 'Boston');
select * from depts;
select *from employees;

-- Q1(A): Display all the information of the EMP table?
select * from employees;


-- Q1 (B):  Display unique Jobs from EMP table? 
select distinct job from employees;

-- Q1(C): List the emps in the asc order of their Salaries
select ename, salary from employees order by salary asc;

-- Q1(D); List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from employees order by deptno asc ,job desc ;

-- Q1(E): Display all the unique job groups in the descending order?
select distinct  job  from employees order by job desc;

-- Q1(F): Display all the details of all ‘Mgrs’
select m.* from employees e inner join employees m 
on e.mgr=m.empno;

-- Q1(G): List the emps who joined before 1981. 
select *from employees;
select ename,hiredate from employees where hiredate < '1981-01-01';

-- Q1(H) List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.     
select empno,ename,salary,salary/30 as daily_sal,salary*12 as annual_sal from employees order by annual_sal asc;

-- check1  
-- 2.9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
select empno ,ename,job,hiredate,timestampdiff(year,hiredate,curdate()) as exp from employees where empno in (select mgr from employees where mgr is not null) ;

-- 2.10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7698. 
select empno,ename,salary ,timestampdiff(year,hiredate,curdate()) as exp from employees  where mgr=7698;

-- 2.11. Display all the details of the emps whose Comm. Is more than their Sal. 
select * from employees where comm>salary;


select * from employees;
select * from depts;

-- 2.12: List the emps in the asc order of Designations of those joined after the second half of 1981
select ename,job as designation, hiredate from employees having hiredate>'1981-06-01' order by job asc;

-- 2.14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order 
select ename, job from employees where job='clerk' or job='analyst' order by ename desc;

-- 2.15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN80 in asc order of seniority. 
select ename,hiredate from employees where hiredate in('1980-01-19','1981-12-17','1981-12-03','1981-05-01') order by hiredate asc;

-- 2.16. List the emp who are working for the Deptno 10 or20 
select  empno,ename,deptno from employees where deptno in(10,20);

--  2.17. List the emps who are joined in the year 81 
select empno,ename,hiredate from employees where year(hiredate)=1981;

--  2.18. List the emps who are joined in the month of Aug 1980.WHERE HIREDATE   
select empno,ename,hiredate from employees where month(hiredate)=8 and year(hiredate)=1980;

select * from employees;

--  2.19. List the emps Who Annual sal ranging from 22000 and 45000. 
select empno,ename,salary*12 as annual_sal from employees where salary*12 between 22000 and 45000;

-- 2.20. List the Enames those are having five characters in their Names. 
select ename from employees where ename like '_____';

-- 2.21. List the Enames those are starting with ‘S’ and with five characters. 
select ename from employees where ename like's____';

-- 2.22. List the emps those are having four chars and third character must be ‘r’. 
select ename from employees where ename like '__r_';

-- 2.23. List the Five character names starting with ‘S’ and ending with ‘H’. 
select ename from employees where ename like 's___h';

-- 2.24. List the emps who joined in January 
select ename, hiredate from employees where month(hiredate)=1;
select * from employees;

-- 2.25. List the emps who joined in the month of which second character is ‘a’.                           
select ename,hiredate,monthname(hiredate) as monthname from employees where monthname(hiredate) like '_a%';

-- 2.26. List the emps whose Sal is four digit number ending with Zero. 
select ename,salary as sal from employees where salary like '___0';

-- 2.27. List the emps whose names having a character set ‘ll’ together.    -- %: for matching zero or more characters
select ename from employees where ename like '%ll%';

-- 2.28. List the emps those who joined in 80’s. 
select * from employees where year(hiredate) between 1980 and 1989;
select * from employees;

-- 2.29. List the emps who does not belong to Deptno 20 
select * from employees where deptno not in (20);

-- 2.30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries. 
select empno,ename,salary,job from employees where job not in('president','manager') order by salary asc;

--  2.31. List all the emps who joined before or after 1981. 
select ename,job,hiredate from employees where year(hiredate) <> '1981';

--  2.32. List the emps whose Empno not starting with digit78. 
select * from employees where empno not like '78%';

-- 2.33. List the emps who are working under ‘MGR’. 
select e.empno,e.ename from employees e inner join employees m on e.mgr=m.empno where m.job='manager' ;

-- 2.34. List the emps who joined in any year but not belongs to the month of March. 
select * from employees where monthname(hiredate)<>'march';

-- 2.35. List all the Clerks of Deptno 20. 
select * from employees where job='clerk' and deptno=20;

-- 2.36. List the emps of Deptno 30 or 10 joined in the year 1981 
select * from employees where deptno in(30,10) and year(hiredate)=1981;

-- 2.37. Display the details of SMITH 
select e.*,d.dname,d.location from employees e inner join depts d on e.deptno=d.deptno where e.ename='smith';

-- 2.38. Display the location of SMITH. 
select e.ename,d.location from employees e inner join depts d on e.deptno=d.deptno where e.ename='smith';

-- 2.39. List the total information of EMP table along with DNAME and Loc of 
select e.* ,d.dname,d.location from employees e left join depts d on e.deptno=d.deptno;
select * from depts;
select *from employees;
-- 2.40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘RESEARCH’  working in New York, Dallas with an exp more than 7 years without receiving 
-- the Comm asc order of Loc. 
 select e.empno,e.ename,e.hiredate,e.salary,d.dname,d.location from employees e 
 inner join depts d on e.deptno=d.deptno
 where d.dname='research' and e.job='manager'
 and d.location in('new york','dallas') and
 TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) >7 and
 e.comm is null order by d.location asc;
 
 --  2.41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000,  
-- but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of 
-- Deptno and desc order of job.
select e.empno,e.ename,e.salary,e.salary*12 as annual_sal ,e.job,e.deptno,d.dname,d.location from employees e inner join depts d 
on e.deptno=d.deptno where (d.location='chicago' or d.dname='accounting') and  e.salary*12>28000 and  e.salary not in (3000,2800) and e.job<>'manager' and ( e.empno like '__7%' or e.empno like '__8%')
order by e.deptno asc , e.job desc;