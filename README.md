# Tatasky Channel Selection App

* https://tatasky.in

## Features

* User should be able to view all the channel information.

### Features 1:To list the channel information.

```sql
create table channel_list
(
channel_name varchar2(40) not null,
channel_id number(10) not null,
language varchar2(25) not null,
free/pay char(5) not null,
price decimal(4,2) not null,
price_with_tax decimal (4,2) not null,
constraint channel_id_pk primary key (channel_id)
);

insert into channel_list (channel_id,channel_name,language,free/pay,price,price_with_tax)
values (&channel_id,'&channel_name','&language','&free_pay',&price,&price_with_tax);

insert into channel_list (channel_id,channel_name,language,free/pay,price,price_with_tax)
values (1518,'star vijay','tamil','pay',17.00,20.06);

desc channel_list;
select * from channel_list;
