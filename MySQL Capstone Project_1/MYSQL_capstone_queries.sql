-- PART 1: DATABASE DESIGN:
CREATE DATABASE retail_capstone_db;
USE retail_capstone_db;

-- TABLE 1
CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
gender VARCHAR(10),
membership_type VARCHAR(30)
);

-- TABLE 2
CREATE TABLE products
(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

-- TABLE 3
CREATE TABLE orders
(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30)
);

-- TABLE 4
CREATE TABLE order_items
(
item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT
);

-- TABLE 5
CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
order_id INT,

payment_mode VARCHAR(30),
payment_status VARCHAR(30),
amount DECIMAL(10,2)
);

-- TABLE 6
CREATE TABLE deliveries
(
delivery_id INT PRIMARY KEY,
order_id INT,
delivery_partner VARCHAR(50),
delivery_status VARCHAR(30),
delivery_city VARCHAR(50)
);

-- PART 2 : DATA INSERTION:
insert into customers values
(1,'rahul sharma','hyderabad','telangana','male','gold'),
(2,'priya reddy','hyderabad','telangana','female','silver'),
(3,'amit kumar','bengaluru','karnataka','male','gold'),
(4,'sneha iyer','chennai','tamil nadu','female','bronze'),
(5,'arjun nair','kochi','kerala','male','silver'),
(6,'neha patel','mumbai','maharashtra','female','gold'),
(7,'vikram singh','delhi','delhi','male','bronze'),
(8,'ananya das','kolkata','west bengal','female','silver'),
(9,'karthik rao','bengaluru','karnataka','male','gold'),
(10,'meera joshi','pune','maharashtra','female','bronze');

insert into products values
(101,'smartphone','electronics',25000),
(102,'laptop','electronics',65000),
(103,'headphones','electronics',2500),
(104,'t shirt','fashion',799),
(105,'jeans','fashion',1999),
(106,'sports shoes','fashion',3499),
(107,'mixer grinder','home appliances',4500),
(108,'water bottle','kitchen',599),
(109,'office chair','furniture',7500),
(110,'book shelf','furniture',5500);

insert into orders values
(1001,1,'2026-01-05','delivered'),
(1002,2,'2026-01-10','delivered'),
(1003,3,'2026-01-12','cancelled'),
(1004,1,'2026-01-15','shipped'),
(1005,4,'2026-01-18','delivered'),
(1006,5,'2026-01-20','pending'),
(1007,6,'2026-01-25','delivered'),
(1008,7,'2026-02-01','cancelled'),
(1009,8,'2026-02-05','shipped'),
(1010,9,'2026-02-10','delivered'),
(1011,10,'2026-02-12','pending'),
(1012,3,'2026-02-15','delivered'),
(1013,6,'2026-02-20','shipped'),
(1014,2,'2026-02-22','delivered'),
(1015,9,'2026-02-25','pending');

insert into order_items values
(1,1001,101,1),
(2,1001,103,2),
(3,1002,104,3),
(4,1002,105,1),
(5,1003,102,1),
(6,1004,106,1),
(7,1004,108,2),
(8,1005,107,1),
(9,1006,109,1),
(10,1007,101,1),
(11,1007,104,2),
(12,1008,102,1),
(13,1009,103,1),
(14,1009,105,2),
(15,1010,106,1),
(16,1010,108,1),
(17,1011,110,1),
(18,1012,107,1),
(19,1013,101,1),
(20,1014,104,2),
(21,1014,103,1),
(22,1015,109,1);

insert into payments values
(501,1001,'upi','success',30000),
(502,1002,'card','success',4396),
(503,1003,'upi','failed',65000),
(504,1004,'cash','success',4697),
(505,1005,'upi','success',4500),
(506,1006,'card','pending',7500),
(507,1007,'upi','success',26598),
(508,1008,'net banking','failed',65000),
(509,1009,'upi','success',6498),
(510,1010,'card','success',4098),
(511,1011,'cash','pending',5500),
(512,1012,'upi','success',4500),
(513,1013,'card','success',25000),
(514,1014,'upi','success',4098),
(515,1015,'net banking','pending',7500);

insert into deliveries values
(701,1001,'bluedart','delivered','hyderabad'),
(702,1002,'delhivery','delivered','hyderabad'),
(703,1003,'ekart','cancelled','bengaluru'),
(704,1004,'bluedart','shipped','hyderabad'),
(705,1005,'delhivery','delivered','chennai'),
(706,1006,'ekart','pending','kochi'),
(707,1007,'bluedart','delivered','mumbai'),
(708,1008,'delhivery','cancelled','delhi'),
(709,1009,'ekart','shipped','kolkata'),
(710,1010,'bluedart','delivered','bengaluru'),
(711,1011,'delhivery','pending','pune'),
(712,1012,'ekart','delivered','bengaluru'),
(713,1013,'bluedart','shipped','mumbai'),
(714,1014,'delhivery','delivered','hyderabad'),
(715,1015,'ekart','pending','bengaluru');

