-- TABLE CREATION: 
CREATE TABLE patients
(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(100),
gender VARCHAR(10),
age INT,
city VARCHAR(50),
phone VARCHAR(15)
);

CREATE TABLE departments
(
department_id INT PRIMARY KEY,
department_name VARCHAR(100)
);

CREATE TABLE doctors
(
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(100),
specialization VARCHAR(100),
department_id INT,
consultation_fee DECIMAL(10,2)
);

CREATE TABLE appointments
(
appointment_id INT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
appointment_status VARCHAR(30)
);

CREATE TABLE treatments
(
treatment_id INT PRIMARY KEY,
appointment_id INT,
treatment_name VARCHAR(100),
treatment_cost DECIMAL(10,2)
);

CREATE TABLE bills
(
bill_id INT PRIMARY KEY,
patient_id INT,
appointment_id INT,

bill_date DATE,
total_amount DECIMAL(10,2),
bill_status VARCHAR(30)
);

CREATE TABLE payments_2
(
payment_id INT PRIMARY KEY,
bill_id INT,
payment_mode VARCHAR(30),
paid_amount DECIMAL(10,2),
payment_status VARCHAR(30)
);

insert into patients values
(1,'rahul sharma','male',35,'hyderabad','9876543210'),
(2,'priya reddy','female',42,'hyderabad','9876543211'),
(3,'amit kumar','male',28,'bengaluru','9876543212'),
(4,'sneha iyer','female',31,'chennai','9876543213'),
(5,'arjun nair','male',50,'kochi','9876543214'),
(6,'neha patel','female',45,'mumbai','9876543215'),
(7,'vikram singh','male',38,'delhi','9876543216'),
(8,'ananya das','female',25,'kolkata','9876543217'),
(9,'karthik rao','male',55,'bengaluru','9876543218'),
(10,'meera joshi','female',33,'pune','9876543219'),
(11,'rohit verma','male',47,'hyderabad','9876543220'),
(12,'divya menon','female',29,'chennai','9876543221');

insert into departments values
(1,'cardiology'),
(2,'neurology'),
(3,'orthopedics'),
(4,'pediatrics'),
(5,'dermatology');

insert into doctors values
(101,'dr rajesh','cardiologist',1,1200),
(102,'dr kavitha','neurologist',2,1500),
(103,'dr arun','orthopedic surgeon',3,1000),
(104,'dr priya','pediatrician',4,700),
(105,'dr deepak','dermatologist',5,900),
(106,'dr anil','cardiologist',1,1300),
(107,'dr shweta','neurologist',2,1400),
(108,'dr manoj','orthopedic surgeon',3,1100);

insert into appointments values
(1001,1,101,'2026-01-05','completed'),
(1002,2,102,'2026-01-06','completed'),
(1003,3,103,'2026-01-08','cancelled'),
(1004,4,104,'2026-01-10','completed'),
(1005,5,105,'2026-01-12','scheduled'),
(1006,6,106,'2026-01-15','completed'),
(1007,7,107,'2026-01-18','completed'),
(1008,8,108,'2026-01-20','cancelled'),
(1009,9,101,'2026-01-22','completed'),
(1010,10,102,'2026-01-25','scheduled'),
(1011,11,103,'2026-01-28','completed'),
(1012,12,104,'2026-02-01','completed'),
(1013,1,105,'2026-02-03','completed'),
(1014,2,106,'2026-02-05','scheduled'),
(1015,3,107,'2026-02-08','completed'),
(1016,4,108,'2026-02-10','completed'),
(1017,5,101,'2026-02-12','scheduled'),
(1018,6,102,'2026-02-15','completed'),
(1019,7,103,'2026-02-18','completed'),
(1020,8,104,'2026-02-20','scheduled');

insert into treatments values
(201,1001,'ecg',1500),
(202,1002,'brain scan',4000),
(203,1004,'vaccination',800),
(204,1006,'heart screening',3500),
(205,1007,'neurological test',4500),
(206,1009,'ecg',1500),
(207,1011,'fracture treatment',5000),
(208,1012,'child consultation',700),
(209,1013,'skin treatment',1200),
(210,1015,'brain scan',4000),
(211,1016,'bone alignment',3000),
(212,1018,'neurological test',4500),
(213,1019,'fracture treatment',5500),
(214,1005,'skin consultation',900),
(215,1017,'heart screening',3500);

