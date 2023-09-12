create table member(
	id varchar(20) not null,
	name varchar(20) not null,
	pw varchar(20) not null,
	pwCheck varchar(20) not null,
	tel varchar(20) not null,
	email varchar(20) not null,
	radio varchar(10) not null,
	box varchar(100) not null,
	primary key(id)
);

select * from member;