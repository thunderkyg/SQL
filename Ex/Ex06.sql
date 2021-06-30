--> Create webdb
create user webdb identified by 1234;

grant resource, connect to webdb;

alter user webdb identified by webdb;

drop user webdb cascade;


--> Create table
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
    );

-->COLUMN 추가
alter table book add(pubs varchar2(50));

-->COLUMN 수정 (속성)
alter table book modify (title varchar2(100));

-->COLUMN 수정 (제목/이름)
alter table book rename column title to subject;

-->COLUMN 삭제
alter table book drop(author);

-->TABLE 이름 수정
rename book to article;

--> TABLE 삭제
drop table article;

-- Create table author
create table author (
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
    );
 
--Create table book    
create table book (
  book_id number(10),
  title varchar2(100) 	not null,
  pubs varchar2(100),
  pub_date date,
  author_id number(10),
  primary key(book_id),
  constraint book_fk foreign key (author_id)
  references author(author_id)
);

-- DML - Insert/Update/Delete
-->Insert 문법
insert into author values(1, '박경리', '토지 작가');
insert into author(author_id, author_name) values(2, '이문열');

-->Update 문법
update author
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 1;

update author
set author_name = '김영기'
where author_id < 2;

update author
set author_name = '강풀',
    author_desc = '인기작가';

--Delete 문법
delete from author
where author_id = 1;

--주의 WARNING--
delete from author;

insert into author values (seq_author_id.nextval, '박경리', '토지 작가');
insert into author values (seq_author_id.nextval, '기안84', '웹툰작가');
insert into author values (seq_author_id.nextval, '이문열', '인기작가');
insert into author values (seq_author_id.nextval, '김영기', '123');
seq_author_id.nextval;
commit;

--Sequence 작성
create sequence seq_author_id
increment by 1
start with 1
nocache;

--Sequence 조회
select seq_author_id.currval
from dual;

select seq_author_id.nextval
from dual;

--
delete from author;

select *    
from author;

rollback;