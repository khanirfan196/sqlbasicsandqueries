
-- # Author : Irfan Khan Mohammed -------

---- Topics (Tutorials categorized into folders) -------------

-- 1) Pl/SQL intro, If-else, Loops, Constants, Data types, Variables. 
-- 2) Triggers.
-- 3) Cursors.
-- 4) Record Data type.
-- 5) Functions - Stored Proc - Packages.
-- 6) Exception Handling.
-- 7) Collections.
-- 8) Cursors Continuation.
-- 9) Bulk Collect.
-- 10) FORALL 
-- 11) Native Dynamic SQL.

---------===== PL/SQL TUTORIALS=======---------

--Variables

SET SERVEROUTPUT ON;

declare 
v_test varchar2(15);
begin
v_test:='irfankhan';
DBMS_OUTPUT.PUT_LINE(v_test);
end;
/

DECLARE
name varchar2(20);
roll int(20);
begin
name:='irfankhan';
roll:=15;
dbms_output.put_line(name);
dbms_output.put_line(roll);
end;
/


---Initializing Variables with "Select" statement------

set serveroutput on;

declare
v_salary varchar2(20);
begin
select salary into v_salary FROM employee where empno=7566;
dbms_output.put_line(v_salary);
end;
/

declare 
v_salary varchar2(20);
v_firstname varchar2(20);
begin
select name, salary into v_firstname, v_salary from employee where empno=7566;
DBMS_OUTPUT.PUT_LINE(v_firstname || 'has salary of ' || v_salary);
end;
/

------ANCHORED DATATYPE-------------

declare 
v_name EMPLOYEE.NAME%type; --anchored declaration which is depend on table column data type.
begin
select name into v_name from employee where empno = 7698;
dbms_output.put_line(v_name);
end;
/

---------CONSTANTS IN PL/SQL------------
    
declare
v_pi constant int(10):=3;  -- constant keyword-----
begin
dbms_output.put_line(v_pi);
end;
/

declare
v_pi constant int(10) default 3;  --- default keyword----
begin
DBMS_OUTPUT.PUT_LINE(v_pi);
end;
/

declare
v_pi l;, mconstant int(10) NOT NULL default 3;  --- NOT NULL keyword----
begin
DBMS_OUTPUT.PUT_LINE(v_pi);
end;
/

-------BIND VARIABLE----------

variable v_bind varchar(20);  ---variable keyword-----
exec :v_bind:='irfankhan';    ----exec keyword while initializing-----

begin
:v_bind:='irfankhan';         ----initializing inside begin----------
end;
/

set autoprint on;
variable v_irfan varchar2(20);
exec :v_irfan:='irfankhan';
--print v_irfan; -- without print statement, the bind variable is printing on the console.----


----CONDITION CONTROL STATEMENTS---------------
--If then Statement-----

declare
v_num int(10):=9;
begin
if v_num<10 then
dbms_output.put_line('Inside the if then statement');
end if;
dbms_output.put_line('Outside the statement');
end;
/

declare
v_name varchar2(20):='irfankhan';
v_job varchar2(10):='developer';
begin
if v_name='irfankhan' and v_job='developer' then     ---- with and keyword connecting two conditions-------
dbms_output.put_line('everything is great');
end if;
dbms_output.put_line('its nothing');
end;
/


----IF THEN ELSE Statement---------

set serveroutput on;

declare
v_num number := &_enter_number;
begin
IF mod(v_num,2)=0 THEN 
dbms_output.put_line('The number ' || v_num ||' is an even number');
else
dbms_output.put_line('The number ' || v_num ||' is an odd number');
end if;
DBMS_OUTPUT.PUT_LINE('We are out of the if else then statement');
end;
/

--- IF THEN ELSE IF Statement----------

declare
v_place varchar(20) := '&_Enter_any_place';
begin
if v_place = 'Hyderabad' Then
dbms_output.put_line('This is in India');
elsif v_place = 'Chicago' Then
DBMS_OUTPUT.PUT_LINE('This is in USA');
elsif v_place = 'Singapore' Then
dbms_output.put_line('This is in Malaysia');
else
dbms_output.put_line('This is a new place');
end if;
dbms_output.put_line('Thanks for learning');
end;
/

------- LOOPS (ITERATIVE SYNTAX) IN PL/SQL ----------------
--Types of loops in pl/sql.
--1) Simple Loop
--2) While Loop
--3) Numeric For Loop
--4) Cursor Loop

----- SIMPLE LOOP ------------

DECLARE
v_const number := 0;
v_result number;
begin
 loop
 v_const :=v_const+1;
 v_result := 19 * v_const;
 dbms_output.put_line('19' || ' * ' || v_const || ' = ' || v_result);
 if v_const >= 10 then  --- here we are using the if condition to stop the loop, otherwise the loop is infinite.----
 exit;
 end if;
 end loop;
 end;
 /
 
 
 DECLARE
v_const number := 0;
v_result number;
begin
 loop
 v_const :=v_const+1;
 v_result := 19 * v_const;
 dbms_output.put_line('19' || ' * ' || v_const || ' = ' || v_result);
 exit when v_const <= 10; -- here, instead of if statement we are using exit when clause to terminate the loop -----
 end loop;
 end;
 /

---- WHILE LOOP ----------

DECLARE
v_const number := 1;
v_result number;
begin
while v_const <= 10 loop
v_result := 19 * v_const;
dbms_output.put_line(' 19 '|| ' * ' || v_const || ' = ' || v_result);
v_const := v_const + 1;
end loop;
dbms_output.put_line('Outside of the While loop');
end;
/


Declare
v_constant Boolean := true;
v_number number := 1;
begin
while v_constant loop
v_number := v_number + 1;
dbms_output.put_line(v_number);
if v_number >= 10 then --- terminating the loop using if condition-----
v_constant := false;
end if;
end loop;
end;
/

