-- --TO CREATE DATABASE
CREATE DATABASE inventory_management;

-- --TO SELECT A DESIRED DATABASE FOR USE
USE inventory_management;

-- --TO CREATE ENTITIES(TABLES) FOR THE DATABASE
CREATE TABLE users (
userID BIGINT,
username VARCHAR(20),
userpassword VARCHAR(8),
email VARCHAR(20),
phone_number BIGINT,
address VARCHAR(50),
gender ENUM("male", "female"),
PRIMARY KEY (userID)
);

CREATE TABLE customers (
customerID BIGINT,
firstName VARCHAR(50),
lastName VARCHAR(50),
city VARCHAR(20),
postal_code VARCHAR(20),
region VARCHAR(50),
country VARCHAR(50),
userID BIGINT,
PRIMARY KEY (customerID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE admins (
adminID BIGINT,
firstName VARCHAR(20),
lastName VARCHAR(8),
userID BIGINT,
PRIMARY KEY (adminID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE sales_people (
sales_personID BIGINT,
firstName VARCHAR(20),
lastName VARCHAR(8),
userID BIGINT,
PRIMARY KEY (sales_personID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE categories (
categoryID BIGINT,
category_name VARCHAR(20),
description VARCHAR(255),
PRIMARY KEY (categoryID)
);

CREATE TABLE products (
productID BIGINT,
product_name VARCHAR(20),
unit_price VARCHAR(8),
quantity_in_a_unit BIGINT,
size INT,
color VARCHAR(20),
description VARCHAR(255),
sales_personID BIGINT,
categoryID BIGINT,
PRIMARY KEY (productID),
FOREIGN KEY (sales_personID) REFERENCES sales_people(sales_personID),
FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

CREATE TABLE orders (
orderID BIGINT,
order_date DATE,
ship_address VARCHAR(255),
ship_city VARCHAR(255),
ship_postalCode VARCHAR(255),
ship_country VARCHAR(255),
units_on_order INT,
customerID BIGINT,
sales_personID BIGINT,
PRIMARY KEY (orderID),
FOREIGN KEY (sales_personID) REFERENCES sales_people(sales_personID),
FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE orders_products (
orders_products_ID BIGINT,
orderID BIGINT,
customerID BIGINT,
PRIMARY KEY (orders_products_ID),
FOREIGN KEY (orderID) REFERENCES orders(orderID),
FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- -- TO INSERT RECORDS INTO THE ENTITIES(TABLES)
 INSERT INTO users VALUES 
 ("1", "sulaimon123", "ras24", "maito4me@gmail.com", "08181699389", 
 "66, adeniji street, Alakuko, Lagos, Nigeria", "male"),

 ("2", "stephen88", "osun67", "loree@gmail.com", "0906543211386", 
 "100, ademola street, Alakuko, Lagos, Lagos, Nigeria", "male"),

 ("3", "lawal123", "las24", "maito4me@gmail.com", "08181699389", 
 "66, adeniji street, Alakuko, Lagos, Nigeria", "male"),

("4", "gand88", "rus67", "loree@gmail.com", "0906543211386", 
"100, ademola street, Alakuko, Lagos, Nigeria", "male");

INSERT INTO customers VALUES 
 ("1", "Sulaimon", "Taiwo", "Lagos", "00001", 
 "Alakuko", "Nigeria", 1),

 ("2", "Stephen", "Banire", "Ogun", "00002", 
 "Ipaja", "Nigeria", 2);
 
 INSERT INTO admin VALUES 
 ("1", "Segun", "Tolani", 3),

 ("2", "Lawal", "Kehinde", 4);

INSERT INTO sales_people VALUES 
 ("1", "Jhon", "Benson", 1),

 ("2", "Gadson", "ruslin", 4);
 
 INSERT INTO categories VALUES
 (1, "footWares", "These contain every kind of foot wares"),

 (2, "drinks", "These contain every kind of soft drinks");
 
INSERT INTO products VALUES 
("1", "Shoe", "N10000", 1, 42, "black", "A black leather material shoe with a lace", 2, 1),

("2", "soap", "N500", 3, null, "white", "A white soap with smooth texture", 2, 2);

INSERT INTO orders VALUES 
("1", "2023-09-1","49 Adebola street","Lagos", "00001", "Nigeria", "1", 1, 2),

("2", "2023-09-2", "12 ajasin street", "Ogun", "00010", "Nigeria", "2", 2, 1);

INSERT INTO orders_products VALUES 
(1,1, 2),

(2,2, 1);


-- --TO GET RECORDS FROM ENTITIES(TABLES)
SELECT * FROM customers;

SELECT * FROM sales_people;

SELECT * FROM products;


-- --TO UPDATE RECORDS IN ENTITIES(TABLES)
UPDATE products 
SET unit_price = "N9000"
WHERE productID = 1;

UPDATE customers 
SET lastName = "Rasheed"
WHERE customerID = 1;


-- --TO DELETE RECORDS FROM ENTITIES(TABLES)
DELETE FROM products WHERE productID = 2;

DELETE FROM orders WHERE orderID = 2;