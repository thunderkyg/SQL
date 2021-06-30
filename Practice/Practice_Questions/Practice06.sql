--Pratice06 문제
-------------------------------
--book 테이블 삭제
drop table book;
--author 테이블 삭제
drop table author;
--book sequence 삭제
drop sequence seq_book_id;
--author sequence 삭제
drop sequence seq_author_id;
--------------------------------
--book table 만들기
create table book (
    book_id number(5),
    title varchar2(50) not null,
    pubs varchar2(20),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key (author_id)
    references author(author_id)
    );
--book 관련 sequence 만들기
create sequence seq_book_id
increment by 1
start with 1;
--book table 데이터 저장-8개
insert into book values (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book values (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);
insert into book values (seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);
insert into book values (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book values (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book values (seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);
insert into book values (seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);
insert into book values (seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);
--
--author table 만들기
create table author(
    author_id number(5),
    author_name varchar2(30) not null,
    author_desc varchar2(50),
    primary key (author_id)
    );
--author 관련 sequence 만들기
create sequence seq_author_id
increment by 1
start with 1;
--author table 데이터 저장-6개
insert into author values (seq_author_id.nextval, '이문열', '경북 영양');
insert into author values (seq_author_id.nextval, '박경리', '경상남도 통영');
insert into author values (seq_author_id.nextval, '유시민', '17대 국회의원');
insert into author values (seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
insert into author values (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
insert into author values (seq_author_id.nextval, '김영하', '알쓸신잡');
--
--select 문(조인)
select *
from book bo, author au
where bo.author_id = au.author_id;
--author_desc 정보 변경
update author
set author_desc = /*수정값*/''
where author_id = /*숫자입력*/;
--author 테이블의 기안84 데이터 삭제
delete from author
where author_id = 4;