--- FOR LOOP -------

-- the loop started without the declare statement-----
begin
for v_variable in 1 .. 10 loop --- the .. are range operators, the range here is 1 to 10. loop starts at 1 and end at 10 ------
dbms_output.put_line(v_variable);
end loop;
dbms_output.put_line('we are outside the loop');
end;
/


begin
for v_variable in reverse 1 .. 5 loop -- the reverse keyword runs the loop in reverse direction i.e. 10 to 1 ----
dbms_output.put_line(v_variable);
end loop;
dbms_output.put_line('we are outside the loop');
end;
/

declare
v_result number;
begin
for v_variable in  1 .. 10 loop 
v_result := 9 * v_variable;
dbms_output.put_line( ' 9  * ' || v_variable ||' = ' || v_result );
end loop;
dbms_output.put_line('we are outside the loop');
end;
/

----------------------- TRIGGERS IN PLSQL --------------------------
--Definition = Specialized stored programs which executes 
--implicitly when a triggering event occurs. ---
-- Events could be,
-- A DML Statement like update, insert, delete on a table
-- A DDL Statement like create, alter,
-- A System event like shutting or starting up a database
-- A User event like logging on or off

-- Types of Triggers ----
-- DML Triggers
-- DDL Triggers
-- System/Database Triggers
-- InsteadOf Triggers
-- Compound Triggers

-- Uses of Triggers ----
-- 1) Enforce Business Rules, which cannot be defined with the help of Integrity Constraints ----
-- 2) Gain Control Over Security
-- 3) Collect Statistical Information (ex: number of loggin on table or retrieving info)
-- 4) Automatically Generates Values (ex: auto increment numeric primary key) 
-- 5) Prevent Invalid Transactions

-- Syntax for Trigger 
CREATE [or REPLACE] TRIGGER trigger_name {BEFORE|AFTER} Triggering_event 
ON table_name [FOR EACH ROW] [FOLLOWS another_trigger_name] [ENABLE/DISABLE]
[WHEN condition]

--- Trigger Demo (DML)----

create table superheroes(
	sh_name varchar2(20)
	);
	
set serveroutput on;

CREATE OR REPLACE TRIGGER my_trigger_heroes
before insert on superheroes
for each row
enable
declare
	v_user varchar2(20);
begin
	select user into V_user from dual;
	dbms_output.put_line('You just inserted a line Mr. ' || v_user);
end;
/

--- or, the above code can be modify as -----------------


create table superheroes(
	sh_name varchar2(20)
	);
	
set serveroutput on;

CREATE OR REPLACE TRIGGER my_trigger_heroes
before insert or update or delete on superheroes
for each row
enable
declare
	v_user varchar2(20);
begin
	select user into V_user from dual;
	if inserting then
	dbms_output.put_line('One row entered by ' || v_user);
	elsif deleting then
	dbms_output.put_line('One row deleted by ' || v_user);
	elsif updating then
	dbms_output.put_line('One row updated by ' || v_user);
	end if; 
end;
/

-------- Table Auditing using DML Triggers -------------------

create table sh_audit(
	new_name varchar2(30),
	old_name varchar2(30),
	user_name varchar2(30),
	entry_date varchar2(30),
	operation varchar2(30)
	);
	
create or replace trigger superheroes_audit
before insert or update or delete on superheroes
for each row
enable
declare
	v_user varchar2(30);
	v_date varchar2(30);
begin
select user, to_char(sysdate,'dd/mm/yyyy hh24:MI:SS') into v_user, v_date from dual;
if inserting then
	insert into sh_audit(new_name, old_name, user_name, entry_date, operation)
	values(:NEW.sh_name, NULL, v_user, v_date, 'Insert');
elsif deleting then
	insert into sh_audit(new_name, old_name, user_name, entry_date, operation)
	values(NULL, :OLD.sh_name,  v_user, v_date, 'Delete');
elsif updating then
	insert into sh_audit(new_name, old_name, user_name, entry_date, operation)
	values(:NEW.sh_name, :OLD.sh_name, v_user, v_date, 'Update');
end if;
end;      ----- *** Psuedo Record (NEW/OLD) *** ---------
/


----------------- Make synchronized backup copy of table using DML Trigger -------------

-- creating a backup table ----------

create table superheroes_backup as select * from superheroes where 1=2; 
-- currently the above table is empty and also the superheroes table has been 
-- truncated. Both are empty. **  

create or replace trigger sh_backup
before insert or delete or update on superheroes
for each row
enable
begin
	If inserting then
	insert into superheroes_backup (sh_name) values (:NEW.sh_name);
	elsif deleting then
	delete from superheroes_backup where sh_name = :old.sh_name;
	elsif updating then
	update superheroes_backup set sh_name = :NEW.sh_name where sh_name = :OLD.sh_name;
end if;
end;
/


----------------- DDL Triggers ----------------------------------------------------


create table schema_audit
(
	ddl_date DATE,
	ddl_user varchar2(15),
	object_created varchar2(15),
	object_name varchar2(15),
	ddl_operation varchar2(15)
);


