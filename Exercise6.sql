-- Task 1: List the tables that are available with your user account using the INFORMATION_SCHEMA.TABLES view.
select table_name
from INFORMATION_SCHEMA.TABLES;

-- Task 2a: List the names of your tables and their columns, ordered alphabetically by columns using the INFORMATION_SCHEMA.COLUMNS view.
select table_name, column_name
from INFORMATION_SCHEMA.COLUMNS
order by table_name, column_name;

-- Task 2b: List the names of your tables and their columns, ordered by the order in which the columns are defined, using the ORDINAL_POSITION attribute.
select table_name, column_name
from INFORMATION_SCHEMA.COLUMNS
order by table_name, ORDINAL_POSITION;

-- Task 3a: Show how many columns each table in the 'Takkula' database has.
select table_name as 'taulun nimi', count(column_name) as 'sarakkeiden määrä'
from INFORMATION_SCHEMA.COLUMNS
group by table_name;

-- Task 3b: Count how many primary or foreign keys each table in the 'Takkula' database has.
select table_name as 'taulun nimi', count(constraint_name) as 'Pää- ja viiteavainten lkm'
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
group by table_name;

-- Task 4: Generate DROP TABLE commands for all tables in your schema.
select 'drop table ' + table_name + ';'
from INFORMATION_SCHEMA.TABLES;

-- Task 6a: Create a view 'w_ope1' that excludes the phone number and birthdate from the 'opettaja' table. 
create view w_ope1
as select
opettajanro, etunimi, sukunimi, palkka
from OPETTAJA;

-- Task 6b: Perform a SELECT * query on the view 'w_ope1'
select * from w_ope1;

-- Task 7: Add a new teacher to the 'opettaja' table (note: not directly into the view). 
-- Select all from the view 'w_ope1' (to see the result in the view). 
insert into w_ope1(opettajanro, etunimi, sukunimi, palkka)
values ('h988', 'Kalle', 'Saarinen', 3000);
select * from w_ope1
select * from OPETTAJA

-- Task 8: Create a view 'ope2' that shows the teacher's last name, salary, and birthdate. 
create view w_ope2
as select
sukunimi, palkka, syntpvm
from OPETTAJA
select * from w_ope2

-- Task 9: Add a row to the view 'ope2' where the last name is 'Niemelä', salary is 3500, and birthdate is '1980-03-11'.
-- (Note: The correct date format must be used).
-- Why does the response show an error?
-- Because the teacher number cannot be left empty.
insert into w_ope2(sukunimi, palkka, syntpvm)
values ('Niemelä', '3500', '1980-03-11');

-- Task 10: Remove the teacher with the last name 'Saarinen' from the view 'ope2'.
delete from w_ope2
where sukunimi = 'Saarinen';

-- Task 11: Update the salary of the teacher 'Tahko' by adding 200 in the view 'ope2'.
update w_ope2
set palkka = palkka + 200
where sukunimi = 'Tahko';

-- Task 12 a: Who are the teachers earning more than 3000? 
-- Sort the rows in descending order by salary.
select palkka, sukunimi, etunimi
from OPETTAJA
where palkka >3000
order by palkka desc;

-- Task 12b: Create a view 'opelista1' from the query, but remember that the view should not include the 'ORDER BY' clause.
create view w_opelista1
as select palkka, sukunimi, etunimi 
from OPETTAJA
where palkka >3000;

-- Task 12c: Create a 'SELECT *' query for the view and use 'ORDER BY salary DESC'.
-- Compare the result with the original SELECT statement.
select * from w_opelista1
order by palkka desc;

-- Task 13: Drop the views 'w_ope1', 'ope2', and 'opelista1'.
drop view w_ope1;
drop view w_ope2;
drop view w_opelista1;




