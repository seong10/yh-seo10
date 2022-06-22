use mysql;

# mySQL 접속위한 유저 만들기
create user 'm_p_user'@'%' identified by '1234';
					# '%' => 네트워크 통해서 접속가능하게 하겠다
 
grant all on movie_project_db.* to 'm_p_user'@'%';
# grant all on
# 모든 권한을 주겠다
# 모든권한을 준다 momo_db의 *(모든것)에 to 'memo_user' 에다가



use movie_project_db;

insert into user
(email, password, name, gender)
values
( "abc@gmail.com", '1234', '홍길동', 'male');

select * from user;
select * from movie;
select * from rating;

delete from user
where email = 'abc@gmail.com';

# 그냥 join 하면 별점없는영화는 빠진다
# 그래서 left join
select *, count(r.movie_id), ifnull(avg(r.rating), 0)
from movie m
left join rating r
on m.id = r.movie_id
group by m.id;

select m.id, m.title,
count(r.movie_id) as cnt, ifnull(avg(r.rating), 0) as avg
from movie m
left join rating r
on m.id = r.movie_id
group by m.id
# 정렬
order by cnt desc
# 몇개까지
# 첫번째 바꿔주면 어디서부터 25개씩 가져와라
limit 25, 25;

# 영화상세정보화면
select m.*, 
count(r.movie_id) as cnt, ifnull(avg(r.rating), 0) as avg
from movie m
left join rating r
on m.id = r.movie_id
where m.id = 1 
group by m.id ;
# where 는 group by 위에