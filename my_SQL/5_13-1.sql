use yh_db;  -- 작업할 데이터 베이스 선택하는 SQL

show tables; -- 지금 작업하고 있는 DB의 테이블이름 보여주는 SQL

desc tweets; -- 테이블의 컬럼들을 보여줌

-- 데이터를 테이블에 저장하는 방법

insert into cats (name, age) values ('Jetson', 7);

-- 저장된 데이터를 가져오는 방법

select * from cats;
--   모든컬럼  

insert into cats (name, age) values ('야옹이', 3);

insert into cats values ('Blue' , 6);

-- 하나의 SQL문으로 데이터를 여러개 저장하는 방법
insert into cats
(name, age)
values
('검정이', 4) , ('노랑이', 3), ('Happy', 8);
-- 맨끝에 ; 콜론만 있으면은 여러줄을 써도 하나의 문장으로 인식함

 select * from cats;
 
 select * from people;
 
 insert into people
 (first_name, last_name, age)
 -- id컬럼은 쓰지않음 자동증가 해놨기때문
 values
 ('Bob', 'Belcher', '42');
 -- ('Tina', 'Belcher', 13);
 
insert into people
(first_name, last_name, age)
values
('Linda', 'Belcher',  45),
('Phillip', 'Fround', 38),
('Calvin', 'Fischoeder', 70);

select * from people;


insert into people
(first_name, last_name, age)
values
('Calvin', 'Fischoeder hello bye nice', 70);
		-- 글자수가 20글자가 넘어 안들어가짐
        -- 피플 컬럼을 수정해서 다시 할수 있음

insert into people
(first_name, age)
values
('data', 56);
-- 빈것은 null로 들어감

insert into people
(first_name)
values
('data2');
-- 원하는 컬럼만 지정해서 데이터를 넣을수 있다people

insert into people
(first_name)
values
('data3');
-- 컬럼에 NN을 설정한후 하면
-- 공백문자로 처리함, 숫자는 0 으로 처리됨
	-- not null 인 경우, 데이터를 안 넣으면,
	-- 문자열은 공백으로 저장되고, 숫자는 0으로 저장된다.

select * from people;

insert into people
(first_name)
values
('Linda');
-- 컬럼환경에 default 항목에 데이터를 적어주면, 
-- 해당 데이터가 비어있는 상태로 insert 되면,
-- default 에 적은 데이터로 저장된다.

insert into cats
(name, breed, age)
values
('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7);

select * from cats;

-- 기존 데이터의 값을 변경하는 SQL
-- breed 가 Tabby 인 고양이의 종을, shorthair 로 변경
update cats
set breed = 'Shorthair'
where breed = 'Tabby';
-- 테이블명과 컬럼명에는 '' 안붙임 데이터가아님

-- 고양이 이름이 Misty 인 고양이의 나이를 14로 바꾸세요
update cats
set age = 14
where name = 'Misty';

-- 이름이 'Jackson'인 고양이의 이름을 Jack 으로 바꾸세요
update cats
set name = 'Jack'
where name = 'Jackson';

-- 데이터 삭제하는 방법
delete from cats
where name= 'Egg';

select * from cats;

-- 고양이의 나이가 4살인 고양이 데이터를 삭제하세요.
delete from cats
where age= 4;

-- 나이가 10살인 고양이의 데이터를 가져오시오
select * from cats
where age = 10;

-- 모든 고양이의 이름과 나이만 가져오시오.
select name, age from cats;
-- * 에 컬럼을 넣으면 해당컬럼만 가져온다

-- 고양이의 나이가 10살이상인 고양이의, 이름과 나이만 가져오시오.
select name, age from cats
where age >= 10;

insert into shirts
(article, color, shirt_size, last_worn)
values
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'balck', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

select * from shirts;

select * from shirts
where shirt_size = 'M'

update shirts
set artide, shirt_size = 'polo shirt', 'L'
where artide, shirt_size = 'polo shirt', 'M';

update cats
set name = 'Jack'
where name = 'Jackson';

update shirts
set last_worn = '15'
where last_worn = '0';


-- ----


use yh_db;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- 작가 이름을 가져오세요.
select author_fname, author_lname
from books;

-- 작가 이름을 합쳐서 full_name 으로 가져오세요.
select concat( author_fname, ' ', author_lname ) as full_name
									-- as => 합친것들을 컬럼을 full_name으로 바꿔라
from books;

select concat_ws('-', author_fname, author_lname, pages)
	-- ws=> 와이티에스 => 합치되 (첫번째 파라미터)로 합쳐라
from books;

-- 문자열의 일부분만 가져오기 (슬라이싱 비슷)
-- 제목을 처음부터 10글자 까지만 가져오기
select substring(title, 1, 10) as title
from books;

-- 제목의 맨 뒤에서 5번째 글자부터 끝까지 가져오기
select substring(title , -5)
from books;

-- 제목의 5번째 글자부터 12번째 글자까지 가져오시오.
select substr(title, 5, 12)
	-- string 과 똑같음
from books;

-- 제목의 처음부터 10글자를 가져오되, 뒤에 ...을 붙여서 가져오시오.
select concat( substr(title , 1, 10), '...' ) as short_title
			-- 개발 순서는 안에부터 함
from books;

-- '나쁜놈아 그렇게 살지마라' 욕을 바꾼다면
select replace('나쁜놈아 그렇게 살지마라', '나쁜놈', '***');

-- 제목 컬럼에 들어있는 e를 3을 바꿔서 가져오세요.
select replace( title, 'e', '3')
from books;

-- 문자열의 순서를 거꾸로 뒤집는 함수
-- 'hello' => 'olleh'

-- author_fname 을 뒤집어서 가져오세요.
select reverse(author_fname)
from books;

-- 책 제목의 길이 구하시오
select char_length( title ) as length
from books;

-- 책 제목 길이는 12
-- 책 제목 길이는 15
select concat('책 제목 길이는', char_length( title ) ) as length
from books;

-- 대문자, 소문자 바꾸기
select UPPer(TitLe)
-- 함수이름, 컬럼이름 대소문자 안가림, 데이터는 빼고
from books;

select lower(title)
from books;


-----


select replace(title, ' ', '->')
from books;

select *
from books;

select author_lname as forwards, reverse(author_lname) as backwards
from books;

select concat( upper(author_Fname), ' ', upper(author_lname) ) as 'full name in caps'
from books;
select upper( concat(author_Fname, ' ', author_lname) ) as 'full name in caps'
from books;

select concat_ws(' was released in ', title, released_year) as blurb
from books;
select concat_ws(' ', title, 'was released in', released_year) as blurb
from books;

select title, char_length(title) as 'character count'
from books;

select *
from books;

select concat( substr(title, 1, 10), '...') as 'short title' ,
concat(author_lname, ',', author_fname) as 'author' ,
concat(stock_quantity, ' in stock') as 'quantity'
from books;