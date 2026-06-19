create database if not exists inventory_db;
use inventory_db;

-- suppliers first since products depend on it
create table suppliers (
    supplier_id int auto_increment primary key,
    supplier_name varchar(100) not null,
    contact_name varchar(100),
    phone varchar(20),
    email varchar(100),
    address text,
    created_at datetime default current_timestamp
);

create table warehouses (
    warehouse_id int auto_increment primary key,
    warehouse_name varchar(100) not null,
    location varchar(150),
    capacity int default 0,
    created_at datetime default current_timestamp
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(150) not null,
    category varchar(100),
    unit_price decimal(10,2) not null default 0.00,
    reorder_level int not null default 10,
    overstock_level int not null default 500,
    supplier_id int,
    created_at datetime default current_timestamp,
    foreign key (supplier_id) references suppliers(supplier_id)
);

create table stock_movements (
    movement_id int auto_increment primary key,
    product_id int not null,
    warehouse_id int not null,
    movement_type enum('IN', 'OUT', 'ADJUSTMENT') not null,
    quantity int not null,
    movement_date datetime default current_timestamp,
    remarks varchar(255),
    foreign key (product_id) references products(product_id),
    foreign key (warehouse_id) references warehouses(warehouse_id)
);

-- live snapshot of stock per product per warehouse
create table stock_levels (
    stock_id int auto_increment primary key,
    product_id int not null,
    warehouse_id int not null,
    current_stock int not null default 0,
    last_updated datetime default current_timestamp on update current_timestamp,
    unique key uq_product_warehouse (product_id, warehouse_id),
    foreign key (product_id) references products(product_id),
    foreign key (warehouse_id) references warehouses(warehouse_id)
);


-- indexes
create index idx_product_id on stock_movements(product_id);
create index idx_warehouse_id on stock_movements(warehouse_id);
create index idx_movement_date on stock_movements(movement_date);
create index idx_product_category on products(category);
create index idx_stock_product on stock_levels(product_id);
create index idx_stock_warehouse on stock_levels(warehouse_id);

-- seed data

insert into suppliers (supplier_name, contact_name, phone, email, address) values
('TechParts Ltd', 'Arjun Sharma', '9876543210', 'arjun@techparts.com', 'Chennai, TN'),
('GlobalStock Inc', 'Priya Nair', '9123456780', 'priya@globalstock.com', 'Bangalore, KA'),
('QuickSupply Co', 'Ramesh Kumar', '9988776655', 'ramesh@quicksupply.in', 'Coimbatore, TN');

insert into warehouses (warehouse_name, location, capacity) values
('Warehouse Alpha', 'Coimbatore', 1000),
('Warehouse Beta', 'Chennai', 1500),
('Warehouse Gamma', 'Bangalore', 2000);

insert into products (product_name, category, unit_price, reorder_level, overstock_level, supplier_id) values
('Wireless Mouse', 'Electronics', 799.00, 15, 300, 1),
('Mechanical Keyboard', 'Electronics', 1999.00, 10, 200, 1),
('USB-C Hub', 'Electronics', 1299.00, 20, 250, 2),
('Laptop Stand', 'Accessories', 599.00, 12, 350, 2),
('HDMI Cable 2m', 'Accessories', 299.00, 30, 500, 3),
('Webcam 1080p', 'Electronics', 2499.00, 8, 150, 1),
('Desk Lamp LED', 'Furniture', 899.00, 10, 400, 3),
('Ergonomic Chair', 'Furniture', 12999.00, 5, 100, 2);

insert into stock_levels (product_id, warehouse_id, current_stock) values
(1, 1, 120), (1, 2, 80), (1, 3, 60),
(2, 1, 8), (2, 2, 12), (2, 3, 5), 
(3, 1, 45), (3, 2, 30), (3, 3, 20),
(4, 1, 400), (4, 2, 380), 
(5, 1, 25), (5, 2, 18), (5, 3, 6),
(6, 1, 4), (6, 2, 3), 
(7, 1, 55), (7, 2, 70), (7, 3, 90),
(8, 1, 3), (8, 2, 2); 


-- reads

select
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,
    p.reorder_level,
    p.overstock_level,
    s.supplier_name
from products p
join suppliers s on p.supplier_id = s.supplier_id;

select
    p.product_name,
    w.warehouse_name,
    sl.current_stock,
    p.reorder_level,
    p.overstock_level,
    case
        when sl.current_stock <= p.reorder_level then 'REORDER NOW'
        when sl.current_stock >= p.overstock_level then 'OVERSTOCKED'
        else 'OK'
    end as stock_status
