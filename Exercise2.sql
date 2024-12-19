-- Task 1: Retrieve the names of the subjects from the Takkula database where the completion score is 3.
-- Display the subject name and the completion score.
-- 
select nimi, suorituspisteet
from AINE
where suorituspisteet = 3;

-- Task 2: Retrieve the names and salaries of teachers from the database where the salary is greater than 3200€.
-- Display the name and salary of each teacher.
select etunimi, sukunimi, palkka
from OPETTAJA
where palkka >3200;

-- Task 3 a): Retrieve the names of female students from Helsinki.
-- Display the name and postal locality of each student.
select etunimi, sukunimi, postitmp
from oppilas
where sukupuoli = 'N' and (postitmp = 'Helsinki' or postitmp ='Helsingfors');

-- Task 3 b): Retrieve the names of female students who are not from Helsinki.
-- Display the name and postal locality of each student.
select etunimi, sukunimi, postitmp
from OPPILAS
where sukupuoli = 'N' and postitmp != 'Helsinki';

-- Task 4: Retrieve address details for students who live in Espoo or Helsinki
-- in postal code areas between 00400 and 00500.
-- Display the name, postal code, and postal locality of each student.
select etunimi, sukunimi, postinro, postitmp
from oppilas
where postitmp ='Espoo' or postitmp='Esbo' or postinro between '00400' and '00500' ;

-- Task 5: Retrieve address details for students who do not live in postal code areas
-- between 00200 and 00600.
-- Display the name, postal code, and postal locality of each student.
select etunimi, sukunimi, postinro, postitmp
from OPPILAS
where postinro NOT BETWEEN '00200' and '00600';

-- Task 6 a): Retrieve the records where the grade is missing.
-- Display all the details of these records.
select * from SUORITUS
where arvosana is null;

-- Task 6 b): Retrieve the records where the grade is not missing.
-- Display all the details of these records.
select * from SUORITUS
where arvosana is not null;

-- Task 7 a): Retrieve the course records where the end date is missing.
-- Display all the details of these records.
select * from KURSSI
where loppupvm is null;

-- Task 7 b): Retrieve the course records where the end date is not missing.
-- Display all the details of these records.
select * from KURSSI
where loppupvm is not null;

-- Task 8: List all courses ordered by the starting month in ascending order.
-- Display the course number, course session, and the starting month number.
select ainenro, kurssikerta, month(alkupvm) as alkamiskuukausi
from KURSSI
order by alkamiskuukausi asc;

-- Task 9 a): List the names and phone numbers of teachers in alphabetical order by name.
-- Display the teacher's name and phone number.
select sukunimi, etunimi, puhelin
from OPETTAJA
order by sukunimi asc;

-- Task 9 b): List the names and phone numbers of teachers in descending alphabetical order by name.
-- Display the teacher's name and phone number.
select sukunimi, etunimi, puhelin
from OPETTAJA
order by sukunimi desc;

-- Task 9 c): List the names, postal locality, and gender of students,
-- ordered by postal locality in alphabetical order. If multiple students
-- have the same postal locality, order them by name in alphabetical order.
select sukunimi, etunimi, postitmp, sukupuoli
from oppilas
order by postitmp, sukunimi , etunimi;
