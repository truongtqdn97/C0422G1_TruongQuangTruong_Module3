drop database if exists View_Index_SP;

-- Bước 1: Tạo cơ sở dữ liệu demo
create database View_Index_SP;

use View_Index_SP;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau
create table product(
	id int primary key auto_increment,
    product_code varchar(20),
    product_name varchar(50),
	product_price int,
	product_amount int,
	product_description varchar(50),
	product_status varchar(50)
);

-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into product (product_code, product_name, product_price, product_amount, product_description, product_status)
	value ('100', 'nguyen van mot', 1100, 11, null, 'con'),
		  ('202', 'nguyen thi hai', 2200, 2, 'hai hai', 'con'),
		  ('330', 'tran minh ba', 3300, 30, 'ba ba', 'het'),
		  ('444', 'ngo minh bon', 4400, 4, 'bon bon', null);


-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code
	on product(product_code);
    
drop index index_product_code on product;
    
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_product_name_price
	on product(product_name, product_price);
    
    
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select *
from product
where product_code = '202';


-- So sánh câu truy vấn trước và sau khi tạo index
-- trước: rows = 4, sau: rows = 1

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select product_code, product_name, product_price, product_status
from product;

select *
from product_view;

-- Tiến hành sửa đổi view
create or replace view product_view as
select product_code, product_name, product_price, product_status
from product
where product_price < 3000;

select *
from product_view;

-- Tiến hành xoá view
drop view product_view;


-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_info()
begin
	select *
    from product;
end //
delimiter ;

call get_info();


-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new(
	in p_code varchar(20), 
    in p_name varchar(50), 
    in p_price int, 
    in p_amount int,  
    in p_description varchar(50),
    in p_status varchar(50)
    )
begin
	insert into product (product_code, product_name, product_price, product_amount, product_description, product_status)
	value (p_code, p_name, p_price, p_amount, p_description, p_status);
end //
delimiter ;

call add_new('555', 'nguyen van nam', 500, 5, null, 'con');

call get_info();


-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit(
	in p_id int,
    in p_code varchar(20), 
    in p_name varchar(50), 
    in p_price int, 
    in p_amount int,  
    in p_description varchar(50),
    in p_status varchar(50)
    )
begin
	update product set product_code = p_code, 
    product_name = p_name, 
    product_price = p_price, 
    product_amount = p_amount,
    product_description = p_description, 
    product_status = p_status
    where id = p_id;
end //
delimiter ;

call edit(1, '111', 'nguyen van mot da sua', 1100, 11, null, 'con');

call get_info();


-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(
	in p_id int
    )
begin
	delete from product
    where id = p_id;
end //
delimiter ;

call delete_product(4);
call get_info();
