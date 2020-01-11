# Tatasky Channel Selection App

* https://tatasky.in

## Features

* User should be able to view all the channel information.
* Each user have an individual login and view all the channel information from their own login id.
* Each user have an option for selecting the channels from their own user id.

### Features 1: To list the channel information.

```sql
create table channel_list
(
channel_name varchar2(40) not null,
channel_id number(10),
language varchar2(25) not null,
free_or_pay char(5) not null,
price decimal(4,2) not null,
price_with_tax decimal (4,2) not null,
constraint channel_id_pk primary key (channel_id),
constraint language_ck check (language in ('tamil','telugu','english','hindi')),
constraint free_pay_ck check (free_or_pay in ('free','pay')),
constraint channel_name_uq unique (channel_name)                                          
);

insert into channel_list (channel_id,channel_name,language,free_or_pay,price,price_with_tax)
values (&channel_id,'&channel_name','&language','&free_pay',&price,&price_with_tax);
--or--
insert into channel_list (channel_id,channel_name,language,free_or_pay,price,price_with_tax)
values (1518,'star vijay','tamil','pay',17.00,20.06);

insert into channel_list (channel_id,channel_name,language,free_or_pay,price,price_with_tax)
values (1423,'star maa','telugu','pay',19.00,22.42);

insert into channel_list (channel_id,channel_name,language,free_or_pay,price,price_with_tax)
values (609,'india today','english','free',00.00,00.00);

insert into channel_list (channel_id,channel_name,language,free_or_pay,price,price_with_tax)
values (1104,'zee hindi','hindi','pay',1.00,1.18);

desc channel_list;
select * from channel_list;

### Table : chaneel_list

| channel_name | channel_id | language | free_or_pay | price | price_with_tax |
|--------------|------------|----------|-------------|-------|----------------|
| star vijay   | 1518       | tamil    | pay         | 17.00 | 20.06          |
| star maa     | 1423       | telugu   | pay         | 19.00 | 22.42          |
| india today  | 609        | english  | free        | 00.00 | 00.00          |
| zee hindi    | 1104       | hindi    | pay         | 1.00  | 1.18           |

```
### Features 2: Users creation and to list the users information.

```sql
create table user_list
(
user_id number,
user_name varchar2(50) not null,
email_id varchar2(60) not null,
phone_number number (10) not null,
constraint user_id_pk primary key (user_id),
constraint user_info_uq unique (user_id,email_id,phone_number)
);

insert into user_list (user_id,user_name,email_id,phone_number) values (&user_id,'&user_name','&email_id',&phone_number);
--or--
insert into user_list (user_id,user_name,email_id,phone_number) values (101,'suresh','suresh@gmail.com',9887766543);

insert into user_list (user_id,user_name,email_id,phone_number) values (102,'john','john@gmail.com',9876434523);

insert into user_list (user_id,user_name,email_id,phone_number) values (103,'jeni','jeni@gmail.com',9976542354);

desc user_list;
select * from user_list;

### Table : user_list

| user_id | user_name |     email_id     | phone_number |
|:-------:|:---------:|:----------------:|:------------:|
|   101   |   suresh  | suresh@gmail.com |  9887766543  |
|   102   |    john   |  john@gmail.com  |  9876434523  |
|   103   |    jeni   |  jeni@gmail.com  |  9976542354  |
```
### Features 3: To list to selected channels with selection id.

