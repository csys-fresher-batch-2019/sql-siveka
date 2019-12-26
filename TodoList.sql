Create table todolist (
task_id number (4) not null,
task_name varchar2 (30) not null,
emp_name char (20) not null,
deadline_date date not null,
complete_date date,
status char (20),
created_date date default sysdate;
constraint com_date_cq check (complete_date date <= deadline_date));
insert into todolist (
tast_id,task_name,emp_name,deadline_date)
values (1,'install oracle','raju',to_date'26-12-2019','dd-mm-yyyy');
insert into todolist (
tast_id,task_name,emp_name,deadline_date)
values (2,'install idk','john',to_date'26-12-2019','dd-mm-yyyy');