-- PART 3: BASIC QUERIES:
select * from customers;

select customer_name, city, membership_type from customers;

select * from products 
order by price desc;

select * from customers
where city = "hyderabad";

select * from customers
where membership_type = "gold";

select * from products
where price between 500 and 5000;

select * from products
where category in ("electronics", "fashion");

select *
from orders
where order_date > '2026-01-01';

select *
from payments
where payment_mode = 'upi';

select *
from deliveries
where delivery_status = 'pending';

-- PART 4: AGGREGATE QUERIES:
select count(*) as total_customers
from customers;

select count(*) as total_orders
from orders;

select count(*) as total_products
from products;

select sum(amount) as total_revenue
from payments
where payment_status = 'success';

select avg(amount) as average_order_payment
from payments;

select max(amount) as highest_payment
from payments;

select min(amount) as lowest_payment
from payments;

select city, count(*) as customer_count
from customers
group by city;

select category, count(*) as product_count
from products
group by category;

select order_status, count(*) as order_count
from orders
group by order_status;

-- PART 5: JOINS:
select c.customer_name, o.order_id, o.order_date
from customers c
join orders o on c.customer_id = o.customer_id;

select oi.order_id, p.product_name, oi.quantity, p.price
from order_items oi
join products p on oi.product_id = p.product_id;

select c.customer_name, p.product_name, oi.quantity, o.order_date
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id;

select order_id, payment_mode, payment_status, amount
from payments;

select order_id, delivery_partner, delivery_status
from deliveries;

select c.customer_name, c.city, o.order_id, o.order_date,
p.product_name, p.category, oi.quantity, p.price,
pay.payment_status, d.delivery_status
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
join payments pay on o.order_id = pay.order_id
join deliveries d on o.order_id = d.order_id;

-- PART 6: GROUP BY AND HAVING:
select c.city, sum(pay.amount) as total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
join payments pay on o.order_id = pay.order_id
where pay.payment_status = 'success'
group by c.city;

select c.customer_name, sum(pay.amount) as total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
join payments pay on o.order_id = pay.order_id
where pay.payment_status = 'success'
group by c.customer_name;

select p.product_name, sum(oi.quantity) as total_quantity_sold
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_name;

select p.category, sum(p.price * oi.quantity) as revenue
from products p
join order_items oi on p.product_id = oi.product_id
group by p.category;

select c.customer_name, count(o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name;

select c.customer_name, count(o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) > 1;

select p.category, sum(p.price * oi.quantity) as revenue
from products p
join order_items oi on p.product_id = oi.product_id
group by p.category
having sum(p.price * oi.quantity) > 10000;

select city, count(*) as total_customers
from customers
group by city
having count(*) > 2;

select p.product_name, sum(oi.quantity) as total_quantity_sold
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_name
having sum(oi.quantity) > 3;

-- PART 7: SUBQUERIES:
select *
from customers
where customer_id in (select customer_id from orders);

select *
from customers
where customer_id not in (select customer_id from orders);

select *
from products
where product_id not in (select product_id from order_items);

select *
from payments
where amount > (select avg(amount) from payments);

select c.customer_name, p.amount
from customers c
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
where p.amount = (select max(amount) from payments);

select *
from products
where price > (select avg(price) from products);

select *
from customers
where customer_id in (
select o.customer_id
from orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where p.category = 'electronics'
);

select *
from orders
where order_id in (
select order_id
from payments
where payment_status = 'success'
);

select *
from orders
where order_id in (
select order_id
from deliveries
where delivery_status <> 'delivered'
);

select c.customer_name, sum(p.amount) as total_spending
from customers c
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
group by c.customer_id, c.customer_name
having sum(p.amount) > (
select avg(total_amount)
from (
select sum(p2.amount) as total_amount
from customers c2
join orders o2 on c2.customer_id = o2.customer_id
join payments p2 on o2.order_id = p2.order_id
group by c2.customer_id
) as customer_totals
);

-- PART 8: DATA QUALITY CHECKS: 
select *
from orders o
left join payments p
on o.order_id = p.order_id
where p.order_id is null;

select *
from orders o
left join deliveries d
on o.order_id = d.order_id
where d.order_id is null;

select *
from payments
where amount is null
or amount = 0;

select o.order_id, o.order_status, p.payment_status
from orders o
join payments p
on o.order_id = p.order_id
where o.order_status = 'cancelled'
and p.payment_status = 'success';

select o.order_id, d.delivery_status, p.payment_status
from orders o
join deliveries d
on o.order_id = d.order_id
join payments p
on o.order_id = p.order_id
where d.delivery_status = 'delivered'
and p.payment_status = 'failed';

select oi.*
from order_items oi
left join products p
on oi.product_id = p.product_id
where p.product_id is null;

select o.*
from orders o
left join customers c
on o.customer_id = c.customer_id
where c.customer_id is null;

