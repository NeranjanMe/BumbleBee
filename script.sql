drop database if exists bumble_bee;
create database if not exists bumble_bee;
show databases;

use bumble_bee;

create table admin(
	adminId varchar(5) primary key,
	adminName varchar(100) not null,
	password varchar(100) not null
);
show tables;
desc admin;

drop table if exists customer;
create table customer(
	customerId varchar(5) primary key,
	customerName varchar(100) not null,
	customerAddress varchar(100) not null,
	customerContactNumber varchar(100) not null,
	customerDOB varchar(100) not null,
	customerUserName varchar(100) not null,
	password varchar(100) not null,
	loanStatus int default 0,
	loanAmount DECIMAL(10, 2) default 0.0
);
show tables;
desc customer;


drop table Category;

create table Category(
	categoryId varchar(10),
	categoryName varchar(100) not null,
	constraint primary key(categoryId)
);
show tables;
desc Category;

drop table Brand;

create table Brand(
	brandId varchar(10),
	brandName varchar(100) not null,
	constraint primary key(brandId)
);
show tables;
desc Brand;

drop table product;

create table product(
	productId varchar(5),
	productName varchar(100) not null,
	qtyOnHand int not null,
	unitPrice DECIMAL (6, 2),
	productStatus int not null,
	productCategory varchar(10) not null,
	productBrand varchar(10) not null,
	constraint foreign key(productCategory) references Category(categoryId),
	constraint foreign key(productBrand) references Brand(brandId),
	constraint primary key(productId)
);
show tables;
desc product;

drop table if exists `order`;
create table `order`(
	orderId varchar(5),
	orderDate date not null,
	customerId varchar(6),
	loanAmount DECIMAL(10, 2),
	paidAmount DECIMAL(10, 2),
	constraint primary key(orderId),
	constraint foreign key(customerId) references customer(customerId)
	on delete cascade on update cascade
);
show tables;
desc `order`;


drop table orderDetails;

create table orderDetails(
   	productId varchar(5),
   	orderId varchar(5),
  	orderQty int(11),
   	totalPrice decimal(10 ,2),
   	constraint foreign key(productId) references product(productId)
	on delete cascade on update cascade,
	constraint foreign key(orderId) references `order`(orderId)
	on delete cascade on update cascade
);
show tables;
desc orderDetails;