create or replace trigger irf_audit_tr
after ddl on schema -- instead of ddl we can write as update, create, alter etc. 
begin
	insert into schema_audit values(
	sysdate,
	sys_context('USERENV','CURRENT_USER'); -- namespace, parameter : namespace is oracle built in. 
	ora_dict_obj_type, -- these three are oracle system event objects. 
	ora_dict_obj_name, 
	ora_sysevent 	   -- it will which ddl statement got execute. like create, update alter etc. 
	
end;
/


--------------- DATABASE Event Triggers -------------------------------

-- Database event triggers come into action when some system event occurs
-- such as 
-- * Database logOn
-- * Log Off
-- * Start up or
-- * Shutdown, or any other event. 

-- It is created to monitor the system event activities of either a specific
-- * user or 
-- * a whole database 

-- Any user of the database can create a database event trigger in its own schema
-- if it has 'CREATE TRIGGER SYSTEM PRIVILEGE'. 
-- The user needs to have 'ADMINISTRATIVE DATABASE TRIGGER' system privileges. 

-- Syntax for Database event trigger ------

CREATE OR REPLACE TRIGGER trigger_name
BEFORE | AFTER database_event ON database/schema
BEGIN
	PL/SQL CODE
END;
/

------- Trigger for 'LOG ON' or 'LOG OFF' events on database ----------------

create table irf_event_audit
(
	event_type varchar2(20),
	logon_date DATE,
	logon_time varchar2(15),
	logof_date DATE,
	logof_time varchar2(15)
);


create or replace trigger irf_logon_audit
after logon on schema
begin
	insert into irf_event_audit values(
	ora_sysevent,
	sysdate,
	to_char(sysdate, 'hh24:mi:ss'),
	null,
	null
);
commit;
end;
/

----- *** complete the rest 5 videos *** ---------------------- 

-- ******CURSORS IN PL/SQL******** -----

-- Definition : Cursor is a pointer to memory area called context area. Context area is a
-- memory region in PGA (Process Global Area). It is assigned to hold the information about
-- the processing of SELECT or a DML Statement (insert, delete, update, or merge).
-- Context Area holds the following information.
-- 1) Rows returned by a query.
-- 2) Number of rows processed by a query. 
-- 3) A pointer to the parsed query in the shared pool.
-- Using cursor we can control the context area as it is a pointer to memory area. 

-- Two types of Cursors
-- 1) Implicit cursors: 
-- It is automatically created by Oracle Server. Users cannot control these cursors.
-- The oracle server creates an implicit cursor for any pl/sql block executed when there
-- are no explicit cursors. 
-- 2) Explicit Cursors:
-- It is user defined cursors, thus users have control over them.

-- Steps to create cursors are:
-- DECLARE, OPEN, FETCH, CLOSE.
-- DECLARE:
-- Declaring a cursor means initializing cursor into a memory. It is declared in "declaration"
-- statement of plsql block.
-- OPEN: 
-- In order to put cursor at work, we have to open it.
-- Here the memory gets allocated to the cursor. 
-- FETCH:
-- The process of retrieving the data is called as FETCH.
-- CLOSE: 
-- When the server comes across the close statement, it relinquish all the resources associated
-- with the cursor. 

-- Explicit Cursor -----

set serveroutput on;

declare
v_number varchar(20);
cursor cur_irfan_khan is -- declaring the cursor-----
select name from employee where
empno >= 7600;
begin
open cur_irfan_khan;
loop
fetch cur_irfan_khan into v_number;
dbms_output.put_line(v_number);
exit WHEN cur_irfan_khan%NOTFOUND; 
end loop;
close cur_irfan_khan;
end;
/


---- Parameterized Cursor --------------------------

declare
v_name varchar(30);
cursor p_cur_irf (var_e_id varchar2) is
select first_name from employees
where employee_id < var_e_id;
begin
open p_cur_irf(105);
loop
fetch p_cur_irf into v_name;
dbms_output.put_line(v_name):
exit when dbms_output.put_line(v_name);
end loop;
close p_cur_irf;
end;
/


----- Parameterized Cursor with Default value ----------------

set serveroutput on

declare	
	v_name varchar2(30);
	v_eid number(10);
	cursor cur_para_irf (var_eid number: = 1) is
	select name, empno from employees
	where empno> var_eid;
begin
	open cur_para_irf;
	loop
	fetch cur_para_irf into v_name, v_eid;
	exit when cur_para_Irf%notfound;
	dbms_output.put_line(v_name || ' ' || v_eid);
	end loop;
	end;
	
	
------ Cursor 'FOR' loop --------------------

The Cursor FOR LOOP is specifically designed by oracle for cursors only.
This for loop reduces the code of opening, fetching, and closing the cursor.

Syntax for the 'For loop cursor'.

	FOR loop_index IN cursor_name 
		LOOP	
			statements .....
			statements .....
		END LOOP;

Example : 

set serveroutput on;

DECLARE
	CURSOR cur_irfn_forloop is
	select name, job from employee
	where empno > 200;
BEGIN	
	For l_idx in cur_irfn_forloop
	loop	
		dbms_output.put_line(l_idx.name || ' ' || l_idx.job);
		end loop;
	end;

	
--- Parameterized cursor for 'FOR LOOP CURSOR' --------------


declare
	cursor cur_irf_forloop_par (var_e_id number) is
	select empno, name from employee
	where empno > var_e_id;
begin
	for l_idx in cur_irf_forloop_par(5)
	loop
		dbms_output.put_line(l_idx.empno || ' ' || l_idx.name);
	end loop;
end;
		

--- PL/SQL RECORD DATATYPE ----

-- In PL/SQL there are two types of special data types.
-- 1) Anchored Data type  %type (explained in tutorial video number 4)
-- 2) Record Data type    %rowtype

-- Record Data types: Records are composite data structures 
-- made up of different components called fields.
-- These fields can have different data types like char, number, varchar, varchar2 etc.
-- A records is a group of related data items stored in 'fields', each with its own
-- name and datatype. 

-- Types of Record Data types.
-- 1) Table Based Record.
-- 2) Cursor Based Record.
-- 3) User Defined Record. 


--Table Based Record---

select * from employee;


declare
v_num employee%rowtype;
begin
select * into v_num from employee
-- or --
-- select empno, name into v_num.empno, v_num.name from employee
-- In case if we required only selected fields in that column/row. 
where empno = 7566;
dbms_output.put_line(v_num.name || ' ' || v_num.job || ' ' || v_num.deptno || ' ' ||v_num.salary);
--or
dbms_output.put_line(v_num.name || ' ' || v_num.job || ' ' || v_num.deptno); -- we can fetch any number of columns for one row. 
--or
dbms_output.put_line(v_num.hiredate);
-- or --
dbms_output.put_line(v_num.empno || ' ' || v_num.name);
end;
/


