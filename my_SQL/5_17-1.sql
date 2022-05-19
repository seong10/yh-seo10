select *
from yh_db.books;

use yh_db;
select*
from books;
-- use를 쓰지않으면 다른 테이블 억세스 못함

-- if() 함수!!!
-- pages 가 300 보다 크면 long, 그렇지 않으면 short
select *, if( pages >= 300, 'long', 'short' )
from books;
-- case를 많이쓰고 if는 있었지정도만 알아두자

select *
from yh_db.people;

select *
from people;

insert into people
(first_name)
values
('Mike');

-- ifnull() 함수 , 컬럼에 NULL 값을 다른 값으로 변경할때
select *, ifnull( age, 100 )
			-- age 컬럼의 null 의 값을 100으로 바꿔라
from people;

select *
from books
where released_year < 1980;

select *
from books
where author_lname in ('eggers', 'chabon');

select * 
from books
where author_lname = 'lahiri' and released_year > 2000;

select *
from books
where pages between 100 and 200;

select *
from books
where author_lname like 'C%' or author_lname like 'S%';
--
select *
from books
where substr(author_lname, 1, 1) = 'C' or substr(author_lname, 1, 1) = 'S';

select title, author_lname,
	case
		when title like '%stories%' then 'Short Stories'
        when title = 'just kids' or title like '%a heartbreaking%' then 'Memoir'
		else 'Novel'
    end as 'TYPE'
from books;

select title, author_lname, -- if( count(*) = 1 , concat(count(*), 'book') , concat(count(*), 'books') )
	case
		when count(*) >= 2 then concat(count(*), ' books')
        else concat(count(*), ' book')
    end as COUNT
from books
group by author_lname , author_fname
order by 2;
-- --
select title, author_lname, if( count(*) = 1 , concat(count(*), 'book') , concat(count(*), 'books') )
from books
group by author_lname , author_fname
order by 2;