select * from products
where category = 'Electronics'
and price > 20000;

select * from products 
where supplier_city = 'Hyderabad'
or supplier_city = 'Bangalore';

select * from products
where not category = 'Electronics';

select * from products where 
supplier_city in ('Hyderabad', 'Delhi');

select * from products
where price between 500 and 20000;

select * from products
where product_name like 'P%';

select * from products
where product_name like '%k';

select * from products
where product_name like '%top%';

select product_name as Product,
price as ProductPrice
from products;

select * from products
order by price;

select * from products
order by price desc;

select count(*)
from products;

select count(*)
from products
where category = 'Electronics';

select sum(price)
from products;

select count(*) as TotalProducts,
sum(price) as TotalPrice,
avg(price) as AveragePrice,
max(price) as HighestPrice,
min(price) as LowestPrice
from products;
select category,
count(*) as ProductCount
from products
group by category;

select category,
sum(price) as TotalPrice
from products
group by category;