------- Cursor Based Records ------------------

-- Cursor based records are those variables whose structure is derived from the SELECT
-- list of an already created cursor. 

-- Steps to create cursor based records ---
-- * Declaration of Cursor Based Record.
-- * Initialization of Cursor Based Record and 
-- * Accessing data stored into the cursor based record variable. 

set serveroutput on

DECLARE
	CURSOR cur_irfankhan IS
	select name, salary from employee
	where empno = 10;
	
	var_emp cur_irfankhan%rowtype;
begin	
	open cur_irfankhan;
	fetch cur_irfankhan into var_emp;
	dbms_output.put_line(var_emp.name);
	dbms_output.put_line(var_emp.salary); -- here we are fetching two fields with one 
	close cur_irfankhan;                  -- variable. Before we use to have two variables.
end;
/


-------------- User Define Based Record Data type ------------------

-- User define records are the record variables whose structure is defined by the user.
-- Which is unlike the table based or curosr based records whose structures are derived
-- from their respective tables or cursor. 
  
-- It is divided into two types.
-- * Define TYPE (it is the base). 
-- * Create Record Variable.

-- Syntax for user define record data type -----

TYPE type_name IS RECORD (

field_name1 datatype1,
field_name2 datatype2,
field_name3 dataype3,
.
.
.
field_nameN datatypeN
);
-- record variable declaration--
record_name TYPE_NAME; 

declare
	type rv_dept is record(
	f_name varchar2(20),
	d_name DEPARTMENT.name%type
	);
	var1 rv_dept;
begin
	select name, name into var1.f_name, var1.d_name
	from employee join department using (deptno) where empno = 7844;
	
	dbms_output.put_line(var1.f_name || '  '||var1.d_name);
end;
/
	
	
--------- PL/SQL FUNCTIONS -----------

-- Definition: A self contained sub-program that is meant to do some specific well defined task. 
-- Functions are named PL/SQL block which means they can be stored in the database as a database object and can be reused.

-- Types of Sub-routines or sub-programs
-- 1) PL/SQL functions and
-- 2) PL/SQL procedures

-- Function to calculate the area of square ---

create or replace function square_area(side number) return number
is 
area number(7,3);
begin
area := side * side ;
return area;
end;
/

-- calling the function square_area ------
begin
dbms_output.put_line(square_area(5));
end;
/

--calling the function square_area with value of area storing into a variable---

declare
v_areaofsquare number(7,3);
begin
v_areaofsquare := square_area(6);
dbms_output.put_line(v_areaofsquare);
end;
/


--- PL/SQL Stored Procedures ------

-- Defintion: A stored procedure is like a function which is written to do some specific defined task.
-- Same like functions they are pl/sql blocks which can be reused. 
-- But Stored Procedure doesn't return any value like functions do.

-- sample procedure without parameters ----

Create or replace procedure pr_irfankhan is
v_name varchar(20) := 'irfan';
v_web varchar(20) := 'microbrains.com';
begin
dbms_output.put_line('Hi, I am '|| v_name || ' from '||' microbrains.com');
end pr_irfankhan;
/

-- calling the procedure ----
begin
pr_irfankhan;
end;
/

-- or --
exec pr_irfankhan;
-- or --
execute pr_irfankhan;

-- Stored Procedure with Parameters ---

set serveroutput on;

create or replace procedure pr_irfankhan2(num1 number,num2 number)
is v_number number(7,3);
begin
v_number := num1+num2;
dbms_output.put_line(v_number);
end pr_irfankhan2;
/

exec pr_irfankhan2(5,6); 

---- Procedure to update a table -----

/*
create or replace procedure pr_update_emp(bonusupdate number, empnumber number) 
is 
begin 
update employee set bonus = bonusupdate where empno = empnumber;
end;
/

--calling the procedure

exec pr_update_emp(1000, 7566); -- sending values using 'positional notation', 1000 is bonus matching bonusupdate,
and 7566 is empno matching empnumber. 
*/



------ PL/SQL SUBROUTINES -----

-- [**Subroutines are nothing but functions or stored procedures.**]
-- What is a CALLING NOTATION ---
-- Definition: Calling notation is a way of providing values to the parameters of a subroutine
-- such as stored procedures or functions.

-- Types of Calling Notations --
-- 1) Positional Notation
-- 2) Named Notation
-- 3) Mixed Calling Notation

-- Positional Notation --
-- In a positional notation we have to specify the value of each formal parameter in a sequential manner.

-- Named Notation --
-- Named calling notation lets you pass value to the formal parameters using their names. --
-- To send values to parameters using names, we use ASSOCIATION OPERATOR. -- 
-- It is a combination of equal to (=) and greater than (>) sign. 
-- ex: FORMAL PARAMETER => VALUE.


-- * Actual Parameters vs Formal Parameters ------------
-- Ex: function irfan(radius number){ 
-- function body ........} -- radius is formal parameter. 
-- irfan(5); -- function calling. - the 5 is actual parameter. 

---------- Positional Notation -------------------

create or replace procedure emp_sal(dep_no number, sal_raise number)
is
begin
	update employee set salary = salary * sal_raise where deptno = dep_no;
	dbms_output.put_line('Salary updated Successfully');
end;
/

exec emp_sal(40,100); -- deptno and sal_raise values. 
		-- in the above code, we need to pass the values in their exact positions,
		-- which means, both are numbers, but depno is different and salary is different.
		-- So sending them in exact manner executes the procedure successfully. 
		-- This is positional notation. 


------------------- Named Calling Notation ---------------------------

