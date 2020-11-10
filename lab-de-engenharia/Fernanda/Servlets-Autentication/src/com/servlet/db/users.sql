create database mysql_database;
use mysql_database;
select * from tbl_users;
show databases;
show tables;
drop table tbl_users;

create table tbl_users (
	usr_id	 varchar(20) primary key not null,
    usr_username varchar(100),
    usr_email	 varchar(100),
    usr_telephone	varchar(20),
    usr_password	varchar(20),
    usr_profile		varchar(20)
);

insert into tbl_users values
('1', 'feevars','feevars@gmail.com','+5511303030','batata','github.com');

