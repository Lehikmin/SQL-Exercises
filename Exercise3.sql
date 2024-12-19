-- Task 1: List which teachers teach which courses.
-- Display the course number, course session, and the names of the teachers for each course.
select k.ainenro, k.kurssikerta, o.etunimi, o.sukunimi
from OPETTAJA o
join KURSSI k on o.opettajanro=k.opettajanro;

-- Task 2: List the Helsinki students who have received grades <2.
-- Display the student names, hometown, course number, course session, and grade.
select o.etunimi, o.sukunimi, o.postitmp, s.ainenro, s.kurssikerta, s.arvosana
from oppilas o
join suoritus s on o.oppilasnro = s.oppilasnro
where (o.postitmp='Helsinki' or o.postitmp='Helsingfors')
and s.arvosana > 2; 

-- Task 3: List the names of students who have received a grade of 3 in any course.
-- Each name should appear only once in the list.
select distinct o.sukunimi as sukunimi, o.etunimi as etunimi
from OPPILAS o
join SUORITUS s on o.oppilasnro= s.oppilasnro
where s.arvosana = 3;

-- Task 4: List the subjects in which female students have received a grade of 4.
-- Display the names of the students, the names of the subjects, and the grades.
select distinct o.etunimi, o.sukunimi, a.nimi, s.arvosana
from OPPILAS o
join SUORITUS s on o.oppilasnro = s.oppilasnro
join KURSSI k on s.ainenro = k.ainenro
join AINE a on k.ainenro = a.ainenro
where o.sukupuoli = 'N' and s.arvosana = 4;

-- Task 5: List the grades, the names of the students who completed the courses,
-- and the names of the subjects, ordered first by the subject name and then
-- by the student name within the same subject in alphabetical order.
select a.nimi as aineen_nimi, o.sukunimi + o.etunimi as oppilaan_nimi, s.arvosana
from oppilas o
join suoritus s on o.oppilasnro = s.oppilasnro
join aine a on s.ainenro = a.ainenro
order by a.nimi, oppilaan_nimi;

-- Task 6: List the names of students taught by teacher Veli Ponteva.
-- Display the student names in alphabetical order.
select opp.sukunimi + ' ' +  opp.etunimi as oppilaiden_nimet
from opettaja ope
join kurssi k on ope.opettajanro = k.opettajanro
join suoritus s on k.ainenro = s.ainenro
and k.kurssikerta = s.kurssikerta
join oppilas opp on s.oppilasnro = opp.oppilasnro
where ope.sukunimi='Ponteva' and ope.etunimi='Veli'
order by oppilaiden_nimet;

-- Task 7 a): List the name of each course's teacher, the subject name, and the course session,
-- ordered by the teacher's name.
select o.sukunimi, o.etunimi, a.nimi as aineen_nimi, k.kurssikerta
from OPETTAJA o
join KURSSI k on o.opettajanro = k.opettajanro
join aine a on k.ainenro = a.ainenro
order by o.sukunimi, o.etunimi

-- Task 7 b): List the teacher's name, subject name, and course session for each course,
-- ordered by the subject name alphabetically, where the course subject is taught by the subject's responsible teacher.
select o.sukunimi, o.etunimi, a.nimi, k.kurssikerta
from OPETTAJA o
join KURSSI k on o.opettajanro = k.opettajanro
join aine a on k.ainenro = a.ainenro
where a.vastuuopettaja = o.opettajanro
order by a.nimi;

-- Task 8: List the name of each course's teacher, the subject name, and the responsible teacher's name,
-- ordered first by the responsible teacher's name alphabetically and second by the course teacher's name alphabetically.
select vastuuope.sukunimi + vastuuope.etunimi  as Vastuuopettaja, krsope.sukunimi + krsope.etunimi as Opettaja, aine.nimi as aineen_nimi
from opettaja vastuuope
join aine on vastuuope.opettajanro = aine.vastuuopettaja
join kurssi krs on aine.ainenro = krs.ainenro
join opettaja krsope on krs.opettajanro = krsope.opettajanro
order by vastuuope.sukunimi, vastuuope.etunimi, krsope.sukunimi, krsope.etunimi;

-- Task 9: Retrieve the grade for each student in each course, along with the subject code, course code, and subject name.
-- Include students who do not have grades (these students will show as NULL for grades).
-- The results should be sorted by the student's name.
select o.sukunimi, o.etunimi, a.nimi as aineen_nimi, s.arvosana, a.ainenro, s.kurssikerta, s.arvosana
from OPPILAS o
left join suoritus s on o.oppilasnro = s.oppilasnro
left join aine a on s.ainenro = a.ainenro
order by sukunimi;

-- Task 10: List each teacher's ID and name. If the teacher is a responsible teacher for a subject, 
-- also include the name of the subject they are responsible for. 
-- The results should be sorted alphabetically by the teacher's name.

SELECT o.sukunimi, o.etunimi, o.opettajanro, a.nimi as vastuu_aine
FROM opettaja o
LEFT JOIN aine a ON o.opettajanro = a.vastuuopettaja
ORDER BY sukunimi, o.etunimi;