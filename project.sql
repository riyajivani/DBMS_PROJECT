-- Database: airline_project

-- DROP DATABASE IF EXISTS airline_project;

CREATE DATABASE airline_project
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
create table Admin(a_id varchar(10) primary key,a_name varchar(20));

create table Users(user_id varchar(5) primary key,fname varchar(10) not
null,lname varchar(10) not null,gender varchar(6),city varchar(15),pin
int,state varchar(15),dob date);

create table Contact(cnt_id varchar(5) primary key,user_id
varchar(5),cnt_no numeric(10) not null,foreign key (user_id) references
Users(user_id));

create table Luggage(lug_id varchar(5),user_id varchar(5) not null,bag
int,weight int,primary key(lug_id,user_id), foreign key(user_id) references
Users(user_id) on delete cascade);

create table Airline(air_name varchar(20) primary key,code int);

create table Flight(flight_no int primary key,air_name
varchar(20),flight_name varchar(20),seat_available int,destination
varchar(20),source varchar(20),arr_time time,dep_time time,foreign
key(air_name) references Airline(air_name));

create table Payment(pay_id int primary key,PNR varchar(5),amount
numeric(10,2),pay_mode varchar(8),foreign key(PNR) references
Ticket(PNR));

create table Ticket(PNR varchar(5) primary key,user_id
varchar(5),flight_no int,seat_no varchar(5),journey_date date,destination
varchar(20),source varchar(20),foreign key(user_id) references
Users(user_id),foreign key(flight_no) references Flight(flight_no));

create table Class(class_id int primary key,flight_no int,PNR
varchar(5),class_type varchar(1),foreign key(flight_no) references
Flight(flight_no),foreign key(PNR) references Ticket(PNR));

create table Economy(class_id int,fare numeric(10,2),foreign key(class_id)
references Class(class_id));

create table Business(class_id int,fare numeric(10,2),foreign key(class_id)
references Class(class_id));

create table cheaksfor(chk_id int primary key,user_id varchar(5),flight_no
int,foreign key(flight_no) references Flight(flight_no),foreign key(user_id)
references Users(user_id));
