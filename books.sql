create table books
(book_id number(4) not null,
  book_name varchar2(30) not null,
  author_name varchar2(30) not null,
  price number(6) not null,
  publisher varchar2(30) not null,
  book_version varchar2(3),
  categories varchar2(30),
  active_status number(2),
 constraint book_id_pk primary key (book_id),
 constraint price_cq check (price>=0),
 constraint book_auth_ver_uq unique (book_name,author_name,book_version));
 
 insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (100,'code complete','siveka',200,'raju',1,'software',1);
 
insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (101,'circuits theory','deepan',350,'ajmal',1,'core',1);
 
 insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (102,'java','raju',500,'jhon',1,'software',1);
 
 insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (104,'sql developer','stanly',500,'jeni',1,'software',1);
 
insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (105,'sap guide','jemsh',600,'jhon',2,'software',0);
 
 insert into books (book_id,book_name,author_name,price,publisher,book_version,categories,active_status)
 values (106,'c++','jemsh',700,'jeni',2,'software',1);
 
 select * from books;

create table orders
(
  order_id number(15) not null,
  user_name varchar2(20) not null,
  book_id number(5) not null,
  order_date timestamp default SYSTIMESTAMP,
  delivered_date timestamp,
  price_amount number(10) not null,
  quantity number(5),
  order_status varchar2(25),
  comments varchar2(100),
 constraint order_id_pk primary key (order_id),
 constraint quanti_cq check (quantity>0),
 constraint book_id_fk foreign key (book_id) references books(book_id)
);
 
 insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1001,'siveka',100,200,1,'ordered');

insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1002,'ajmal',101,350,1,'ordered');

insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1003,'deepan',102,500,1,'ordered');

insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1004,'santhosh',104,500,1,'ordered');

insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1005,'sugumar',105,600,1,'ordered');

insert into orders (order_id,user_name,book_id,price_amount,quantity,order_status) 
values (1006,'mohun',106,700,1,'ordered');

select * from orders;
