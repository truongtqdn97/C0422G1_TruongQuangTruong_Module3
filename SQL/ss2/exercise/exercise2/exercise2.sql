DROP DATABASE IF EXISTS exe2;

CREATE DATABASE exe2;

USE exe2;

CREATE TABLE customer (
    c_id VARCHAR(10) PRIMARY KEY,
    c_name VARCHAR(50),
    c_age INT
);

CREATE TABLE `order` (
    o_id VARCHAR(10) PRIMARY KEY,
    c_id VARCHAR(10),
    o_date DATETIME NOT NULL,
    o_total_price INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

CREATE TABLE product (
    p_id VARCHAR(10) PRIMARY KEY,
    p_name VARCHAR(50) NOT NULL,
    p_price INT NOT NULL
);

CREATE TABLE order_detail (
    o_id VARCHAR(10),
    p_id VARCHAR(10),
    od_quantity INT NOT NULL,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);