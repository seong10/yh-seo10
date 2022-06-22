use recipe_db;

select * from recipe;

insert into recipe
(name, description, cook_time, directions)
values
('김치찌게', '맛있는 김치찌게 만드는방법', 30,
 '먼저 고기를 볶은후, 물을넣고, 김치넣고 끓인다.');
 # 잘 들어가는거 확인했으면 카피해서 파이썬
 
 select *
 from recipe
 limit 3, 3;
 
 select *
 from recipe
 where id = 3;
 
 update recipe
 set name = '김찌짜글이'
 where id = 1;
 
 update recipe
 set cook_time = 120
 where id = 1;
 
 
 update recipe
 set name = '', description = '', cook_time = '',
 directions = ''
 where id = '';
 
 select * from recipe;
 
 ## 삭제하기
 delete from recipe
 where id = '';
 
 
 ## 6/20 ##
 use recipe_db;
 
 select * from recipe;
 
 update recipe
 set is_publish = 0
 where id = 2;
 
  select *
 from recipe
 where is_publish = 1
 limit 0, 3;
 
 select * from user;
 
 # 초기화해서 유저id 추가한다
 delete from recipe;
 
 select * from recipe;
 
 select * from user;
 
 insert into user
 (username, email, password)
 values
 ( '홍길동', 'adsf@naver.com', 'asdaf12');
 
 delete from user;
 
 select *
 from user
 where email = 'abc@naver.com';