create or replace function add_num
(var_1 number, var_2 number default 0, var_3 number) return number 
-- the second variable is set to default 0, so its optional. While calling this
-- function we can just pass the variables 1 and 3 skipping the second one. 
is 
begin
	
	dbms_output.put_line('var 1 ' || var_1);
	dbms_output.put_line('var 2 ' || var_2);
	dbms_output.put_line('var 3 ' || var_3);
	return var_1+var_2+var_3;
end;
/

-- the below calling for the function add_num will raise an error.
-- because it is just normal calling of functional with positional notation. 
begin
	dbms_output.put_line(add_num(3,5));
end;
/

-- the below code will work fine !!!

declare 
	var_result number;
begin
	var_result := add_num(var_3 => 5, var_1 =>3);
	dbms_output.put_line('Result =' || var_result);
end;
/


------------------- Mixed Calling Notation -----------------------------

-- The Mixed calling notation is the combination of positional and named calling notation.
-- Below is the calling for the above add_num function. 

DECLARE
  var_result  NUMBER;
BEGIN
  var_result := add_num(var_1 => 10, 30 ,var_3 =>19);
  DBMS_OUTPUT.put_line('Result ->' || var_result);
END;

------------------------------------------------------------------------------------

---- PL/SQL PACKAGES -----

-- Definition: Packages are stored libraries in the database which allows us to group related
-- pl/sql objects under one name. 
-- Other words, Packages are logical groups of pl/sql objects. 

-- Packages are named PL/SQL blocks
-- Permanently stored in the database schema
-- Can be referenced or reused by our programs

-- Package can include multiple,
-- 1) Stored Procedures
-- 2) Functions
-- 3) Database Cursors
-- 4) Type declarations
-- 5) Variables

-- Each of the above included objects can be called as elements.

-- Package Architecture has two things,
-- 1) The Package Specification - Header 
-- 2) The Package Body



-- creating a package with one stored procedure and a function ---

create or replace package pkg_irfankhan is
function prnt_string return varchar2;
procedure pr_superhero(f_name varchar2, l_name varchar2);
end pkg_irfankhan;
/

-- creating package body ----

create or replace package body pkg_irfankhan is
-- Implementing the function
function prnt_string return varchar2 is
begin
return 'irfan khan';
end prnt_string;
-- Implementing the procedure --
procedure pr_superhero(f_name varchar2, l_name varchar2) is
begin
insert into new_superhero(f_name, l_name) values (f_name, l_name);
end;

end pkg_irfankhan;
/


-- calling the package --
begin
dbms_output.put_line( pkg_irfankhan.prnt_string); -- here only just the function in the package has been called --
end;
/

exec PKG_IRFANKHAN.PR_SUPERHERO('irfan','khan'); -- calling the stored procedure by sending the values to insert into the table ---


---------------------- PL/SQL EXCEPTION HANDLING ---------------------------------

-- An exception is a run time error. Two types of exceptions.
-- * System-Defined Exceptions, and
-- * User-Defined Exceptions. It can be declare in 3 ways. 
-- Type 1: 
-- * Using Variable of EXCEPTION type. 
-- Declare a user defined exception by declaring a variable of EXCEPTION datatype
-- in your code and raise it explicitly in your program using RAISE statement. 
-- Type 2: 
-- * Using PRAGMA EXCEPTION_INIT function.
-- Using PRAGMA EXCEPTION_INIT function, you can map a non-predefined error number
-- with the variable of EXCEPTION datatype. 
-- Type 3: 
-- * Using RAISE_APPLICATION_ERROR method.
-- Using this method you can declare a user defined exception with your own 
-- customized error number and message.  

---------- Declaring User Defined Exception using a variable of exception datatype ----------

-- Steps to create a user defined exception.-------
-- 1) Declare a variable of exception datatype.
-- 2) Raise the exception. 
-- 3) Handle the exception. 


DECLARE
	var_dividend number:= 24;
	var_divisor  number:= 0;
	var_result number;
	ex_DivZero Exception;
BEGIN
	If var_divisor = 0 then	
	RAISE ex_DivZero;
	end if;
	var_result := var_dividend/var_divisor;
	dbms_output.put_line('Result = ' || var_result);
	
	EXCEPTION WHEN ex_DivZero then
		dbms_output.put_line('ERROR ERROR ! - Your Divisor is Zero');
end;
/


--------- Declaring User Defined Exception using RAISE_APPLICATION_ERROR proc --------

-- * RAISE_APPLICATION_ERROR is a procedure which comes in-built with Oracle software.
-- * Using this procedure you can associate an error number with the custom error message.
-- * Combining both the error number and the custom error message you can compose an error string.

ACCEPT var_age number PROMPT 'What is your AGE?'; -- this is the ACCEPT command which asks input from the user. 
DECLARE
	age number :=  &var_age;
Begin
	IF age<18 then
	RAISE_APPLICATION_ERROR(-20008, 'You should be 18 or above for the DRINKS ! ');
	-- -20008 is the custom error number and it is between -20000 and -20999. 
	end if; 
	
	dbms_output.put_line('Sure, What would you like to have?');
	
	EXCEPTION WHEN others then
	dbms_output.put_line(SQLERRM);
	-- SQLERRM is an utility function provided by oracle which retrieves the error message
	-- for the last occurred exception. 
end;
/

0
---------- Declaring a User Defined Exception using PRAGMA EXCEPTION_INIT ----------------

-- * Using the PRAGMA EXCEPTION_INIT we can associate an exception name with an Oracle error number.
-- * We can use that name in designing the exception handler for the error. 

DECLARE
	ex_age EXCEPTION;
	age number := 17;
	-- syntax for pragma exception --------
	--PRAGMA EXCEPTION_INIT (exception_name, error_number);
	PRAGMA EXCEPTION_INIT(ex_age, -20008);
begin
	if ex_age<18 then
	RAISE_APPLICATION_ERROR(-20008, 'You should be 18 or above for the drinks !');
	End if; 
	
	dbms_output.put_line('Sure! What would you like to have?');
	
	EXCEPTION WHEN ex_age THEN
	
	dbms_output.put_line(SQLERRM);

