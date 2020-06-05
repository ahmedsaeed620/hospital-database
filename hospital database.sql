create database Hospitall  ;

create table hospital
  (hospital_id    int,
   location    varchar(50),
   specilization  varchar(50),
   primary key (hospital_id)
  );


create table room
  (room_number    int,
   room_type    varchar(50),
   room_vacancy   varchar(50),
   primary key (room_number)
  );


create table doctor
  (doc_id    int,
   name   varchar(50),
   address   varchar(50),
   email      varchar(50),
   phone      int,
   primary key (doc_id));


create table patients
  (patient_id    int,
   name   varchar(50),
   job    varchar(50),
   address varchar(50),
   email   varchar(50),
   phone   int,
   primary key (patient_id));


create table medicines
  (midicine_id    int,
   name   varchar(50),
   midcine_type    varchar(50),
   price  int,
   primary key (midicine_id));




#insert statements

insert into doctor values (1, 'ahmed', 'tanta', 'ahmed@yahoo.com', 65627562);
insert into doctor values (2, 'mohamed', 'alex', 'moamed@yahoo.com', 65888862);
insert into doctor values (3, 'yaser', 'cairo', 'yaser@yahoo.com', 678687562);
insert into doctor values (4, 'fady', 'tanta', 'fady@yahoo.com', 68778862);
insert into doctor values (5, 'khaled', 'alex', 'khaled@yahoo.com', 78287282);
insert into doctor values (6, 'reda', 'alex', 'reda@yahoo.com', 87827562);


insert into hospital values (1, 'tanta', 'childern');
insert into hospital values (2, 'alex', 'Surgery');
insert into hospital values (3, 'alex', 'Gynecology and obstetrics');
insert into hospital values (4, 'cairo', ' the eyes');
insert into hospital values (5, 'tanta', ' Internal diseases');

insert into medicines values (1, 'Neosar', 'canser',2000);
insert into medicines values ( 2,'Avandia', 'Diabetes',1000);
insert into medicines values (3, 'EPANUTIN', 'the pain',100);
insert into medicines values (4, 'Doxergan', 'Colds',60);
insert into medicines values (5, 'nimalox', 'Toothache',200);


insert into patients values (1, 'ahmed', 'doctor','tanta','ahmed2@yahoo.com',26782782);
insert into patients values (2, 'mohamed', 'doctor','alex','atwd2@yahoo.com',817182782);
insert into patients values (3, 'sara', 'teatcher','alex','sarad2@yahoo.com',287879782);


insert into room values ( 20, 'male','yes');
insert into room values ( 21, 'male','yes');
insert into room values ( 30, 'male','no');
insert into room values ( 24, 'female','yes');
insert into room values ( 26, 'female','yes');
insert into room values ( 40, 'female','no');



#Select Statements using Sub Query 

SELECT name,doc_id FROM doctor WHERE doc_id=( select max(doc_id) from doctor); 
SELECT hospital_id ,location FROM hospital WHERE hospital_id=( select max(hospital_id) from hospital);
SELECT room_type, room_vacancy FROM room WHERE room_number =( select max(room_number) from room) ;


#Select Statements using Count and Group Functions 

SELECT COUNT( patient_id), job
FROM patients
GROUP BY job;

SELECT COUNT( midicine_id), price
FROM medicines
GROUP BY price;


#Select Statements using Different Joins

SELECT doctor.name, patients.name
FROM doctor
INNER JOIN patients ON doctor.name = patients.name;

SELECT doctor.name, patients.name
FROM doctor
left outer JOIN patients ON doctor.name = patients.name;

SELECT doctor.name, patients.name
FROM doctor
right outer JOIN patients ON doctor.name = patients.name;

SELECT doctor.address, patients.address
FROM doctor
left outer JOIN patients ON doctor.name = patients.name;

SELECT doctor.address, patients.address
FROM doctor
cross JOIN patients ON doctor.name = patients.name;


#updata statements

UPDATE room
SET room_type = 'male', room_vacancy= 'yes'
WHERE room_number = 40;

UPDATE room
SET room_type = 'female', room_vacancy= 'yes'
WHERE room_number = 20;

UPDATE hospital
SET location = 'matrouh', specilization= 'Surgery'
WHERE hospital_id = 5;

UPDATE hospital
SET location = 'aswan', specilization= 'childern'
WHERE hospital_id = 3;

UPDATE hospital
SET  specilization= 'childern'
WHERE hospital_id = 4;


#delete statements

DELETE FROM medicines WHERE name='Neosar';
DELETE FROM medicines WHERE price=60;
DELETE FROM doctor WHERE name='ahmed';
DELETE FROM doctor WHERE address='cairo';
DELETE FROM doctor WHERE phone='78287282';