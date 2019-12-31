# Tatasky Channel Selection App

* https://tatasky.in

## Features

* User should be able to view all the channel information.
* Each user have a individual login and view all the channel information from their own login id.
* Each user have a options for select the channels from their own user id.

### Features 1:To list the channel information.

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

insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (&channel_id,'&channel_name','&language','&free_pay',&price,&price_with_tax);
--or--
insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (1518,'star vijay','tamil','pay',17.00,20.06);

insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (1423,'star maa','telugu','pay',19.00,22.42);

insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (609,'india today','english','free',00.00,00.00);

insert into channel_list (channel_id,channel_name,language,free_pay,price,price_with_tax)
values (1104,'zee hindi','hindi','pay',1.00,1.18);

desc channel_list;
select * from channel_list;

Table : chaneel_list

| channel_name | channel_id | language | free_or_pay | price | price_with_tax |
|--------------|------------|----------|-------------|-------|----------------|
| star vijay   | 1518       | tamil    | pay         | 17.00 | 20.06          |
| star maa     | 1423       | telugu   | pay         | 19.00 | 22.42          |
| india today  | 609        | english  | free        | 00.00 | 00.00          |
| zee hindi    | 1104       | hindi    | pay         | 1.00  | 1.18           |

```
### Features 2: Users creation and to list the user information.

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

insert into user_list (user_id,user_name,email_id,phone_number) values (101,'suresh','suresh@gmail.com',9887766554);

desc user_list;
select * from user_list;

### Table : user_list

| user_id | user_name |     email_id     | phone_number |
|:-------:|:---------:|:----------------:|:------------:|
|   101   |   suresh  | suresh@gmail.com |  9887766543  |
|   102   |    john   |  john@gmail.com  |  9876434523  |
|   103   |    jeni   |  jeni@gmail.com  |  9976542354  |
```

