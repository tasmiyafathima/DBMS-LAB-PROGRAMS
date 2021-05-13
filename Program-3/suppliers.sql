create database Supplier;
use Supplier;

create table Suppliers(
sid varchar(20) ,
sname varchar(20),
city varchar(20),
primary key(sid)
);
desc Suppliers;

create table Parts(
pid integer,
pname varchar(20),
color varchar(20),
primary key(pid)
);
desc Parts;

create table Catalog(
sid varchar(20),
pid integer,
cost real,
primary key(sid,pid),
foreign key(sid) references Suppliers(sid),
foreign key(pid) references Parts(pid)
);
desc Catalog;

insert into Suppliers values(10001,'Acme Widget','Bangalore');
insert into Suppliers values(10002,'Johns','Kolkata');
insert into Suppliers values(10003,'Vimal','Mumbai');
insert into Suppliers values(10004,'Reliance','Delhi');
select *from Suppliers;

insert into Parts values(20001,'Book','Red');
insert into Parts values(20002,'Pen','Red');
insert into Parts values(20003,'Pencil','green');
insert into Parts values(20004,'Mobile','green');
insert into Parts values(20005,'Charger','Black');
select *from Parts;

insert into Catalog values(10001,20001,10);
insert into Catalog values(10001,20002,10);
insert into Catalog values(10001,20003,30);
insert into Catalog values(10001,20004,10);
insert into Catalog values(10001,20005,10);
insert into Catalog values(10002,20001,10);
insert into Catalog values(10002,20002,20);
insert into Catalog values(10003,20003,30);
insert into Catalog values(10004,20003,40);
select *from Catalog;

select distinct P.pname from Parts P, Catalog c where P.pid=C.pid;

select C.sid from catalog C where not exists(select P.pid from Parts P where not exists (select c.sid from catalog c1 where c1.sid=c.sid and c1.pid=P.pid));
            
select C.sid from catalog C where not exists(select P.pid from Parts P where P.color='red'and (not exists (select c.sid from catalog c1 where c1.sid=c.sid and c1.pid=P.pid)));
            
SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = 'red' )
EXCEPT
( SELECT C.pid
FROM Catalog C
WHERE C.sid = S.sid ));