insert into bills values
(301,1,1001,'2026-01-05',2700,'paid'),
(302,2,1002,'2026-01-06',5500,'paid'),
(303,4,1004,'2026-01-10',1500,'paid'),
(304,6,1006,'2026-01-15',4700,'paid'),
(305,7,1007,'2026-01-18',6000,'paid'),
(306,9,1009,'2026-01-22',2700,'paid'),
(307,11,1011,'2026-01-28',6000,'pending'),
(308,12,1012,'2026-02-01',1400,'paid'),
(309,1,1013,'2026-02-03',2100,'paid'),
(310,3,1015,'2026-02-08',5500,'paid'),
(311,4,1016,'2026-02-10',4100,'paid'),
(312,6,1018,'2026-02-15',6000,'pending'),
(313,7,1019,'2026-02-18',6600,'paid'),
(314,5,1005,'2026-01-12',1600,'pending'),
(315,5,1017,'2026-02-12',4800,'pending');

insert into payments_2 values
(401,301,'upi',2700,'success'),
(402,302,'card',5500,'success'),
(403,303,'cash',1500,'success'),
(404,304,'upi',4700,'success'),
(405,305,'card',6000,'success'),
(406,306,'upi',2700,'success'),
(407,307,'upi',3000,'pending'),
(408,308,'cash',1400,'success'),
(409,309,'upi',2100,'success'),
(410,310,'card',5500,'success'),
(411,311,'cash',4100,'success'),
(412,312,'upi',3000,'pending'),
(413,313,'net banking',6600,'success'),
(414,314,'upi',0,'failed'),
(415,315,'card',0,'failed');

-- PART 1: BASIC QUERIES:
select * from patients;

select * from doctors;

select *
from patients
where city = 'hyderabad';

select d.*
from doctors d
join departments dp
on d.department_id = dp.department_id
where dp.department_name = 'cardiology';

select *
from appointments
where appointment_date > '2026-01-01';

select *
from appointments
where appointment_status = 'cancelled';

select *
from bills
where total_amount > 5000;

select *
from payments_2
where payment_mode = 'upi';

select *
from patients
where age between 30 and 50;

select *
from doctors
where consultation_fee > 800;

-- PART 2: AGGREGATE QUERIES:
select count(*) as total_patients
from patients;

select count(*) as total_doctors
from doctors;

select count(*) as total_appointments
from appointments;

select avg(consultation_fee) as average_consultation_fee
from doctors;

select max(treatment_cost) as highest_treatment_cost
from treatments;

select sum(total_amount) as total_billing_amount
from bills;

select sum(paid_amount) as total_paid_amount
from payments_2;

select city, count(*) as patient_count
from patients
group by city;

select specialization, count(*) as doctor_count
from doctors
group by specialization;

select appointment_status, count(*) as appointment_count
from appointments
group by appointment_status;

-- PART 3: JOINS:
select p.patient_name, a.appointment_date, a.appointment_status
from patients p
join appointments a on p.patient_id = a.patient_id;

select d.doctor_name, dp.department_name
from doctors d
join departments dp on d.department_id = dp.department_id;

select p.patient_name, d.doctor_name, a.appointment_date
from patients p
join appointments a on p.patient_id = a.patient_id
join doctors d on a.doctor_id = d.doctor_id;

select appointment_id, treatment_name, treatment_cost
from treatments;

select b.bill_id, p.patient_name, b.total_amount
from bills b
join patients p on b.patient_id = p.patient_id;

select bill_id, payment_mode, paid_amount, payment_status
from payments_2;

select p.patient_name, d.doctor_name, dp.department_name,
a.appointment_date, a.appointment_status,
t.treatment_name, t.treatment_cost,
b.total_amount as bill_amount,
pay.payment_status
from patients p
join appointments a on p.patient_id = a.patient_id
join doctors d on a.doctor_id = d.doctor_id
join departments dp on d.department_id = dp.department_id
join treatments t on a.appointment_id = t.appointment_id
join bills b on a.appointment_id = b.appointment_id
join payments_2 pay on b.bill_id = pay.bill_id;

