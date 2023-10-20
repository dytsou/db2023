create table colors(
    id varchar(4),
    name varchar(40) not null,
    rgb char(6),
    is_trans char(1),
    primary key(id)
);

create table inventories(
    id varchar(5),
    version int,
    set_num varchar(20),
    primary key(id, set_num)
);

create table inventory_parts(
    inventory_id varchar(5),
    part_num varchar(20),
    color_id varchar(4),
    quantity int,
    is_spare char(1),
    primary key(inventory_id, part_num, color_id, quantity, is_spare)
);

create table inventory_sets(
    inventory_id varchar(5),
    set_num varchar(20),
    quantity int,
    primary key(inventory_id, set_num)
);

create table parts(
    part_num varchar(20),
    name varchar(300),
    part_cat_id varchar(3),
    primary key(part_num)
);

create table part_categories(
    id varchar(3),
    name varchar(100) not null,
    primary key(id)
);

create table themes(
    id varchar(4),
    name varchar(100),
    parent_id varchar(4),
    primary key(id)
);

create table sets(
    set_num varchar(20),
    name varchar(100),
    year int,
    theme_id varchar(4),
    num_parts int,
    primary key(set_num)
);
