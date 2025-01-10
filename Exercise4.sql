-- Task 1: Calculate how much the salaries of teachers would increase if they received a 
-- 200 EUR raise and an additional 15% increase on their original salary.
-- List the teacher's name, old salary, and new salary.
select sukunimi, etunimi, palkka as vanha_palkka, (palkka + 200) * 1.15 as uusi_palkka
from OPETTAJA;

-- Task 2: Retrieve the maximum, minimum, and average salary of teachers, 
-- and calculate the total sum of their salaries. Display these details with appropriate column headers.
select min (palkka) as minimi_palkka, max (palkka) as maximi_palkka, avg (palkka) as
palkkojen_keskiarvo, sum (palkka) as palkkojen_summa
from opettaja;

-- Task 3: Calculate how many teachers earn more than 3200 EUR.
-- Print the number of teachers and provide an appropriate title.
select count (palkka) as Yli_3200_ansaitsevien_lkm
from OPETTAJA
where palkka > 3200;

-- Task 4: Retrieve the names of the postal locations where students live.
-- Each location name should appear only once in the result.
-- Sort the results alphabetically by the location name.
select distinct postitmp as paikat
from OPPILAS
order by paikat;

-- Task 5: Retrieve the number of unique postal locations where students live.
-- Print the number and provide an appropriate title.
select count (distinct postitmp) as eri_paikkakuntia
from OPPILAS;

-- Task 6: List the names and approximate ages of the students
-- (calculated by subtracting the birth year from the current year).
select sukunimi, etunimi,
 Year(Getdate()) - Year(syntpvm) as n_ika
from oppilas
order by sukunimi, etunimi;

-- Task 7: Retrieve the number of participants per subject for courses.
-- Print the subject number and the total number of participants.
select ainenro, sum(osallistujalkm) as osallistujat_yht
from kurssi
group by ainenro
order by ainenro;

-- Task 8: List each subject's subject number along with the minimum, average, and maximum course grades (subject-wise).
select ainenro,
min(arvosana) as minimi,
avg(arvosana) as keskiarvo,
max(arvosana) as maksimi
from suoritus
group by ainenro
order by ainenro;

-- Task 9a: Print each student's student number along with the average, best, and worst grades, and the number of grades.
-- The list should be sorted by average grades.
select oppilasnro,
avg (arvosana) as keskiarvo,
max (arvosana) as maksimi,
min(arvosana) as minimi,
count (arvosana) as maara
from suoritus
where arvosana is not null
group by oppilasnro
order by keskiarvo;

-- Task 9b: Print the same information but only for students with more than one grade.
select oppilasnro,
avg(arvosana) as keskiarvo,
max(arvosana) as maksimi,
min(arvosana) as minimi,
count(arvosana) as maara
from suoritus
group by oppilasnro
having count(arvosana)>1
order by keskiarvo;

-- Task 9c: Print the same information but only for the first courses (kurssikerta = 1).
select oppilasnro,
avg(arvosana) as keskiarvo,
max(arvosana) as maksimi,
min(arvosana) AS minimi,
count(arvosana) as maara
from suoritus
where kurssikerta = 1
group by oppilasnro
order by keskiarvo;
