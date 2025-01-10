-- Task 1: In which courses is the number of participants above average?
-- Print each course.
select ainenro, kurssikerta, osallistujalkm
from KURSSI
where osallistujalkm >
(select avg (osallistujalkm)
from kurssi);

-- Task 2: Which students have not completed any courses?
-- Print the names of the students.
select oppilasnro, sukunimi, etunimi
from OPPILAS
where oppilasnro not in
(select distinct oppilasnro from SUORITUS
where arvosana is not null);

-- Task 3: List the names of students who have only grades of 3 (courses completed with a grade of 3).
select o.sukunimi, o.etunimi
from oppilas o
where o.oppilasnro IN (
    select s.oppilasnro
    from suoritus s
    where s.arvosana = 3
)
except
select o.sukunimi, o.etunimi
from oppilas o
join suoritus s on o.oppilasnro = s.oppilasnro
where s.arvosana != 3;

-- Task 4: In which subjects are there only male students?
-- List the subject names.
select a.nimi as aineen_nimi
from aine a
where ainenro in (
select s.ainenro
from suoritus s
join oppilas o on o.oppilasnro = s.oppilasnro
where o.sukupuoli='M' and s.arvosana is not null
except
select s.ainenro
from suoritus s
join oppilas o on o.oppilasnro = s.oppilasnro
where o.sukupuoli='N' and s.arvosana is not null
)
order by aineen_nimi;

-- Task 5: List the students who have completed more than two courses. 
-- Print the students' names.
select sukunimi, etunimi
from oppilas
where oppilasnro in
    (select oppilasnro
     from suoritus
     group by oppilasnro
     having count(arvosana) > 2)
order by sukunimi, etunimi;

-- Task 6: List the subjects that have more than four course completions.
-- Print the subject names.
select nimi as aineen_nimi
from aine
where ainenro in
(select ainenro
from suoritus
group by ainenro
having count(arvosana) > 4);

-- Task 7a: List the names of all individuals (students and teachers) ordered by last name.
-- Print their names alphabetically by last name.
(select sukunimi, etunimi
from opettaja)
union
(select sukunimi, etunimi
from oppilas)
order by sukunimi;

-- Task 7b: List the contact details of both students and teachers. 
-- For teachers, print their name and phone number, along with a note that they are a teacher.
-- For students, print their name and address details, along with a note that they are a student.
-- Order by type of individual and secondarily by name.
(select 'Opettaja' as tyyppi, sukunimi + ' ' + etunimi as nimi, puhelin, null as osoite
 from opettaja)
union
(select 'Oppilas' as tyyppi, sukunimi + ' ' + etunimi as nimi, null, lahiosoite + ' ' + postinro + ' ' + postitmp as osoite
 from oppilas)
order by tyyppi, nimi;

-- Task 8: Add a completion for Sanna Rentukka. Set the course number to a290, 
-- the course session to 2, the date to 'ajopvm', the grade to 3, and the issuer to h303.
insert into suoritus
(oppilasnro, ainenro, kurssikerta, pvm, arvosana, myontaja)
values
('o148','a290',2, Getdate(), 3, 'h303');

-- Task 9: Add a new row to the KURSSI table. 
-- Set the course number for 'Tieto tietokannoista' to 3, the teacher to Sisko Saari,
-- the start date to 5.8.1997, and the number of participants to 8.
insert into kurssi
(ainenro, kurssikerta, alkupvm, opettajanro, osallistujalkm)
values
('a480', 3, '1997-08-05','h290',8);

-- Task 10: Following Takkula's recruitment method, add to the OPETTAJA table 
-- those students who have received a grade of 4 in any course. 
-- Set the teacher's number to the student's number, salary to 0, and phone number as NULL.
insert into opettaja
(opettajanro, sukunimi, etunimi, palkka, puhelin, syntpvm)
select distinct o.oppilasnro, sukunimi, etunimi, 0.00, null, syntpvm
from oppilas o
join suoritus s on o.oppilasnro= s.oppilasnro
where arvosana = 4;

-- Task 11: Update the address of student Sanna Rentukka to 'Lammenranta 2, 02970 Espoo'
update oppilas
set lahiosoite='Lammenranta 2', postinro='02970', postitmp='Espoo'
where oppilasnro = 'o148';
update oppilas
set lahiosoite='Lammenranta 2', postinro='02970', postitmp='Espoo'
where sukunimi = 'Rentukka' and etunimi='Sanna';

-- Task 12: Change the gender codes of students 'M' and 'N' to lowercase 'm' and 'n' in one update statement.
update oppilas
set sukupuoli = lower(sukupuoli);

-- Task 13: Increase the salaries of teachers who are responsible for a subject (head teachers) by 10%.
update opettaja
set palkka = palkka*1.1
where opettajanro in
(select distinct vastuuopettaja
from aine);

-- Task 14: Delete the completion records where there is no grade.
delete suoritus
where arvosana IS NULL;

