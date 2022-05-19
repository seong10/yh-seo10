use shirts_db;

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

select article, color
from shirts;

select article, color, shirt_size, last_worn  -- 뭘 불러올지는 마지막에 쓰기
from shirts
where shirt_size = 'M';

update shirts
set shirt_size = 'L'
where article = 'polo shirt';
select *
from shirts;

-- last worn 이 15보다 큰것들은, 0으로 바꾼다.
update shirts
set last_worn = '0'
where last_worn > '15';

-- 하얀 셔츠들만, 사이즈는 XS로, 컬러는 off white로 바꾸세요.
update shirts
set shirt_size = 'XS', color = 'off white' -- 이런식으로 연달아씀
where color = 'white';

delete from shirts
where last_worn > 200;

delete from shirts
where article = 'tank top';

-- 데이터를 모두 삭제!
delete from shirts;

select * from shirts;

-- 테이블 자체를 삭제!!
drop table shirts;