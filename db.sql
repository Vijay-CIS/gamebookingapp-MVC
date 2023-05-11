--create database gamebookingapp_db;
--drop table booking;
--drop table machines;
--drop table user_role;
--drop table roles;
--drop table users;




create table users(
id BIGINT AUTO_INCREMENT,
name VARCHAR(100) NOT NULL UNIQUE,
email varchar(250) not null unique,
password VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);

create table roles(
role_id int auto_increment,
role_name varchar(250) NOT NULL UNIQUE,
primary key(role_id)
);


CREATE TABLE user_roles(
user_role_id INT NOT NULL AUTO_INCREMENT,
user_id BIGINT NOT NULL,
role_id INT NOT NULL,
PRIMARY KEY (user_role_id),
foreign key (user_id)references users (id),
foreign key (role_id)references roles (role_id)
);

 create table machines(
 machine_id INT NOT NULL auto_increment,
 machine_name VARCHAR(250) NOT NULL unique,
 status VARCHAR(100) NOT NULL,
 PRIMARY KEY (machine_id)
 );
 
 
  CREATE TABLE booking(
 booking_id INT NOT NULL,
 user_id BIGINT NOT NULL,
 machine_id INT NOT NULL,
 status VARCHAR(100) NOT NULL,
 start_time time,
 end_time TIME,
 amount INT NOT NULL,
 booking_date DATE,
 play_date date,
 PRIMARY KEY (booking_id),
 FOREIGN KEY (user_id) REFERENCES users(id),
 FOREIGN KEY (machine_id) REFERENCES machines(machine_id)
 );