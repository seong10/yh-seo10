use yh_db;

select *
from books;

select *
from yh_db.books;
-- use 안쓰고 이렇게 해도된다

insert into books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
values
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 111, 388);

select *
from books;

-- distinct
-- author_lname 의 이름을 중복없이 가져오세요.
select distinct author_lname
from books;

-- 작가의 full name 을 중복없이 가져오세요.
select distinct concat(author_fname,' ', author_lname)
-- distinct 는 컬럼에 왼쪽에 쓰는거다 / concat이 하나의 컬럼이 됬기에
from books;

-- 데이터 정렬 order by
-- 책 제목으로 정렬하세요
select *
from books
order by title;
-- order by는 데이터를 가져오고나서, 그러므로 제일 마지막에

-- 내림차순 정렬은 desc 이고, 
-- 오름차순 정렬은 디폴트 이므로, 아무것도 안쓰거나, asc 라고 써주면 된다.
select *
from books
order by title desc;
			-- asc(오름차순)

-- 년도 내림차순으로 정렬하여 년도와 책제목을 가져오시오.
select released_year, title
from books
order by released_year desc;

-- author_lname 으로 정렬을하고, 이 author_lname 이 같으면
-- author_fname으로 정렬하세요.
select *
from books
order by author_lname asc, author_fname desc;

-- full name 을 내림차순으로 정렬하고, 책 페이지가 많은것부터 가져오세요.
select *, concat(author_fname, ' ', author_lname) as full_name
from books
order by full_name desc, pages desc;
-- 처음걸로 정렬하고 그다음 걸로 정렬해라

select *, concat(author_fname, ' ', author_lname) as full_name
from books
order by 8 desc, 7 desc;
-- 숫자로도 컬럼을 억세스 할수있다

-- limit 와 offset
-- 몇개씩 끊어서 가져오시오!!!

-- 책테이블의 데이터를 3개만 가져오시오
select *
from books
limit 3;
--  limit 하나만 쓰면 갯수를 가져오는거고

-- 최신책을 기준으로 3개만 가져오시오.
select *
from books
order by released_year desc
limit 0, 3;
-- limit의 왼쪽이 offset(은 컴퓨터가 매기는 인덱스)
-- 왼쪽에서부터 오른쪽만큼 가져와라

select *
from books
order by released_year desc
limit 6, 3;

-- 최신책을 기준으로 10번째 책부터 끝까지 가져오시오.
select *
from books
order by released_year desc
limit 9, 154821335;
-- count 함수가 있지만 지금은 많이 큰수를 적으면 끝까지 가져온다고 알아두기

-- 문자열 포함 ( Search ) : like 키워드
-- 내가 찾고자 하는 문자열이, 컬럼에 포함되 있는지 확인하는 방법

-- 책 제목에 the 라고 들어있는(%) 책만 가져오시오.
select *
from books
where title like 'the';
-- 이거는 'the'랑 똑같은걸 가져오라는 뜻

select *
from books
where title like '%the%';
			-- 왼쪽 % 의 뜻은 왼쪽에 뭐가 들어있어도 상관없다 오른쪽도 마찬가지

-- the 로 시작하는 책만 가져오시오
select *
from books
where title like 'the%';

-- the 로 끝나는 책만 가져오시오
select *
from books
where title like '%the';

-- author_fname 에 da 라고 들어있는 작가의
-- 책 제목, author_fname, 페이지수를 가져오시오.

select title, author_fname, pages
from books
where author_fname like '%da%';

-- 언더스코어 ( _ ) 기호를 이용한 쿼리문.
-- 언더스코어 갯수만큼, 숫자가 2자리수인지 3자리수인지, 자리수를 나타낸다.
select *
from books
where stock_quantity like '___';
-- _(언더스코어)는 숫자를 말함 _ 3개는 숫자 3개

'(032)305-8126' like '(___)___-____';
-- 예로 왼쪽번호형식을 오른쪽 언더스코어로 가져올수 있음

-- 책 제목에 퍼센트 기호가 있는 책을 가져오시오.
select *
from books
where title like '%\%%';


-- @@ 실습 @@
select *
from books
where title like '%stories%';

select title, pages 
from books
order by pages desc
limit 1;

select concat(title, ' - ', released_year) as summary
from books
order by released_year desc
limit 3;

