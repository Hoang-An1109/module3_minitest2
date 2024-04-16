create database QuanLyHocVien;

use quanlyhocvien;

create table Address(
id int auto_increment not null primary key,
address varchar(255)
); 

insert into Address (address) values ('Hà Nội'),('Huế'),('Đà Nẵng'),('Sài Gòn'),('Đồng Nai');

create table Classes(
id int auto_increment not null primary key,
name varchar(50) not null,
language varchar(50) not null,
description varchar(50) not null
);

insert into Classes (name, language, description) value('C0823','Java','Lớp Java - Tháng 08 năm 2023');
insert into Classes (name, language, description) value('C1023','Python','Lớp Python - Tháng 10 năm 2023');
insert into Classes (name, language, description) value('C0124','Java','Lớp Java - Tháng 01 năm 2024');
insert into Classes (name, language, description) value('C0224','C#','Lớp C# - Tháng 02 năm 2024');
insert into Classes (name, language, description) value('C0324','AI','Lớp AI - Tháng 03 năm 2024');


create table Students(
id int auto_increment not null primary key,
fullname varchar(50) not null,
address_id int not null,
age int not null,
phone varchar(10) not null unique,
classes_id int not null,
foreign key(address_id) references Address(id),
foreign key(classes_id) references Classes(id)
);

insert into Students (fullname, address_id, age, phone, classes_id) value ('Dương Minh Hiếu', 1, 26,'0124567890', 1);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Nguyễn Tất Quân', 1, 25,'0124567891', 3);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Phan Thanh Thảo', 1, 23,'0134567892', 5);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Nguyễn Nhật Huy', 4, 23,'0234567893', 4);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Đặng Phước Quý', 2, 22,'0123567894', 2);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Lê Hoàng Đức', 2, 22,'0123467895', 2);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Phạm Hoàng An', 5, 22,'0124567896', 4);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Lê Thành Nhơn', 3, 24,'0134567897', 2);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Phan Đình Trường', 3, 25,'0123456898', 3);
insert into Students (fullname, address_id, age, phone, classes_id) value ('Vũ Thị Kiều Anh', 1, 30,'0123467899', 5);

create table Course(
id int auto_increment not null primary key,
name varchar(50) not null, 
description varchar(50) not null
);

insert into Course(name, description) value('FT','Full-Time');
insert into Course(name, description) value('PT','Part-Time');

create table Point(
id int auto_increment not null primary key,
course_id int not null,
student_id int not null,
point double not null,
foreign key(course_id) references Course(id),
foreign key(student_id) references Students(id)
); 

insert into Point (course_id, student_id, point) values ( 1, 2, 7.7);
insert into Point (course_id, student_id, point) values ( 2, 4, 6.5);
insert into Point (course_id, student_id, point) values ( 2, 6, 7.0);
insert into Point (course_id, student_id, point) values ( 1, 8, 8.4);
insert into Point (course_id, student_id, point) values ( 2, 10, 5.6);
insert into Point (course_id, student_id, point) values ( 2, 3, 6.7);
insert into Point (course_id, student_id, point) values ( 2, 5, 7.8);
insert into Point (course_id, student_id, point) values ( 1, 7, 4.9);
insert into Point (course_id, student_id, point) values ( 1, 9, 8.0);
insert into Point (course_id, student_id, point) values ( 1, 1, 9.0);
insert into Point (course_id, student_id, point) values ( 2, 4, 6.3);
insert into Point (course_id, student_id, point) values ( 1, 6, 5.4);
insert into Point (course_id, student_id, point) values ( 1, 1, 7.4);
insert into Point (course_id, student_id, point) values ( 2, 8, 8.2);
insert into Point (course_id, student_id, point) values ( 1, 5, 9.9);

select * from address;
select * from classes;
select * from course;
select * from point;
select * from students;

select * from students where fullname like 'Nguyễn%';

select * from students where fullname like '%Anh';

select * from students where age between 18 and 25;

select * from students where id=12 or id=13;

select classes_id, count(classes_id) as "Số lượng học viên" from students group by classes_id order by classes_id;

select a.address, count(s.address_id) as "Số lượng học viên" from students s inner join address a on s.address_id=a.id
		group by s.address_id;
        
select c.name, avg(p.point) as "Điểm trung bình" from point p inner join course c on p.course_id=c.id
			group by p.course_id;
            
select max(point) as "Điểm cao nhất" from point;

select min(point) as "Điểm thấp nhất" from point;

select ucase(fullname) from students;

        