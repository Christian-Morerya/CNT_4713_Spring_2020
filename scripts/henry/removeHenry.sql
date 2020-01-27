/*
   Author: Nagarajan Prabakar 11/15/15

   mySQL script file to delete all tables and structures of the Henry Books DB

   Drop all six tables of Henry database if they exist
    in the correct sequence without violating foreign key constraints
*/

-- if "Inventory" table already exists, remove the table
  drop table if exists Inventory;

-- if "Wrote" table already exists, remove the table
  drop table if exists Wrote;

-- if "Book" table already exists, remove the table
  drop table if exists Book;

-- if "Author" table already exists, remove the table
  drop table if exists Author;
 
-- if "Publisher" table already exists, remove the table
  drop table if exists Publisher;

-- if "Branch" table already exists, remove the table
  drop table if exists Branch;