select title, author_lname
from books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
order by stock_quantity
limit 3;

select title, author_lname 
from books
order by author_lname, title;

select upper(concat('My favorite author is ', author_fname, ' ', author_lname, '!'))
as yell
from books
order by author_lname;


-- @@ 실습 끝 @@


-- books 테이블의 데이터 갯수(책의 갯수)는???
select count(*)
from books;
-- 19 개

-- author_fname 의 갯수는 ???
select count(distinct author_fname)
from books;

-- 책 제목에 the 라고 들어있는 책은 몇개인가요??
select count( * )
from books
where title like '%the%';

-- author_lname 별로, 몇권의 책을 썼는지,
-- author_lname과 cnt 라는 컬럼으로 데이터를 가져오시오
select author_lname, count(*)
from books
group by author_lname;

-- full_name 별로, 각각 몇권의 책을 썼는지
-- full_name 과 책의갯수를 cnt 라는 컬럼으로 가져오세요
select concat(author_fname,' ', author_lname) as full_name, count(*) as cnt
from books
group by full_name;

-- group by 는, 컬럼 1개, 2개, 3개... 상관없이 여러개 가능
select author_fname, author_lname, count(*)
from books
group by author_fname, author_lname;

-- 최소값 min함수

-- 년도의 최소값은???
select min(released_year)
from books;

-- 최대값 max함수
-- 페이지수가 가장 큰 값은???
select max(pages)
from books;

-- 페이지수가 가장 큰 책의 제목은???
select title, max(pages)
from books;
-- 이렇게는 안됨 지금까지 배운걸로는 정렬하는 방법밖에 없음

select title, pages
from books
order by pages desc
limit 1;

-- 평균 avg 함수
-- 이 테이블의 책 페이지수 평균은???
select avg(pages)
from books;

-- 각 작가별로, 자신이 쓴 책의 최소 년도는?? 
-- 작가의 성과 이름, 그리고 최소년도가 나오도록 가져오세요.
select author_fname, author_lname, min(released_year)
from books
group by author_fname, author_lname;

select author_fname, author_lname, released_year
from books
group by author_fname, author_lname;


-- 각 작가별로, 자신이 쓴 책의 페이지가 가장 많은 책의 페이지수를
-- 작가의 성과 이름, 그리고 최대 페이지수로 나오도록 가져오세요.
select author_fname, author_lname, max(released_year)
from books
group by author_fname, author_lname;

-- 이 테이블의 페이지수 총 합은???
select sum( pages )
from books;

-- 각 작가별로, 책 전체 재고량은???
-- 재고량과 작가 이름이 나오도록 데이터를 가져오시오.
select author_fname, author_lname, sum(stock_quantity)
from books
group by author_fname, author_lname;

-- 년도별로, 평균 재고량은??
-- 평균재고량과, 해당년도가 나오도록 데이터를 가져오시오
select released_year, avg(stock_quantity)
from books
group by released_year;

select released_year as year,
 count(released_year) as '# books',
 avg(pages) as 'avg pages'
from books
group by released_year
order by released_year;

select released_year as year,
 count(*) as '# books',
 avg(pages) as 'avg pages'
from books
group by released_year
order by released_year;

-- date, time, datetime
-- date YYYY-MM-DD
-- time HH:MM:SS
-- datetime YYYY-MM-DD HH:MM:SS

insert into people2
(name, birthdate, birthtime, birthdt)
values
('Padma', '1988-11-11', '10:07:35', '1988-11-11 10:07:35'),
('Larry', '1994-04-22', '04:10:42', '1994-04-22 04:10:42');

select *
from people2;

-- 현재 시간과 관련된 함수 3개 , curdate(), curtime(), now()
select curdate();
select curtime();
select now();

insert into people2
(name, birthdate, birthtime, birthdt)
values
('Harry', curdate(), curtime(), now() );

select *
from people2;

select name, year( birthdate )
from people2; 

select name, month( birthdate )
from people2;

select name, dayofweek( birthdate )
from people2;

select name, dayname( birthdate )
from people2;

select name, hour(birthtime)
from people2;

select name, minute(birthtime)
from people2;

select name, second(birthtime)
from people2;

