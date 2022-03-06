-- create table for manufacturer
create table if not exists public.manufacturer (
    manufacturer_id int not null,
    manufacturer_name varchar(50) not null,
    purchase_date timestamp not null,
    PRIMARY KEY (manufacturer_id)
);

-- create table for customer
create table if not exists public.customer (
    customer_id int not null,
    customer_name varchar(50) not null,
    customer_phone varchar(50) not null,
    transaction_id int not null,
    PRIMARY KEY (customer_id)
);

-- create table for transaction 
create table if not exists public.transaction_table (
    transaction_id int not null,
    car_id int not null,
    customer_id int not null,
    salesperson_id int not null,
    sold_dt timestamp not null,
    PRIMARY KEY (transaction_id)
);

-- create table for car 
create table if not exists public.car (
    car_id int not null,
    manufacturer_id int not null,
    transaction_id int not null,
    car_name varchar(50) not null,
    model_name varchar(50) not null,
    serial_name varchar(50) not null,
    weight_data numeric not null,
    price numeric not null,
    PRIMARY KEY (car_id)
);

-- create table for salesperson
create table if not exists public.salesperson (
    salesperson_id int not null,
    car_id int not null,
    transaction_id int not null,
    dob timestamp null,
    gender varchar(50) not null,
    entered_dt timestamp not null,
    PRIMARY KEY (salesperson_id)
);