from stock_levels sl
join products p on sl.product_id = p.product_id
join warehouses w on sl.warehouse_id = w.warehouse_id
order by p.product_name, w.warehouse_name;

select
    p.product_name,
    sum(sl.current_stock) as total_stock
from stock_levels sl
join products p on sl.product_id = p.product_id
group by p.product_id, p.product_name;


-- stock movements

insert into stock_movements (product_id, warehouse_id, movement_type, quantity, remarks)
values (2, 1, 'IN', 50, 'Restocked from TechParts PO#1021');

update stock_levels
set current_stock = current_stock + 50
where product_id = 2 and warehouse_id = 1;

insert into stock_movements (product_id, warehouse_id, movement_type, quantity, remarks)
values (5, 2, 'OUT', 10, 'Dispatched for order #4455');

update stock_levels
set current_stock = current_stock - 10
where product_id = 5 and warehouse_id = 2;

insert into stock_movements (product_id, warehouse_id, movement_type, quantity, remarks)
values (6, 1, 'ADJUSTMENT', 20, 'Physical count found extra units');

update stock_levels
set current_stock = current_stock + 20
where product_id = 6 and warehouse_id = 1;

-- cleanup logs older than a year
delete from stock_movements
where movement_date < date_sub(now(), interval 1 year);

-- stored procedures

delimiter $$

create procedure sp_reorder_alerts()
begin
    select
        p.product_id,
        p.product_name,
        p.category,
        s.supplier_name,
        s.email as supplier_email,
        w.warehouse_name,
        sl.current_stock,
        p.reorder_level,
        (p.reorder_level - sl.current_stock) as shortage_qty
    from stock_levels sl
    join products p on sl.product_id = p.product_id
    join warehouses w on sl.warehouse_id = w.warehouse_id
    join suppliers s on p.supplier_id = s.supplier_id
    where sl.current_stock <= p.reorder_level
    order by shortage_qty desc;
end$$

create procedure sp_overstock_alerts()
begin
    select
        p.product_id,
        p.product_name,
        p.category,
        w.warehouse_name,
        sl.current_stock,
        p.overstock_level,
        (sl.current_stock - p.overstock_level) as excess_qty,
        round((sl.current_stock - p.overstock_level) * p.unit_price, 2) as excess_value_inr
    from stock_levels sl
    join products p on sl.product_id = p.product_id
    join warehouses w on sl.warehouse_id = w.warehouse_id
    where sl.current_stock >= p.overstock_level
    order by excess_value_inr desc;
end$$

create procedure sp_movement_history(in p_product_id int)
begin
    select
        sm.movement_id,
        p.product_name,
        w.warehouse_name,
        sm.movement_type,
        sm.quantity,
        sm.movement_date,
        sm.remarks
    from stock_movements sm
    join products p on sm.product_id = p.product_id
    join warehouses w on sm.warehouse_id = w.warehouse_id
    where sm.product_id = p_product_id
    order by sm.movement_date desc;
end$$

create procedure sp_transfer_stock(
    in p_product_id int,
    in p_from_warehouse int,
    in p_to_warehouse int,
    in p_quantity int
)
begin
    declare v_available int;

    select current_stock into v_available
    from stock_levels
    where product_id = p_product_id and warehouse_id = p_from_warehouse;

    if v_available < p_quantity then
        signal sqlstate '45000'
        set message_text = 'not enough stock to transfer';
    else
        update stock_levels
        set current_stock = current_stock - p_quantity
        where product_id = p_product_id and warehouse_id = p_from_warehouse;

        insert into stock_levels (product_id, warehouse_id, current_stock)
        values (p_product_id, p_to_warehouse, p_quantity)
        on duplicate key update current_stock = current_stock + p_quantity;

        insert into stock_movements (product_id, warehouse_id, movement_type, quantity, remarks)
        values
            (p_product_id, p_from_warehouse, 'OUT', p_quantity, concat('transfer out to wh#', p_to_warehouse)),
            (p_product_id, p_to_warehouse, 'IN', p_quantity, concat('transfer in from wh#', p_from_warehouse));

        select 'transfer done' as result;
    end if;
end$$

delimiter ;

-- test

call sp_reorder_alerts();
call sp_overstock_alerts();
call sp_movement_history(2);
call sp_transfer_stock(1, 1, 2, 30);