-- 2000-11-11 03:50 에 태어났습니다.
select date_format( birthdt, '%Y-%m-%d %H:%i 에 태어났습니다.' )
from people2;

-- birthdate 컬럼과 현재시간의 차이를 가져오세요
select datediff( now() , birthdate )
from people2;

-- birthdate 에 36일 후는??
select date_add(birthdate, interval 36 day)
from people2;

select date_add(birthdate, interval 28 week)
from people2;

select birthdate + interval 28 week
from people2;
-- + 기호를 쓰고싶으면 속성?? 이 같이와야된다

select birthdt + interval 16 hour
from people2;

select birthdt + interval 2 year + interval 3 month - interval 5 hour
from people2;

-- date, time, datetime 데이터 타입에 대해서 배웠다.

-- timestamp 데이터타입! => 날짜를 숫자로 표현, 1970년 1월1일 자정을 0으로 시작
-- 지금까지 흘러온 초

create table comments (
	id int unsigned not null auto_increment primary key,
    content varchar(100),
    created_at timestamp default now()
-- created_at 이라고 통상적으로 명칭을 많이씀
);

insert into comments
(content)
values
('사과 진짜 맛있나요??????');

select * from comments;

update comments
set content = '같은데...'
where id = 3;

-- ~ 인것 가져오기
-- 년도가 2017인 데이터를 가져오시오
select *
from books
where released_year = 2017;

-- 년도가 2017년이 아닌 데이터만 가져오시오.
select *
from books
where released_year != 2017;

-- author_lname 이 Harris 가 아닌 데이터만 가져오시오.
select *
from books
where author_lname != 'Harris';
-- python 의 == 하고 다르다는거 주의@@

-- 책 제목이 w 로 시작하는 책을 가져오시오.
select *
from books
where title like 'W%';

-- 책 제목이 w 로 시작하지 않는 책을 가져오시오.
select *
from books
where title not like 'W%';
-- != 가 아니라 not 으로 쓴다
-- not 으로 쓰는 몇가지를 유의하자@@

-- 년도가 2000년보다 큰 데이터만 가져오세요
select *
from books
where released_year > 2000;

-- 년도가 2000년보다 큰 데이터만 가져오되, 최신순으로 가져오세요.
select *
from books
where released_year > 2000
order by released_year desc;

-- author_lname 이름이 'Eggers' 이고, 년도는 2000년 이후인 데이터를 가져오세요
select *
from books
where author_lname = 'Eggers' and released_year > 2000;

-- author_lname 이름이 'Eggers' 이고, 년도는 2000년 이후이며
-- 제목에 novel 이라고 들어간 데이터를 가져오세요
select *
from books
where author_lname = 'Eggers' and
	released_year > 2000 and
	title like '%Novel%';

-- author_lname 이 Eggers 이거나 출간년도가 2010보다 큰 책을 가져오시오
select *
from books
where author_lname = 'Eggers' or
	released_year > 2010;
    
-- 무엇과 무엇 사이의 데이터를 가져올때!!! (포함)
-- 년도가 2004년 부터 2015년 사이의 책 데이터를 가져오시오.
select *
from books
where released_year >= 2004 and released_year <= 2015;

select *
from books
where released_year between 2004 and 2015 ;
-- between 으로 간략하게 쓸수 있다

-- author_lname 이 'Carver' 이거나 'Lahiri' 이거나 'smith' 인
-- 데이터만 가져오시오.
select *
from books
where author_lname = 'carver' or
	author_lname = 'lahiri' or
    author_lname = 'smith' ;
    
select *
from books
where author_lname in ( 'carver', 'lahiri', 'smith' );

-- 년도가 2000년 이후에 나온 책들은 Modern 이라고 하고,
-- 그렇지 않는 책들은 Old 라고 새로운 컬럼을 만들어서 가져오세요.
select * , 
	case
		when released_year >= 2000 then 'Modern'
        else 'Old'
	end as Genre
from books;

-- stock_quantity 가 0~50 사이면, * (별표1개)
-- stock_quantity 가 51~100 사이면, ** (별표2개)
-- stock_quantity 그 외에는 *** (별표3개)
select *,
	case
		when stock_quantity between 0 and 50 then '*'
        when stock_quantity between 51 and 100 then '**'
        else '***'
	end as star
from books;