```sql

create table user_subscribed_list
(
selection_id number(5),
user_id number(5)not null,
channel_id number(10) not null,
price_amount decimal(4,2) not null,
active_date date default sysdate,
deactive_date date,
payment_status char(15) default 'Completed',    
constraint selection1_id_pk primary key (selection_id),      
constraint channel1_id_fk foreign key (channel_id) references channel_list(channel_id),
constraint user1_id_fk foreign key (user_id) references user_list (user_id),
constraint payment1_status_ck check (payment_status in ('Completed'))
);

create sequence selection_process_seq start with 1 increment by 1;

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date)
values (selection_process_seq.nextval,&user_id,&channel_id,
(select price_with_tax from channel_list where channel_id=&channel_id),(sysdate+29));

--or--

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date) 
values (selection_process_seq.nextval,101,1518,20.06,(sysdate+29));

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date) 
values (selection_process_seq.nextval,101,1423,22.42,(sysdate+29));

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date) 
values (selection_process_seq.nextval,102,609,00.00,(sysdate+29));

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date) 
values (selection_process_seq.nextval,103,609,00.00,(sysdate+29));

insert into user_subscribed_list (selection_id,user_id,channel_id,price_amount,deactive_date) 
values (selection_process_seq.nextval,103,1518,20.06,(sysdate+29));

select * from user_subscribed_list;

### table : user_subscribed_list

| selection_id | user_id | channel_id | price_amount | active_date | deactive_date | payment_status |
|:------------:|:-------:|:----------:|:------------:|:-----------:|:-------------:|:--------------:|
|       1      |   101   |    1518    |     20.06    |  01-jan-20  |   30-jan-20   |    completed   |
|       2      |   101   |    1423    |     22.42    |  01-jan-20  |   30-jan-20   |    completed   |
|       3      |   102   |     609    |     00.00    |  01-jan-20  |   30-jan-20   |    completed   |
|       4      |   103   |     609    |     00.00    |  01-jan-20  |   30-jan-20   |    completed   |
|       5      |   103   |    1518    |     20.06    |  01-jan-20  |   30-jan-20   |    completed   |

### scenarios

--1. filter option for channel selection. (user) 

--# minimum price:

select price_with_tax,channel_name,channel_id,language from channel_list order by price_with_tax;

--# maximum price:

select price_with_tax,channel_name,channel_id,language from channel_list order by price_with_tax desc;

--# free channels only:

select channel_id,channel_name,price_with_tax from channel_list where price_with_tax=00.00;

--# total number of user available.(admin)

select count(*) user_id from user_list; 
select count(*) channel_id from channel_list;
select count(*) channel_id from user_subscribed_list;
select sum(price_amount) total_amount from user_subscribed_list;

--2. To find out the total number of channels selected and total amount by the user.

select count(channel_id) total_number_of_channels,sum(price_amount) total_amount from user_subscribed_list
        where user_id = 101;

--3.To find out the total price amount for selected channels to the given user.

select fu_total_channel () from dual;

select fu_total_amount () from dual;

select fu_total_channel (),fu_total_amount () from dual;

--4. To find out the what are channels are selected to the given user.

select user_id,channel_name from user_subscribed_list where user_id=101;

--5. To find out the remaining day to be active.

select fu_active_status (101,1518) from dual;

--6. To find out total amount, noumber of channels and active status.

select fu_total_channel (),fu_total_amount (),fu_active_status (101,1518) from dual;

--7. To find out the upcoming deactive channels.

select user_id,channel_id,channel_name,deactive_date from user_subscribed_list order by deactive_date;
```
### featuers 4: To list the channels with categories wise.
```sql
create table channel_categories_list
(
channel_id number (10) not null,
channel_name varchar2(100) not null,
category_type varchar2(100) not null,
language varchar2(25) not null,
price_amount decimal(6,2) not null,
category_id number(5) not null,
constraint channel2_id_pk primary key (channel_id),
constraint channel2_name_uq unique (channel_name),
constraint language2_ck check (language in ('tamil','telugu','english','hindi'))
);

insert into channel_categories_list (channel_id,channel_name,category_type,language,price_amount)
values (&channel_id,'&channel_name','&category_type','&language',&price_amount);

desc channel_categories_list;
select * from channel_categories_list;
```
### featuers 5: To list the spcial packs for channels.

```sql
create table special_packs
(
pack_id varchar2(10),
pack_name varchar2(100) not null,
number_of_channels number (10) not null,
price decimal (10,2) not null,
constraint pack_id_pk primary key (pack_id),
constraint pack_name_uq unique (pack_name)
);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p1','south spcial pack',21,207.68);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p2','tamil basic',11,112.10);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p3','telugu basic',10,95.58);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p4','hindi basic',7,57.06);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p5','tamil smart pack',7,44.84);

insert into special_packs (pack_id,pack_name,number_of_channels,price)
values ('p6','family pack',40,355.60);

desc special_packs;

select * from special_packs;
```

