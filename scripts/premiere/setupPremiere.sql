/* MySQL script

   Author: Nagarajan Prabakar 7/17/14

   Phase 1: Drop all five tables of Premiere database if they exist
    in the correct sequence without violating foreign key constraints
*/

-- if "OrderLine" table already exists, remove the table
  drop table if exists orderline;
 
-- if "Part" table already exists, remove the table
  drop table if exists part;

-- if "Orders" table already exists, remove the table
  drop table if exists orders;

-- if "Customer" table already exists, remove the table
  drop table if exists customer;

-- if "Rep" table already exists, remove the table
  drop table if exists rep;


/* Phase 2: Create all five empty tables of Premiere database */

-- create a new empty table Rep
CREATE TABLE rep
( repnum CHAR(2) not null,
  lastname CHAR(15),
  firstname CHAR(15),
  street CHAR(15),
  city CHAR(15),
  state CHAR(2),
  zip CHAR(5),
  commission DECIMAL(7,2),
  rate DECIMAL(3,2),
  constraint rep_pk
    primary key(repnum)
);

-- create a new empty table Customer
CREATE TABLE customer
( customernum CHAR(3) not null,
  customername CHAR(35) not null,
  street CHAR(15),
  city CHAR(15),
  state CHAR(2),
  zip CHAR(5),
  balance DECIMAL(8,2),
  creditlimit DECIMAL(8,2),
  repnum CHAR(2),
  constraint cust_pk
    primary key(customernum),
  constraint custRep_fk
    foreign key (repnum) references rep(repnum)
);

-- create a new empty table Orders
CREATE TABLE orders
( ordernum CHAR(5) not null,
  orderdate CHAR(11),
  customernum CHAR(3),
  constraint orders_pk
    primary key(ordernum),
  constraint orderscust_fk
    foreign key (customernum) references customer(customernum)
);

-- create a new empty table Part
CREATE TABLE part
( partnum CHAR(4) not null,
  description CHAR(15),
  onhand DECIMAL(4,0),
  class CHAR(2),
  warehouse CHAR(1),
  price DECIMAL(6,2),
  constraint part_pk
    primary key(partnum)
);

-- create a new empty table OrderLine
CREATE TABLE orderline
( ordernum CHAR(5) not null,
  partnum CHAR(4) not null,
  numordered DECIMAL(3,0),
  quotedprice DECIMAL(6,2),
  constraint oline_pk
    primary key(ordernum, partnum),
  constraint olineorders_fk
    foreign key (ordernum) references orders(ordernum),
  constraint olinepart_fk
    foreign key (partnum) references part(partnum)
);


/* Phase 3: Add rows of data to each of these five empty tables of Premiere DB*/

-- Insertion of three Rep rows
INSERT INTO rep
VALUES
('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05);
INSERT INTO rep
VALUES
('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07);
INSERT INTO rep
VALUES
('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);

-- Insertion of ten Customer rows
INSERT INTO customer
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20');
INSERT INTO customer
VALUES
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35');
INSERT INTO customer
VALUES
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65');
INSERT INTO customer
VALUES
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35');
INSERT INTO customer
VALUES
('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65');
INSERT INTO customer
VALUES
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20');
INSERT INTO customer
VALUES
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65');
INSERT INTO customer
VALUES
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35');
INSERT INTO customer
VALUES
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35');
INSERT INTO customer
VALUES
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');

-- Insertion of seven Orders rows
INSERT INTO orders
VALUES
('21608','20-OCT-2007','148');
INSERT INTO orders
VALUES
('21610','20-OCT-2007','356');
INSERT INTO orders
VALUES
('21613','21-OCT-2007','408');
INSERT INTO orders
VALUES
('21614','21-OCT-2007','282');
INSERT INTO orders
VALUES
('21617','23-OCT-2007','608');
INSERT INTO orders
VALUES
('21619','23-OCT-2007','148');
INSERT INTO orders
VALUES
('21623','23-OCT-2007','608');

-- Insertion of ten Part rows
INSERT INTO part
VALUES
('AT94','Iron',50,'HW','3',24.95);
INSERT INTO part
VALUES
('BV06','Home Gym',45,'SG','2',794.95);
INSERT INTO part
VALUES
('CD52','Microwave Oven',32,'AP','1',165.00);
INSERT INTO part
VALUES
('DL71','Cordless Drill',21,'HW','3',129.95);
INSERT INTO part
VALUES
('DR93','Gas Range',8,'AP','2',495.00);
INSERT INTO part
VALUES
('DW11','Washer',12,'AP','3',399.99);
INSERT INTO part
VALUES
('FD21','Stand Mixer',22,'HW','3',159.95);
INSERT INTO part
VALUES
('KL62','Dryer',12,'AP','1',349.95);
INSERT INTO part
VALUES
('KT03','Dishwasher',8,'AP','3',595.00);
INSERT INTO part
VALUES
('KV29','Treadmill',9,'SG','2',1390.00);

-- Insertion of nine OrderLine rows
INSERT INTO orderline
VALUES
('21608','AT94',11,21.95);
INSERT INTO orderline
VALUES
('21610','DR93',1,495.00);
INSERT INTO orderline
VALUES
('21610','DW11',1,399.99);
INSERT INTO orderline
VALUES
('21613','KL62',4,329.95);
INSERT INTO orderline
VALUES
('21614','KT03',2,595.00);
INSERT INTO orderline
VALUES
('21617','BV06',2,794.95);
INSERT INTO orderline
VALUES
('21617','CD52',4,150.00);
INSERT INTO orderline
VALUES
('21619','DR93',1,495.00);
INSERT INTO orderline
VALUES
('21623','KV29',2,1290.00);

/* End of Premiere database script */