-- PART 4: GROUP BY AND HAVING:
select d.doctor_name, count(a.appointment_id) as appointment_count
from doctors d
join appointments a on d.doctor_id = a.doctor_id
group by d.doctor_name;

select dp.department_name, count(a.appointment_id) as appointment_count
from departments dp
join doctors d on dp.department_id = d.department_id
join appointments a on d.doctor_id = a.doctor_id
group by dp.department_name;

select dp.department_name, sum(b.total_amount) as total_revenue
from departments dp
join doctors d on dp.department_id = d.department_id
join appointments a on d.doctor_id = a.doctor_id
join bills b on a.appointment_id = b.appointment_id
group by dp.department_name;

select treatment_name, sum(treatment_cost) as total_treatment_cost
from treatments
group by treatment_name;

select p.city, sum(b.total_amount) as total_billing
from patients p
join bills b on p.patient_id = b.patient_id
group by p.city;

select d.doctor_name, count(a.appointment_id) as appointment_count
from doctors d
join appointments a on d.doctor_id = a.doctor_id
group by d.doctor_name
having count(a.appointment_id) > 2;

select dp.department_name, sum(b.total_amount) as total_revenue
from departments dp
join doctors d on dp.department_id = d.department_id
join appointments a on d.doctor_id = a.doctor_id
join bills b on a.appointment_id = b.appointment_id
group by dp.department_name
having sum(b.total_amount) > 20000;

select city, count(*) as patient_count
from patients
group by city
having count(*) > 2;

-- PART 5: SUBQUERIES:
select *
from patients
where patient_id in (select patient_id from appointments);

select *
from patients
where patient_id not in (select patient_id from appointments);

select *
from doctors
where doctor_id not in (select doctor_id from appointments);

select *
from bills
where total_amount > (select avg(total_amount) from bills);

select p.patient_name, b.total_amount
from patients p
join bills b on p.patient_id = b.patient_id
where b.total_amount = (select max(total_amount) from bills);

select *
from doctors
where consultation_fee > (select avg(consultation_fee) from doctors);

select *
from patients
where patient_id in (
select a.patient_id
from appointments a
join doctors d on a.doctor_id = d.doctor_id
join departments dp on d.department_id = dp.department_id
where dp.department_name = 'cardiology'
);

select *
from bills
where bill_status = 'pending';

select *
from appointments
where appointment_id in (select appointment_id from treatments);

select p.patient_name, sum(b.total_amount) as total_bill
from patients p
join bills b on p.patient_id = b.patient_id
group by p.patient_id, p.patient_name
having sum(b.total_amount) > (
select avg(patient_total)
from (
select sum(total_amount) as patient_total
from bills
group by patient_id
) x
);

-- PART 6: DATA QUALITY CHECKS:
select a.*
from appointments a
left join treatments t on a.appointment_id = t.appointment_id
where t.appointment_id is null;

select b.*
from bills b
left join payments_2 p on b.bill_id = p.bill_id
where p.bill_id is null;

select *
from payments_2
where paid_amount is null
or paid_amount = 0;

select a.*, b.bill_id, b.total_amount
from appointments a
join bills b on a.appointment_id = b.appointment_id
where a.appointment_status = 'cancelled';

select b.bill_id, b.total_amount, p.paid_amount
from bills b
join payments_2 p on b.bill_id = p.bill_id
where b.bill_status = 'paid'
and p.paid_amount < b.total_amount;

select d.*
from doctors d
left join departments dp on d.department_id = dp.department_id
where dp.department_id is null;

select a.*
from appointments a
left join patients p on a.patient_id = p.patient_id
left join doctors d on a.doctor_id = d.doctor_id
where p.patient_id is null
or d.doctor_id is null;

-- FINAL REPORT:
select
patients.patient_name,
patients.city,
count(distinct appointments.appointment_id) as total_appointments,
sum(bills.total_amount) as total_bill_amount,
sum(payments_2.paid_amount) as total_paid_amount,
sum(bills.total_amount) - sum(payments_2.paid_amount) as pending_amount
from patients
left join appointments
on patients.patient_id = appointments.patient_id
left join bills
on patients.patient_id = bills.patient_id
left join payments_2
on bills.bill_id = payments_2.bill_id
group by patients.patient_id, patients.patient_name, patients.city;