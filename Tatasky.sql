create table channel_list
(
channel_name varchar2(40) not null,
channel_id number(10) not null,
language varchar2(25) not null,
free_pay char(5) not null,
price number (10) not null,
price_with_tax number (10) not null,
constraint channel_id_pk primary key (channel_id)
);

create table user_list
(
user_id number(5) not null,
user_name varchar2(35) not null,
email_id varchar2(35) not null,
phone_number number (10) not null,
user_created timestamp default systimestamp,
constraint user_id_pk primary key (user_id),
constraint user_info_uq unique (user_id,email_id,phone_number)
);

create table selection_process
(
selection_id number(5) not null,
channel_id number(10) not null,
user_id number(5)not null,
price_with_tax number(10) not null,
payment_status char(25) default Inprogress,
primary key (selection_id),
foreign key (channel_id) references channel_list (channel_id),
foreign key (user_id) references user_list (user_id)
);

create table selected_list  
(
selection_id number(5) not null,
user_id number(5) not null,
total_amount number (10) not null,
active_date timestamp default systimestamp,
deactive_date date,
payment_status char(15) default Completed,
comments varchar2 (100),
foreign key (selection_id) references selection_process(selection_id)
);

insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (&channel_id,'&channel_name','&language','&free_pay',&price,&price_with_tax);

desc channel_list;

select *from channel_list;

insert into user_list (user_id,user_name,email_id,phone_number) values (&user_id,'&user_name','&email_id',&phone_number);

select * from user_list;

create sequence selection_process_seq start with 1001 increment by 1;

insert into selection_process (selection_id,channel_id,user_id,price_with_tax)
values (1001,(select channel_id from channel_list where channel_id=&channel_id),
(select user_id from user_list where user_id=&user_id),(select price_with_tax from channel_list where channel_id=&channel_id));

select * from selection_process;

alter table channel_list modify price decimal;
alter table selection_process modify price_with_tax decimal;

select * from selection_process;

drop SEQUENCE selection_process_seq;

insert into selected_list (selection_id,user_id,total_amount,deactive_date)
values (&selection_id,(select user_id from selection_process where selection_id=selection_id),(select sum(price_with_tax)from
selection_process where user_id=user_id),(sysdate+3));
