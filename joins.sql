create table users
(
user_id number (10) not null,
user_name varchar2(50) not null,
email_id varchar2(100) not null,
passward varchar2(50) not null,
primary key(user_id),
unique(email_id)
);

create table tasks
(
task_id number (10) not null,
task_name varchar2(50) not null,
assinged_to number (10),
unique (task_id,assinged_to),
foreign key (assinged_to)references users (user_id)
);

insert into users (user_id,user_name,email_id,passward) values (&user_id,'&user_name','&email_id','&passwor');
insert into tasks (task_id,task_name,assinged_to) values (&task_id,'&task_name',&assinged_to);

/*subquery*/
select user_name,
(select task_name from tasks where assinged_to=u.user_id)as task_name
from users u;

/*join*/
select * from users u,tasks t where t.assinged_to=u.user_id;
select user_name,task_name from users u,tasks t where t.assinged_to=u.user_id;
select *from users,tasks;
select user_name,task_name from users u,tasks t where t.assinged_to=u.user_id;

/*joins and inner joins*/
select * from users u join tasks t on t.assinged_to=u.user_id;
select * from tasks t join users u on t.assinged_to=u.user_id;
select * from users u inner join tasks t on t.assinged_to=u.user_id;
select * from tasks t inner join users u on t.assinged_to=u.user_id;

/*right join and left joins*/
select * from users u left join tasks t on t.assinged_to=u.user_id;
select * from tasks t left join users u on t.assinged_to=u.user_id;
select * from tasks t right join users u on t.assinged_to=u.user_id;
select * from users u right join tasks t on t.assinged_to=u.user_id;

/*full join*/
select * from users u full join tasks t on t.assinged_to=u.user_id;
