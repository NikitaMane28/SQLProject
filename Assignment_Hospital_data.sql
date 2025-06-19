create database hospital_data;
use hospital_data;
create table patients
(
	patient_id int ,
    first_name varchar(30),
    last_name varchar(30),
    gender char(1), 
    birth_date date,
    city varchar(30),
    province_id char(2),
    allergies varchar(30),
    height  decimal(3,0),
    weight decimal(4,0)
);
insert into patients values(1,'Neha','Sawant','F','2000-05-15','Mumbai','MH',null,'5.4','50'),
(2,'Raj','Mote','M','1989-12-25','vashi','MH','egg','5.8','60'),
(3,'Supriya','Shelvaraj','F','1995-07-10','tamilnadu','TN','Milk','5.6','57'),
(4,'Ravi','Sharma','M','1968-06-02','Delhi','DL','Milk','6.0','70'),
(5,'Kavita','Gore','F','1980-11-20','pune','MH',null,'5.0','62'),
(6,'Smaran','kadam','M','2002-05-26','Mumbai','MH','egg','3.2','45'),
(7,'Khushi','Savi','F','1997-12-20','UtterPradesh','UP',null,'5.2','56'),
(8,'Shweta','jare','F','1975-06-02','Mumbai','MH',null,'5.4','65'),
(9,'Pratham','Nikam','M','2000-05-15','Delhi','DL','milk','4.0','40'),
(10,'Ram','More','M','1992-07-29','Mumbai','MH','egg','5.6','55'),
(11,'Priya','Sharma','F','1992-07-15','karnataka','KA',null,'5.2','50');

select * from patients;

create table doctors(doctor_id int, first_name varchar(30),last_name varchar(30),speciality varchar(25));
insert into doctors values(101,'Santosh','Jadhav','Heart'),
(102,'Ravi','Gawade','ENT'),
(103,'Ojas','K.','skin'),
(104,'Gayatri','Kumar','ENT'),
(105,'Vidhi','G.','Heart');

select * from doctors;
alter table patients add primary key (patient_id);
alter table doctors add primary key (doctor_id);

create table admissions(
patient_id int,
constraint fk_pat_adm foreign key(patient_id) references patients(patient_id),
admission_date date, 
discharge_date date,
diagnosis varchar(50),
attending_doctor_id int,
constraint fk_doc_adm foreign key(attending_doctor_id) references doctors(doctor_id));

insert into admissions values(1,'2025-02-10','2025-02-18','Fracture',103),
(2,'2025-02-15','2025-02-25','Asthma',101),
(3,'2025-02-10','2025-02-12','Migraine',105),
(4,'2025-03-05','2025-03-10','Diabetes ',102),
(5,'2025-03-05','2025-03-05','Routine Checkup',104),
(6,'2025-04-15','2025-04-21','Pneumonia',102),
(7,'2025-04-28','2025-05-05','Asthma',105),
(8,'2025-05-10','2025-05-12','Fracture',103);

create table province_names(province_id char(2) primary key, province_name varchar(30));

-- alter table patients add constraint fk_patient_province foreign key(province_id) references patients(province_id);

-- 1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name,last_name , gender from patients where gender = 'M';
-- 2.	Show the first name & last name of patients who does not have any allergies
select first_name,last_name from patients where allergies is null;
-- 3.	Show the patients details that start with letter ‘C’
select * from patients where first_name like 'n%';
-- 4.	Show the patients details that height range 100 to 200
select * from patients where height between 4 and 5;
-- 5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set allergies = 'NKA' where allergies is null;
select * from patients;
-- 6.	Show how many patients have birth year is 2020
select count(*) as patient_birth_count from patients where year(birth_date) = 2000;
-- 7.	Show the patients details who have greatest height
select * from patients order by height desc limit 1;
-- 8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select gender, count(*) as total_patients from patients where gender in('M','F')group by gender;
-- 9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
insert into patients values(12,'Lara','Jha','F','1990-05-15','Karnataka','KA','Penicillin','6.1','60'),
(13,'Devika','Dutta','F','2000-05-15','Mumbai','MH','Morphine','5.8','50'),
(14,'Ayan','Kumar','M','2000-05-15','Mumbai','MH','Morphine','5.4','55'),
(15,'Nilam','Sawant','F','2000-05-15','pune','MH','Penicillin','5.4','85');

select first_name, last_name, allergies from patients 
where allergies in ('Penicillin','Morphine' )
order by allergies asc, first_name asc, last_name desc;

-- 10.	Show first_name, last_name, and the total number of admissions 
-- attended for each doctor.
-- Every admission has been attended by a doctor.
select d.first_name, d.last_name , count(a.patient_id) as total_admissions from doctors d
join admissions a on d.doctor_id = a.attending_doctor_id
group by 
d.doctor_id, d.first_name,d.last_name;

-- 11.	For every admission, display the patient's full name, 
-- their admission diagnosis, and their doctor's full name who diagnosed their problem.
select concat(p.first_name, '' ,p.last_name)as patient_full_name,
a.diagnosis,
concat(d.first_name, '', d.last_name) as doctor_full_name
from admissions a
join patients p on a.patient_id = p.patient_id
join doctors d on a.attending_doctor_id = d.doctor_id;