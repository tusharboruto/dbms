drop database if exists ass4;
create database if not exists ass4;
show databases;
use ass4;
create table registration
	(
		stuid int not null unique,
        stname varchar(20) not null,
        clgid  char(20) not null,
        gen char(6) not null,
        mobnum char(10) not null unique,
        addr varchar(20) not null,
        regid char(5) not null unique
	);

desc registration;

create table festday1
	(
		
        regid char(5) not null unique,
        clgid  char(20),
        stname varchar(20),
        gen char(6),
        entry time not null,
        idproof char(20)
	);

desc festday1;

create table festday2
	(
	    regid char(5) not null unique,
        clgid  char(20),
        stname varchar(20),
        gen char(6),
        entry time not null,
        idproof char(20)
	);

desc festday2;

insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(1,'ram','iiitdwd','male','9496675656','hubli','r01');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(2,'priya','iiitdwd','female','9396675656','hubli','r02');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(3,'sudha','sdm','female','9496665656','dwd','r03');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(4,'divi','kle','female','9496685656','hubli','r04');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(5,'abhi','kle','male','9496675556','hubli','r05');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(6,'sam','sdm','male','9496675654','dwd','r06');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(7,'rita','iiitdwd','female','9496675657','hubli','r07');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(8,'monal','sdm','female','9296675657','dwd','r08');
insert into registration(stuid,stname,clgid,gen,mobnum,addr,regid) values(9,'tom','jain','male','8496675657','hubli','r09');

select * from registration;

insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r01','iiitdwd','ram','male','09:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r03','sdm','sudha','female','09:00:00','voterid');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r04','kle','divi','female','10:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r08','sdm','monal','female','10:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r02','iiitdwd','priya','female','11:00:00','clgid');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r10','sdm','jams','male','11:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r11','kle','uma','female','11:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r12','kle','joss','male','11:00:00','clgid');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r13','iiitdwd','stokes','male','12:00:00','aadhar');
insert into festday1(regid,clgid,stname,gen,entry,idproof) values('r14','jain','sita','female','12:00:00','aadhar');

select * from festday1;

insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r01','iiitdwd','ram','male','09:00:00','aadhar');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r05','kle','male','abhi','09:00:00','voterid');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r04','kle','divi','female','09:00:00','aadhar');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r08','sdm','monal','female','09:00:00','aadhar');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r09','jain','tom','male','10:00:00','clgid');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r07','iiitdwd','rita','female','10:00:00','clgid');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r14','sdm','sita','female','11:00:00','aadhar');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r11','kle','uma','female','11:00:00','aadhar');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r15','jain','avi','male','12:00:00','clgid');
insert into festday2(regid,clgid,stname,gen,entry,idproof) values('r13','iiitdwd','stokes','male','12:00:00','aadhar');

select * from festday2;



select r.regid, r.stname, r.clgid,f1.entry
from registration as r
join festday1 as f1
on r.regid=f1.regid;

select r.regid, r.stname, r.clgid,f2.entry
from registration as r
join festday2 as f2
on r.regid=f2.regid;


select f1.regid,f1.stname,f1.entry,f2.entry
from festday1 as f1
join festday2 as f2
on f1.regid=f2.regid;



select r.regid, r.stname, r.clgid
from registration as r
join festday2 as f2 on r.regid=f2.regid
join festday1 as f1 on r.regid=f1.regid;


select r.regid, r.stname, f1.entry
from registration as r
left join festday1 as f1
on r.regid=f1.regid;

select r.stname, f1.entry
from registration as r
right join festday1 as f1
on r.regid=f1.regid;

select r.regid, r.stname, f2.entry
from registration as r
left join festday1 as f2
on r.regid=f2.regid;


select r.stname, f2.entry
from registration as r
right join festday1 as f2
on r.regid=f2.regid;

select r.clgid, count(f1.regid) as 'totalstu'
from registration as r
join festday1 as f1
on r.regid=f1.regid
group by r.clgid;


select r.regid, r.stname, r.clgid
from registration as r
join festday1 as f1
on r.regid=f1.regid
where r.clgid='iiitdwd';

select r.regid, r.stname, r.clgid
from registration as r
join festday1 as f1
on r.regid=f1.regid
and r.clgid='iiitdwd';

select r.regid, r.stname, r.clgid
from registration as r
join festday1 as f1
on r.regid=f1.regid
where r.clgid='iiitdwd' or r.clgid='sdm';