end;
/


------------ -----------  PL/SQL COLLECTIONS ---------------------------------------

-- Definition: A homogenius single dimension data structure which is made of elements of same data type
-- is called Collection in Oracle Database. An Array is a collection which is of same data type.

-- The structure of PL/SQL collections consists of a cell with subscript called INDEX. 
-- Data is stored into these cells and can be identified and accessed using the Index number.
-- Unlike array, collections are strictly one-dimensional.

-- Types of Collections --
-- 1) Persistent Collections
   -- Persistent collections, are those which store the collection structure with the data, physically into the 
   -- database and can be accessed again, if needed.
   -- Types of Persistent Collection
   -- 1) Nested Tables
   -- 2) VARRAYs
-- 2) Non-persistent Collections
   -- Non-persistent collection only stores data and structure for just one session.
   -- 1) Associate Arrays is a type in it.
   

-- Nested Tables
-- 1) Nested tables are unbounded collections as their is no upper limit on rows.

-- VARRAYs
-- 1) Variable-Sized-Arrays are bounded, thus they hold fixed amount of elements.

-- Associative Arrays
-- 1) These are not stored in database, thus cannot be reused.
-- 2) Its available in pl/sql block for session.


-- Creating basic collection ---

declare
type my_nested_table is table of number;
var_num my_nested_table := my_nested_table(10,20,30,40,50,60);
begin
-- dbms_output.put_line('The number stored at index 1 is ' || var_num(1)); --using index to retrieve number
-- or using loop to fetch all of them
for a in 1 .. var_num.count
loop
dbms_output.put_line(var_num(a));
end loop;
end;
/
   
---- Creating nested tables -------

create or replace type my_nested_table is table of varchar(20);
/

create table my_subject(
sub_id number,
sub_name varchar(20),
sub_schedule_day my_nested_table
) nested table sub_schedule_day store as irfan_nestedtab_space;

desc my_subject;

insert into my_subject(sub_id , SUB_NAME , SUB_SCHEDULE_DAY )
values( 101, 'Computer', my_nested_table('mon','wed'));

insert into my_subject(sub_id , SUB_NAME , SUB_SCHEDULE_DAY )
values( 102, 'Maths', my_nested_table('mon','wed','fri'));

select * from MY_SUBJECT;


----- Creating Nested tables with user define datatype -----------------

create or replace type object_type_demo as object(
	obj_id number,
	obj_name varchar2 (10)
	);
/

create or replace type my_nt is table of object_type_demo;  -- object_type_demo is user defined datatype-------
/

create table base_table(
	tab_id number,
	tab_ele my_nt
	)	nested table tab_ele store as store_tab_1;
	/

	
------------ SQL VARRAY's -----------------------------

-- Va.rrays : Acronym of variable sized array. 
-- It is the modified format of nested tables.
-- Major modification can be seen in storage orientation. 
-- No noticeable changes in the implementation.
-- Unlike nested table which requires, an external table for its storage, Varrays are
-- stored in-line with their parent record as raw value in the parent table.
-- Varrays similar to nested tables are persistent type of collection.
-- * As a Database object.
-- * As a member of PL/SQL block.
-- * It has size limit also unlike nested tables which are unbounded.

-- Syntax for Varrays.

create [or replace] type type_name is {varray | varying array} (size_limit) of element_type;

-- Syntax for Varrays as block member.

