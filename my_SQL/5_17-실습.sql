use yh_db;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select *
from students;

select *
from papers;

select s.first_name, p.title, p.grade
from students s
join papers p
	on p.student_id = s.id
order by p.grade desc;

select s.first_name, p.title, p.grade
from students s
left join papers p
-- right join도 있고 left의 뜻은 왼쪽, students 를 첫번째 기준으로 두고 조인해라
	on p.student_id = s.id;
    
select s.first_name, ifnull(title, 'MISSING') as title, ifnull(grade, 0) as grade
from students s
left join papers p
	on p.student_id = s.id;
    
select s.first_name, ifnull(avg(grade), 0) as average
from students s
left join papers p
	on p.student_id = s.id
group by s.id
order by grade desc;

select s.first_name, ifnull(avg(grade), 0) as average, if(avg(grade) > 70, 'PASSING', 'FAILING') as passing_status
-- select 문 안에서 as 로 한것은 만들어지지 않은것이다
from students s
left join papers p
	on p.student_id = s.id
group by s.id
order by grade desc;

-- 실습 2 --
INSERT INTO series (title, released_year, genre) VALUES
   ('Archer', 2009, 'Animation'),
   ('Arrested Development', 2003, 'Comedy'),
   ("Bob's Burgers", 2011, 'Animation'),
   ('Bojack Horseman', 2014, 'Animation'),
   ("Breaking Bad", 2008, 'Drama'),
   ('Curb Your Enthusiasm', 2000, 'Comedy'),
   ("Fargo", 2014, 'Drama'),
   ('Freaks and Geeks', 1999, 'Comedy'),
   ('General Hospital', 1963, 'Drama'),
   ('Halt and Catch Fire', 2014, 'Drama'),
   ('Malcolm In The Middle', 2000, 'Comedy'),
   ('Pushing Daisies', 2007, 'Comedy'),
   ('Seinfeld', 1989, 'Comedy'),
   ('Stranger Things', 2016, 'Drama');
   
INSERT INTO reviewers (first_name, last_name) VALUES
   ('Thomas', 'Stoneman'),
   ('Wyatt', 'Skaggs'),
   ('Kimbra', 'Masters'),
   ('Domingo', 'Cortes'),
   ('Colt', 'Steele'),
   ('Pinkie', 'Petit'),
   ('Marlon', 'Crafford');
  
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
   (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
   (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
   (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
   (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
   (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
   (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
   (7,2,9.1),(7,5,9.7),
   (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
   (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
   (10,5,9.9),
   (13,3,8.0),(13,4,7.2),
   (14,2,8.5),(14,3,8.9),(14,4,8.9);
   
select *
from series;

select *
from reviewers;

select *
from reviews;

select title, rating
from series s
left join reviews r
	on s.id = r.series_id;
    
select title, avg(rating) as avg_rating
from series s
join reviews r
	on s.id = r.series_id
group by title
order by avg_rating;

select first_name, last_name, rating
from reviewers rw
left join reviews r
	on rw.id = r.reviewer_id;
    
select title as unreviewed_series
from series s
left join reviews r
	on s.id = r.series_id
where rating is null;

select genre, avg(rating) as avg_rating
from series s
join reviews r
	on s.id = r.series_id
group by genre;

select first_name, last_name, 
	count(rating) as COUNT, 
	ifnull(min(rating), 0) as MIN, 
    ifnull(max(rating), 0) as MAX, 
    ifnull(avg(rating), 0) as AVG,
	if(count(rating) = 0, 'INACTIVE', 'ACTIVE') as STATUS
from reviewers rw
left join reviews r
	on rw.id = r.reviewer_id
group by rw.id;

select s.title, r.rating, 
	concat(rv.first_name, ' ', rv.last_name) as reviewer
from series s
join reviews r
	on s.id = r.series_id
join reviewers rv
	on rv.id = r.reviewer_idfirst_name
order by s.title, r.rating desc;
    