
create database iii;


create table customers (id int(10) primary key auto_increment,cname varchar(100),
cphone varchar(20) unique key,email varchar(100),address varchar(100));


create table suppliers (id int(10) primary key auto_increment, companyName varchar(100),
sphone  varchar(20) unique key, saddress varchar(100));


create table products ( id int(10) primary key auto_increment, 
pid int(10) unique key ,pname varchar(100),  unitPrice float(10) ,  
sphone varchar(100) , foreign key (sphone) references suppliers(sphone));


create table orders ( id int(10) primary key auto_increment, oid int(10) unique key ,
 cphone   varchar(20),  foreign key (cphone) references customers(cphone));


create table `order Details` (id int(10) primary key auto_increment, oid int(10) ,
 pid int(10) ,realPrice int(10),Quantity int(10),
 foreign key(oid)  references orders(oid),
 foreign key(pid)  references products(pid));


-------------
 
\d #
create procedure ptest1()
begin
    select * from customers;
end #
\d ;

-----------------------insert  orders  若輸入的cphone不存在於 customers 則會失敗

\d #
create procedure ptest2(in kw int(100),in kw2 varchar(100))
begin
    insert into orders  (oid,cphone) values ( kw,kw2);
end #
\d ;

------------- 輸入 cphone 找 customers 中符合者
 
\d #
create procedure ptest3(in kw varchar(100))
begin
    select * from customers where cphone=kw;
end #
\d ;

------------- 輸入 cphone 找 customers  中符合者  join orders
 
\d #
create procedure ptest4(in kw varchar(100))
begin
    select c.id , c.cname,c.cphone , c.email, c.address , o.oid from customers c join orders o where c.cphone=o.cphone having c.cphone = kw;
end #
\d ;