Declare
	type type_name is {{varray | varying array} (size_limit) of element_type;

-- Syntax for Modifying size of Varrays

Alter type type_name modify limit new-size-limit [invalidate | cascade]


-- Creating Varrays in PL/SQL block -----------------------

set serveroutput on

declare 
	type inBlock_vry is Varray (5) of number; 
	vry_obj inBlock_vry := inBlock_vry(null, null, null, null, null);
	-- in the above allocation, we can also write numbers as 1 ,2 ,3 ,4 ,5. 
	-- ****Only we can use numbers in Varrays. We cannot make it as string and assign 
	-- string values like name 'irfan' or address etc.******
begin
	for i in 1..vry_obj.limit
	loop 
		vry_obj(i) := 10*i; 
		-- this is just the multiplication, if commented the below dbms will show the 
		-- allocated values to the array. 
		dbms_output.put_line(vry_obj (i)); 
	end loop;
end; -- we can also use extend function to allocate memory. vry_obj.Extend(n)
/    -- we can write extend function in loop as well but do not give any parameter.
     -- like vry_obj.EXTEND. (no parameters) 


---- Creating Varrays as a Database object ----------------------

create or replace type dbobj_vry is varray (5) of number; 

create table calendar(
	day_name varchar2(20),
	day_date dbobj_vry
	);
	/
	
insert into calendar (day_name, day_date)
values ('Sunday', dbobj_vry(7,14,21,28)); 


select * from calendar;

-- The above select statement just present data in a normal format. 
-- To get the data in proper format, we use the below sql statement which
-- uses table expression. 

select tab1.day_name,
		vry.column_value
		from
		calendar tab1, TABLE(tab1.day_date) vry; 

---- Creating Associative Arrays in database -------------

-- Associate Arrays : 
-- * It is based on the key-value pair.
-- * It is non-persistent. It means neither the array nor the data can be stored
--   in the database.
-- * It is not a database object. 
-- * It is unbounded collection. 


set serveroutput on

declare
	Type books is table of number 
	index by varchar2(20);
	isbn_obj books; --isbn_obj is a variable. 
	
BEGIN
	isbn_obj('Oracle DAtabase') := 1234;
	isbn_obj('MySQL') := 9876; 
	-- to change the value 9876 we just need write as,
	isbn_obj('MySQL') := 1010;
	dbms_output.put_line('Value' || isbn_obj('OracleDatabase'));
end;
/

	-- we can use loop to fetch all the values of an associative array -----
	
	
declare
	Type books is table of number 
	index by varchar2(20);
	isbn_obj books; --isbn_obj is a variable.
	flag varchar2(20);
	
BEGIN
	isbn_obj('Oracle Database') := 1234;
	isbn_obj('MySQL') := 9876; 
	-- to change the value 9876 we just need write as,
	isbn_obj('MySQL') := 1010;
	flag := isbn_obj.FIRST;
	while flag is NOT NULL
	LOOP
		dbms_output.put_line('Key -> ' || flag|| ' Value -> ' || isbn_obj(flag));
		flag := isbn_obj.NEXT(flag);
	end loop;	
end;
/

	
-- Below are the syntaxes for all the collections in PL/SQL
--Example Declaring Nested Tables, Varrays, and Associative Arrays
DECLARE
   TYPE nested_type IS TABLE OF VARCHAR2(30); --v1                               -- ** Nested Table
   TYPE varray_type IS VARRAY(5) OF INTEGER; --v2								 -- ** VArray's
   TYPE assoc_array_num_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;			 -- ** Associative Array with number as data and index with integer
   TYPE assoc_array_str_type IS TABLE OF VARCHAR2(32) INDEX BY PLS_INTEGER;		 -- ** Associative Array with string as data and index with integer
   TYPE assoc_array_str_type2 IS TABLE OF VARCHAR2(32) INDEX BY VARCHAR2(64);    -- ** Associative Array with string as data and index with string
   v1 nested_type;
   v2 varray_type;
   v3 assoc_array_num_type;
   v4 assoc_array_str_type;
   v5 assoc_array_str_type2;
BEGIN
-- an arbitrary number of strings can be inserted v1
   v1 := nested_type('Shipping','Sales','Finance','Payroll'); 
   v2 := varray_type(1, 2, 3, 4, 5); -- Up to 5 integers
   v3(99) := 10; -- Just start assigning to elements
   v3(7) := 100; -- Subscripts can be any integer values
   v4(42) := 'Smith'; -- Just start assigning to elements
   v4(54) := 'Jones'; -- Subscripts can be any integer values
   v5('Canada') := 'North America'; -- Just start assigning to elements
   v5('Greece') := 'Europe';        -- Subscripts can be string values
END;
/

-- Few Blocks related to Associate Arrays 

declare 
TYPE assoc_array_str_type2 IS TABLE OF VARCHAR2(50) INDEX BY varchar2(50);
v4 assoc_array_str_type2;
flag varchar2(50);
begin
v4('Canada') := 'Quebec';
v4('Canada') := 'Alberta';
v4('India') := 'Maharashtra';
v4('India') := 'Karnataka';
v4('USA') := 'Illinois';
v4('USA') := 'Oklahoma';
flag := v4.first;
--dbms_output.put_line(flag);
while flag is not null loop
--dbms_output.put_line(v4('India'));
dbms_output.put_line(flag);
flag := v4.next(flag);
end loop;
end;
/

declare 
TYPE assoc_array_str_type2 IS TABLE OF VARCHAR2(32) INDEX BY pls_integer;
v4 assoc_array_str_type2;
i pls_integer := 1;
begin
v4(1) := 'Ontario';
v4(2) := 'British Columbia';
v4(3) := 'Quebec';
for i in 1..v4.last loop
dbms_output.put_line(v4(i));
end loop;
end;
/


declare 
TYPE assoc_array_str_type2 IS TABLE OF number INDEX BY pls_integer;
v4 assoc_array_str_type2;
i pls_integer := 1;
flag pls_integer;
begin
v4(1) := 100; 
v4(2) := 150; 
v4(3) := 200; 
flag := v4.first;
for i in 1..v4.last loop
dbms_output.put_line(flag || '  '|| v4(i));
flag := v4.next(flag);
end loop;
end;
/


declare
type mynested_table is table of customer.name%type;
t_var mynested_table := mynested_table();
i integer := 1;
cursor c_customer is
select * from customer;
begin
for l_var in c_customer loop
t_var.extend;
t_var(i) := l_var.name;
dbms_output.put_line(t_var(i));
i := i+1;
end loop;
end;
/
---------------------------------------------------------------------------------------

-------------------- Collection Methods --------------------------------

-- In oracle database we have 3 Collection Procedure and 7 Collection functions.
-- In total we have 10 collection methods. (P) is denoted as PROCEDURE. 
-- Types of Methods which can be used with collections (built in functions)----
-- 1) COUNT - It counts the number of a variable or number of elements in an array. 
-- 2) EXISTS - It checks whether the index exists in an array or not. 
-- 3) EXTEND (P)- It extends the array if there are no indexes are further available. for ex: var_irf.extend(4) 
            -- since the array var_irf is of size 3 only. 
-- 4) FIRST - It gives the first element in the array.
-- 5) LAST - It gives the last element in the array.
-- 6) LIMIT - It gives the capacity of the array which can hold elements. 
           -- ex: var_irfan(4), var_irfan.Limit gives the size of the array 4.
-- 7) PRIOR - It returns the value of lower index. ex: var_irf(4) = 10, var_irf(5) = 20,
           -- var_irf.prior(5) = 10, as it is displaying var_irf(4) value.
-- 8) NEXT - It returns the value of higher index.
          -- ex: var_irf.next(4) = 20, which is the value of var_irf(5).
-- 9) DELETE (P)- It deletes the elements at a specified index.
          -- ex: var_irf.delete(4) deletes the value 10.
-- 10) TRIM (P)- It removes the elements from the array. 
      -- Trim can be written in two ways.
      -- 1) Without parameter
      -- ex: var_irf.trim it removes the element 20 which is last.
      -- 2) With parameter
      -- ex: var_irfn.trim(2), it removes the last two elements from the array i.e. 10 and 20.


	  
------------------------ CURSORS Continuation.. ----------------------------------

