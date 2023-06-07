-- 게시판 테이블 설계
drop table board;
create table board(
  num int not null auto_increment, -- 번호(자동증가), 시퀀스
  username varchar(50) not null, -- 회원아이디
  title varchar(100) not null, -- 제목
  content varchar(2000) not null, -- 내용
  writer varchar(50) not null, -- 작성자
  indate datetime default now(), -- sysdate
  count int default 0, -- 조회수
  primary key(num)
);

create table reply(
  num int not null auto_increment, -- 번호(자동증가), 시퀀스
  username varchar(50) not null, -- 회원아이디
  title varchar(100) not null, -- 제목
  content varchar(2000) not null, -- 내용
  writer varchar(50) not null, -- 작성자
  indate datetime default now(), -- sysdate
  count int default 0, -- 조회수
  bgroup int,
  bseq int,
  blevel int,
  bdelete int default 0,  
  primary key(num)
);

select count(*) from reply;

select * from reply;
select * from reply order by bgroup desc, bseq asc limit 0, 10;
select * from reply order by bgroup desc, bseq asc limit 10, 10;
select * from reply order by bgroup desc, bseq asc limit 20, 10;

select IFNULL(max(bgroup)+1,0) as bgroup from reply;

-- 게시물 저장
insert into board(title, content, writer)
values('스프링 게시판 만들기','스프링 게시판 만들기','관리자');

insert into board(title, content, writer)
values('스프링 게시판 만들기','스프링 게시판 만들기','박매일');

insert into board(title, content, writer)
values('스프링 게시판 만들기','스프링 게시판 만들기','홍길동');

select * from board;

create table member(
  idx int auto_increment primary key,
  username varchar(255) not null unique,
  password varchar(255) not null,
  name varchar(255) not null,
  email varchar(255) not null unique
);

insert into member(username, password, name, email)
values('gsm01','gsm01','관리자', 'admin@gsm.kr');

insert into member(username, password, name, email)
values('gsm02','gsm02','박매일', 'park@gsm.kr');

insert into member(username, password, name, email)
values('gsm03','gsm03','홍길동', 'hong@gsm.kr');

select * from member;

-- 관계설정SQL(1:N)
create table customer(
  id int not null auto_increment, -- 번호(자동증가), 시퀀스
  name varchar(50) not null, -- 회원아이디
  company varchar(50) not null, -- 회원아이디
  gender varchar(30) not null, -- 제목
  email varchar(50) not null, -- 내용
  phone varchar(30) not null, -- 작성자
  address varchar(50) not null,
  zonecode int,
  roadAddress varchar(50),
  address2 varchar(50),
  primary key(id)
);

drop table customer;

select * from  customer