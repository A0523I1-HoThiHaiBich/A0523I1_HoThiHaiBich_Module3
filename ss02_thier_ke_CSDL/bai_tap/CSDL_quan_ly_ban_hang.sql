create database ss2_bt_quan_ly_ban_hang;
use ss2_bt_quan_ly_ban_hang;
create table customer
(c_id int primary key,
c_name varchar(45),
c_age date);
create table `order`
(o_id int primary key,
c_id int,
foreign key(c_id) references customer(c_id),
o_name varchar(45),
c_date date,
o_total_price int);
create table product
(p_id int primary key,
p_name varchar(45),
p_price int);

create table order_detail
(o_id int,
p_id int,
primary key (o_id,p_id),
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id),
od_qty int);