-- Ref Cursors: Reference to a Cursor. 
-- * It is a PL/SQL datatype using which you can declare a special type of variable 
--   called CURSOR VARIABLE. 
-- * A single cursor variable can be associated with multiple SELECT statements in 
--   a single PL/SQL block.
-- * There are two types of Ref Cursors in Oracle Database. 
--   -> Strong Ref Cursors = Any ref cursor which has fixed return type. 
--   -> Weak Ref Cursors = Any ref cursor which do not have any return type. 
--                         They are open to all SELECT statements as they do not have
--                         any fixed return type. 


-- Syntax for Strong REF CURSOR -----
	declare	
		TYPE ref_cursor_name IS REF CURSOR 
		RETURN (return_type);
		
-- Syntax for Weak REF CURSOR --------
	declare	
		TYPE ref_cursor_name IS REF CURSOR; 
		
--- * SYS_REFCURSOR * -----------------
-- Sys RefCursor is an oracle built in cursor variable. 
-- It declares a weak ref cursor and that too without declaring 
-- the ref pointer type. 


---- Creating a STRONG REF CURSOR ---------------------

declare
	type my_RefCur is ref cursor return employees%rowtype;
	cur_var my_RefCur;
	rec_var employee%rowtype;
begin
	open cur_var for select * from employees where employee_id = 100;
	fetch cur_var into rec_var;
	close cur_var;
	dbms_output.put_line('Employee '|| rec_var.first_name ||
			' has salary ' || rec_var.salary);
end;
/



----------------- PLSQL BULK COLLECT -----------------------------

-- What is BULK COLLECT?
-- Bulk Collect is about reducing context switching and improving query performance.
 
-- Context Switching?
-- Whenever you write a PL/SQL block and execute it, the PL/SQL runtime engine 
-- starts processing it line by line. The engine processes all the PL/SQL itself but
-- it all passes all SQL statements to SQL runtime engine. When the SQL engine done
-- processing the statements, it returns the results back to the PL/SQL engine. This
-- to and fro hopping of control is called CONTEXT SWITCHING. 
-- But this could be a cause for slow performance. The higher the hopping of controls
-- the greater will be the overhead which in turn degrade the performance. 
-- Instead of multiple context switching, we should have replace it with one. 
-- Thus BULK COLLECT clause comes in. It sends all statements to SQL engine at one time. 
-- It increases the PL/SQL program efficiency. 

-- BULK Data processing: The process of fetching batches of data from PL/SQL runtime
-- engine to SQL runtime engine and vice versa is called bulk data processing. 


-- Bulk Collect clause can be used with, 
-- * SELECT-INTO
-- * FETCH-INTO
-- * RETURNING-INTO


------------ BULK COLLECT with SELECT-INTO ---------------------------------


set serveroutput on;

DECLARE
	type nt_fName is table of varchar2(20);
	fname nt_fName;
begin
	select first_name BULK COLLECT INTO fname
	from employees;
	
	for idx in 1..fname.count
	loop
		dbms_output.put_line(idx||' '||fname(idx));
	end loop;
end;
/


-------------- BULK COLLECT with FETCH-INTO --------------------------------

set serveroutput on;

declare
	cursor exp_cur is
	select name from employee;
	
	type nt_fName is table of varchar(20);
	fname nt_fName;
	
begin
	open exp_cur;
	loop
		fetch exp_cur bulk collect into fname;
		exit when fname.count = 0;
		for idx In fname.first..fname.last
		loop	
			dbms_output.put_line (idx || ' '|| fname(idx) );
			end loop;
		end loop;
		
		close exp_cur;
end;
/

------------- BULK COLLECT with LIMIT Clause ---------------------------

-- Memory Overhead : Whenever we retrieve or fetch a large number of records
-- using bulk collect clause, our program starts consuming a lot of memory in order
-- to be fast and efficient. That degrades the performance of the database. This means
-- that our query must surely be performing well but at the same time our database may not. 

declare	
	cursor exp_cur2 is 
	select name from employees;
	
	type nt_fName is table of varchar2(20);
	fname nt_fName;
	
begin
	open exp_cur2;
	fetch exp_cur2 Bulk collect into fname limit 10;
	-- limit clause can be use with only fetch-into statement, not with select-into.
	close exp_cur2;
	for idx in 1..fname.count
	loop	
		dbms_output.put_line(idx || '  '|| fname(idx));
	end loop;
end;
/
	
	
	
	
	
	  
	  
	  

---- NATIVE DYNAMIC SQL -------

-- Static SQL
-- Definition: Any SQL Statement which does not change during the runtime
-- and remains fixed is called a static SQL Statement. 

-- Native Dynamic SQL
-- Definition: Any SQL statement which is constructed at the runtime 
-- is called Native Dynamic SQL.

-- How to use Dynamic SQL.
-- 1) 'Execute Immediate' statement and 
-- 2) Open-For, Fetch & Close block.

 
 
 
 
---------------------------------------------------------------------------- 
--------- ********** SQL JUNK QUEIRES ********** ---------------------------
----------------------------------------------------------------------------


declare
v_time varchar2(30);
begin
select to_char(sysdate , 'dd/mm/yyyy hh24:MI:SS') into v_time from dual;
dbms_output.put_line(v_time);
end;
/

------------------------------------------------------------------------------


select substr(JOB,instr(JOB , 'A')+1, length(job)) from employee where empno = 7566;

select instr(name, 'L') from employee where empno = 7839;

select substr(job, 1, 2) from employee where empno = 7566;


-------------------------------------------------------------------------------


select rtrim(ltrim(empno)) from employee;

select ltrim(empno) from employee; 

select rtrim(empno) from employee; 

--------------------------------------------------------------------------------------

-- DELETING ALL TABLES FROM A SCHEMA -------------------

SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

-------------------------------------------------------------------------------------























                                             
                                             


























