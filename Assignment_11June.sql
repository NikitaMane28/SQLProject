use sqlpractice;
create table customer
(
cust_id int,
cust_name varchar(30),
city varchar(20),
country varchar(20),
postal_code int,
constraint pk_cust primary key(cust_id)
);
select * from customer;
insert into customer values(1, 'Nidhi', 'Mumbai','India',410211),
(2,'Luna', 'Berlin','Germany', 625143),
(3,'Abhi', 'Nashik','India' ,415246),
(4,'Raj','Pune','India',420153),
(5,'Daizy','London','England',246251),
(6,'Anu','Paris','France',415246),
(7,'Naman','Nashik','India',415246),
(8,'Mahi','Latur','India',410452),
(9,'Jones','Rome','Itely',152463),
(10,'Gatha','Latur','India',410452);



--  1. select the City column from the Customers table
select city from customer;
-- 2.  Select all the different values from the Country column in the Customers table.
select distinct country from customer;
-- 3. Select all records where the City column has the value "London
select * from customer where city = 'london' ;
-- 4. Use the NOT keyword to select all records where City is NOT "Berlin"
select * from customer where not city= 'Berlin' ;
-- 5. Select all records where the CustomerID column has the value 23.
select * from customer where cust_id = 8;
-- 6. Select all records where the City column has the value 'Berlin' and 
-- the PostalCode column has the value 121110.
select * from customer where city = 'Berlin'and postal_code = 625143;
-- 7. Select all records where the City column has the value 'Berlin' or 'London'.
select * from customer where city = 'Berlin' or  city = 'London';
update customer set postal_code = null where cust_id= 5;

-- 8 Select all records from the Customers table, 
-- sort the result alphabetically by the column City.
select * from customer order by city;
-- 9 Select all records from the Customers table, 
-- sort the result reversed alphabetically by the column City.
select * from customer order by city desc;

-- 10 Select all records from the Customers table, sort the result alphabetically, 
-- first by the column Country, then, by the column City
select * from customer order by country, city ;

-- 11. Select all records from the Customers where the PostalCode column is empty.
select * from customer where postal_code is null;
-- 12. Select all records from the Customers where the PostalCode column is NOT empty.
select * from customer where postal_code is not null;
-- 13.Set the value of the City columns to 'Oslo',
-- but only the ones where the Country column has the value "Norway".
update customer set country = 'Norway' where cust_id= 8;
update customer set city = 'Oslo' where country = 'Norway';
-- 14. Delete all the records from the Customers table where the Country value is 'Norway'.
delete from customer where country = 'Norway';
rollback;
-- 15. Use the MIN function to select the record with 
-- the smallest value of the Price column.
select min(product_price) as 'min price' from product;
-- 16 Use an SQL function to select the record with the
-- highest value of the Price column.
select max(product_price) as 'max price' from product;

-- 17 Use the correct function to return the number of records that have the Price value set to 20
select count(*) from product where product_price =20;

-- 18 Use an SQL function to calculate the average price of all products.
select avg(product_price) as avg_price from product;
-- 19 Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(product_price) as Total_price from product;
-- 20. Select all records where the value of the City column starts with the letter "b".
select * from customer where city like 'b%' ;
-- 21. Select all records where the value of the City column ends with the letter "n".
select * from customer where city like '%n' ;
-- 22. Select all records where the value of the City column contains the letter "a".
select * from customer where city like '%a%' ;
-- 23. Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customer where city like 'a%b' ;
-- 24 Select all records where the value of the City column does NOT start with the letter "a".
select * from customer where city not like 'a%' ;
-- 25 Select all records where the second letter of the City is an "u".
select * from customer where city like '_u%' ;
select * from customer where city like 'b____';
select * from customer where city like '____n';

--  26. Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customer where city like 'l%' or city like 'm%' or city like 'n%' ;

-- 27 Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customer where city like 'a%' ;
-- 28 Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customer where city not like 'a%' and city not like 'c%' and city not like 'f%';

-- 29 Use the IN operator to select all the records where the Country is either "Norway" or "France"
select * from customer where country in ('Itely','france');

-- 30 Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from customer where country not in ('Itely','france');

select * from product;
insert into product values (101, 'Geitost', 50),
(102, 'Pavloa', 15),
(103,'Cornbread',75),
(104,'Donut',20);

-- 31 Use the BETWEEN operator to select all the records where the 
-- value of the Price column is between 10 and 20
select * from product where product_price between 10 and 20;

-- 32 Use the BETWEEN operator to select all the records where 
-- the value of the Price column is NOT between 10 and 20.
select * from product where product_price not between 10 and 20;

-- 33 Use the BETWEEN operator to select all the records where
--  the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from product where product_name between 'Geitost' and 'Pavlova' ;

-- 34  When displaying the Customers table, make an ALIAS of the PostalCode column, 
-- the column should be called Pno instead.
select postal_code as 'Pno' from customer ;
-- 35 When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from customer as consumers;

-- 36 List the number of customers in each country.
select country, count(*) as NumberOfCustomers
from customer
group by country;
-- 37 List the number of customers in each country, ordered by the country with the most customers first.
select country, count(*) as NumberOfCustomers
from customer
group by country
order by NumberOfCustomers desc;

-- 38 Write the correct SQL statement to create a new database called testDB.
create database testDB ;

-- 39 Write the correct SQL statement to delete a database named testDB
drop database testDB;
-- 40 Add a column of type DATE called Birthday in Persons table
-- Delete the column Birthday from the Persons table





