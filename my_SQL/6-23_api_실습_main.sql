use movie_project_db;

select * from rating;

select * from user
where email = 'abc@gmail.com';

select * from rating
where userId = 1002;

select m.title, r.rating
from rating r
join movie m
on r.movieId = m.id and r.userId = 1002
limit 0, 25;

delete from rating
where userId = 1002 and 

# 영화하나 탭하면 영화리뷰 보여주는
select m.title, u.name, u.gender, r.rating
from movie m
left join rating r
on m.id = r.movieId
join user u
on r.userId = u.id and m.id = 125
order by u.name 
limit 0, 25;
# tech
select u.name, u.gender, r.rating
from rating r
join movie m
on r.movieId = m.id and m.id = 100
join user u
on r.userId = u.id
limit 0, 25;

select *
from user;

select *
from rating;

# 검색엔진
# 근데 제일 간단한것 실무에서는 더 복잡한것으로 씀
select m.title, count(r.movieId) as cnt, ifnull(avg(r.rating), 0) as avg
from movie m
join rating r
on m.id = r.movieId
where m.title like '%re%'
group by m.id
limit 0, 25;

# 즐겨찾기 추가
insert into favorite
(userId, movieId)
values
(1002, 109);

# 즐겨찾기 삭제
delete from favorite
where userId = 1002 and movieId = 101; 

# 내 즐겨찾기 설정한 영화만 따로 가져오기
select *
from favorite
where userId = 1002;

select * from favorite;

select * from movie;

# 영화추천
select r.userId, r.movieId, r.rating, m.title
from rating r
join movie m
on r.movieId = m.id and r.userId = 1002;

select * from movie;
select * from rating;

# 실시간 으로 가져올때
# 데이터프레임 만드는 쿼리
select m.title, r.movieId, r.rating, r.userId
from movie m
join rating r
on m.id = r.movieId; 