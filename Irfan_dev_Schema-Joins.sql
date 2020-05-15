-------------------------
----- SQL Joins --------

-- # Author : Irfan Khan Mohammed ---

select * from employee;
select * from department;

----Cross Join------

select e.name ,e.empno, d.deptno from
employee e  cross join department d;

----Right Outer Join----------

select e.name, e.empno, e.salary, d.DEPTNO from
employee e right outer join department d
on e.deptno=d.deptno order by deptno;

-------Left Outer Join------------

select d.deptno, d.name, e.empno, e.name from
department d right outer join employee e
on d.DEPTNO=e.DEPTNO;

--------Self Join----------

select e.empno, e.name, b.boss
from employee e, employee b where
e.empno=b.boss;

select e.empno, e.name, b.MANAGER_ID
from employee e join employee b on
e.empno=b.empno;

select * from employee;

select e.name as Employee, m.name as Manager 
from employee e left outer join employee m
on e.manager_id=m.empno;

---------------------------------------

















