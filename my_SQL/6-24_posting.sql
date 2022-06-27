use mysql;

-- mySQL 접속위한 유저 만들기
create user 'posting_user'@'%' identified by '1234';
					-- '%' => 네트워크 통해서 접속가능하게 하겠다
 
grant all on posting_db.* to 'posting_user'@'%';
-- grant all on
-- 모든 권한을 주겠다
-- 모든권한을 준다 momo_db의 *(모든것)에 to 'memo_user' 에다가

select * from user;

use posting_db;

desc user;

-- 테이블복사
SELECT concat('RENAME TABLE ',TABLE_SCHEMA,'.',TABLE_NAME,' TO ','posting_db.',TABLE_NAME,';')
FROM information_schema.tables
WHERE TABLE_SCHEMA LIKE 'sns_pj_db';

RENAME TABLE sns_pj_db.user TO posting_db.user;
-- https://ryean.tistory.com/41
-- -----

select * from posting;

delete from posting
where id = 2;

select * from follow;

use posting_db;
delete from posting;

select * from tag_name;
select * from tag;
select * from posting;

-- car 로 검색하면,
select p.*
from tag_name tn
join tag t
on tn.id = t.tagId
join posting p
on p.id = t.postingId
where tn.name like '%S%'
group by t.postingId;

insert into likes
(postingId, userId)
values
(14, 2);

delete from likes
where postingId = 14 and userId = 2;

select * from likes;

delete from likes;

-- 테이블생성문 만들고싶으면
-- 테이블 우측마우스 > 카피 투 테이블 > 크리에잇 스테이트먼트
-- CREATE TABLE `likes` (
--   `id` int unsigned NOT NULL AUTO_INCREMENT,
--   `postingId` int DEFAULT NULL,
--   `userId` int DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내가 만든 포스팅 수정
update posting p
set content = 'asd',
imgUrl = 'asdf'
where userId = 2 and p.id = 15 ;

select * from posting;

select p.id
from posting p
where userId = 2 and content like '%농%';

-- 태그 삭제
select * 
from tag
where postingId = 15;

delete from tag
where postingId = 15;

select * 
from tag t
join tag_name tn
on t.tagId = tn.id
where postingId = 15;

-- 삭제하려면
-- 삭제할것들은?
select * from posting;
-- 포스팅 아이디
delete from posting
where id = 15 and userId = 2;
		-- 이것만 하고 유저아이디가 아니면은 밑에꺼 실행안하면 되는것
select * from likes;
-- 포스팅 아이디
delete from likes
where postingId = 15;

select * from tag;
delete from tag
where postingId = 15;

select * from tag_name;

-- p.*, count(l.postingId), u.email, u.name
select p.*, u.email, u.name, count(l.postingId) as cnt
from posting p
join user u
on p.userId = u.id
left join likes l
on p.id = l.postingId
where p.userId = 2
group by p.id;

select *
from likes;

select * from posting p
where userId = 2 and p.id = 16;

-- , count(l.userId)
select *, count(l.userId)
from follow f
join posting p
on p.userId = f.followeeId
left join likes l
on l.postingId = p.Id
where f.followerId = 2
group by p.id;

select * from likes;
select * from follow;

-- 내가 좋아요 했는지? 
select p.*, u.email, u.name,
	if(l.userId is null, 0, 1) as isLike, count(l2.postingId) as likeCnt
from follow f
join posting p
on p.userId = f.followeeId
join user u
on p.userId = u.id
# 내가 라이크 했는지
left join likes l
on l.postingId = p.id and l.userId = 2
# 좋아요 갯수확인하기위해서
left join likes l2
on l2.postingId = p.Id
where f.followerId = 2
group by p.id;