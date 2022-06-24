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

-- car 로 검색하면,
select *
from tag_name tn
join tag t
on tn.id = t.tagId
join posting p
on p.id = t.postingId
where tn.name like '%car%';