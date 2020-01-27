/*
   Author: Nagarajan Prabakar 7/17/14

   mySQL script file to delete all tables and structures of the PREMIERE DB

   Drop all five tables of Premiere database if they exist
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

