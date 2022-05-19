use memo_app_db;

select * from user;

insert into user
(email, password, name)
values
('abc@naver.com', '16fd', 'Sally');

delete from user
where id = 4;

12:50:59	insert into user (email, password, name) values ('abc@naver.com', '16fd', 'Sally')	
Error Code: 1062. Duplicate entry 'abc@naver.com' for key 'user.u_email'	0.000 sec;

select * from memo;
select * from user;

insert into memo
(user_id, content, todo_date) -- is_completed 는 처음 쓸땐 다 0일테니까 디폴트는 0으로하면 쓸필요없다
values
(3, '개발 미팅', '2022-06-28 10:30');
-- user_id 5 는 에러남 왜? user에 5번 id가 없기때문

select * from follow;

insert into follow
(follower_id, followee_id)
values
(1, 3);

delete from follow;

insert into memo
(user_id, content, todo_date)
values
(1, '만들었다 일', '2022-05-10 20:00');

-- 내 일정 가져오는 SQL
select *
from memo
where user_id = 2
order by todo_date desc
limit 0, 25;

-- 일정 완료 여부 셋팅하는 SQL
update memo
set is_completed = 1
where id = 3;

select * from memo;

-- 친구 목록 가져오기
select *
from user u
join memo m
	on u_id = m.user_id;

select* from user;
select* from follow;

select *
from follow f
join user u
	on f.followee_id = u.id
join memo m
	on m.user_id = u.id
where follower_id = 1;

-- 나의 id는 1이다,
-- 내 친구들인, 김나나와 mike 의 일정을 가져오는 SQL
select u.name, m.content, m.todo_date, m.is_completed
from follow f
join memo m
	on f.followee_id = m.user_id
join user u
	on m.user_id = u.id
where follower_id = 1 and todo_date > now()
order by todo_date desc ;


select *
from memo
where todo_date > now();

select *
from memo
where todo_date < now();

