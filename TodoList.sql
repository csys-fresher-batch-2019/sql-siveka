Create table todolist (
task_id number (4) not null,
task_name varchar2 (30) not null,
emp_name char (20) not null,
deadline_date date not null,
complete_date date,
status char (20),
created_date date default sysdate,
constraint com_date_cq check (complete_date <= deadline_date));
                              
alter table todolist add (
  priority varchar2(5), 
  modified_date date);
insert into todolist (
task_id,task_name,emp_name,deadline_date,priority,modified_date)
values (1,'install oracle','raju',to_date('26-12-2019','dd-mm-yyyy'),1,to_date ('26-12-2019','dd-mm-yyyy'));
insert into todolist (
task_id,task_name,emp_name,deadline_date,priority,modified_date)
values (2,'install idk','john',to_date('26-12-2019','dd-mm-yyyy'),2,to_date ('26-12-2019','dd-mm-yyyy'));     
