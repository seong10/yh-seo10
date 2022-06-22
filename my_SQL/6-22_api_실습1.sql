use mysql;

# mySQL 접속위한 유저 만들기
create user 'memo_user'@'%' identified by 'memo1234';
					# '%' => 네트워크 통해서 접속가능하게 하겠다
 
grant all on memo_db.* to 'memo_user'@'%';
# grant all on
# 모든 권한을 주겠다
# 모든권한을 준다 momo_db의 *(모든것)에 to 'memo_user' 에다가

use memo_db;

select * from user;

select * from memo;

-- delete from memo;

insert into memo
(title, contents)
values
( %s, %s);

select *
from memo
where user_id = 1
limit 0 , 2;

insert into memo
(title, date, contents, user_id)
values
('커피', '2022-06-12 11:15', '모닝커피', 1);

update memo
set title = '점심',
date = '2022-03-14 14:15',
contents = '맛난점심'
where id = 2 and user_id = 1;

delete from memo
where id = 1 and user_id = 3;

# 친구맺기
insert into follow
(follower_id, followee_id)
values
(2, 3);

delete from follow
where follower_id = 2 and followee_id = 3;

select *
from follow;

select *
from memo;

select *
from user;

select *
from memo m
join follow f
on m.user_id = f.followee_id;

select *
from memo m
join follow f
on m.user_id = f.followee_id and follower_id = 1
join user u
on m.user_id = u.id;

select *
from memo m
join follow f
on m.user_id = f.followee_id
where f.follower_id = 1;