create database insurance;
use insurance;
create table person(
driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id));
desc person;

create table car(
reg_num varchar(10),
model varchar(10),
year int,
primary key(reg_num)
);
desc car;


create table accident(
report_num int,
accident_date varchar(20),
location varchar(20),
primary key(report_num)
);


create table owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);
desc owns;

create table participated(
driver_id varchar(20),
reg_num  varchar(20),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references car(reg_num),
foreign key(report_num) references accident(report_num)
);
insert into person values('1','tasmiya','kormangala');
insert into person values('2','sosun','wilson garden');
insert into person values('3','masoom','berley street');
insert into person values('4','farhana','landen ');
insert into person values('5','ellen','aradhana layout');
commit;
select *from person;

insert into car values('12','tata','2001');
insert into car values('13','nano','2002');
insert into car values('14','tesla','2003');
insert into car values('15','innova','2004');
insert into car values('16','ford','2005');
commit;
select *from car;


insert into accident values('23','13-12-2012','basvangudi');
insert into accident values('24','14-10-2012','kormangala');
insert into accident values('25','13-06-012','brigade road');
insert into accident values('26','23-05-2012','austin town');
insert into accident values('27','03-01-2012','ring road');
commit;
select *from accident;

insert into owns values('1','12');
insert into owns values('2','13');
insert into owns values('3','14');
insert into owns values('4','15');
insert into owns values('5','16');
commit;
select *from owns;

insert into participated values('12','KA05562','24','5000');
insert into participated values('13','KA07799','25','6000');
insert into participated values('14','KA08899','26','7000');
insert into participated values('15','KA022333','27','8000');
insert into participated values('16','KA03355','27','9000');
commit;
select *from participated;
update participated set damage_amount=25000 where reg_num='KA05562' and report_num=24;
select *from participated;
commit;
insert into accident values('28','18-01-2018','Muesuem road');
select *from accident;
select count(distinct driver_id) CNT from participated a, accident b where
a.report_num=b.report_num and b.accident_date like '%08';
select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and
model='tesla';




































