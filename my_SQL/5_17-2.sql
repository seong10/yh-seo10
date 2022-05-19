-- 100명 고객
select count(*)
from customers;
-- 700개 주문
select count(*)
from orders;

-- 관계형 데이터 베이스 에서는 합치는건 join 뿐이다
-- 두개 테이블을 하나로 합쳐서 가져오시오.
select *
from orders;

select *
from customers
join orders
	on customers.id = orders.customer_id;
-- 테이블 이름을 줄여서 사용하는 방법
select *
from customers c
		-- as 를 안써도 괜찮다
join orders o
	on c.id = o.customer_id;
    
-- 컬럼의 이름이 중복되는 경우는, 컬럼이름을 바꿔서 가져와야 한다.
select c.id as customer_id, c.first_name, c.email,
		o.id as order_id, o.amount, o.order_date
from customers c
join orders o
	on c.id = o.customer_id;
    
-- 지금까지 위에서 한 join 은, 두개 테이블에 공통으로 들어있는 데이터만
-- 가지고 온 것이다.

-- 모든 고객 데이터를 가져오되, 주문정보가 없는 고객도 나타나도록 가져오는 방법
-- left join !!!
select *
from customers c
left join orders o 
	on c.id = o.customer_id;
    
-- 주문 금액이 600 달러보다 큰 사람의 데이터를 가져오시오.
select *
from customers c
left join orders o 
	on c.id = o.customer_id
where amount > 600;

-- 주문 금액이 600 달러보다 큰 사람의 이메일을 가져오시오.
-- distinct !!
select distinct c.email
from customers c
left join orders o 
	on c.id = o.customer_id
where amount > 600;

-- 주문 금액이 600 달러보다 큰 사람의 이메일과, 주문날짜와, 금액을 가져오는데,
-- 주문날짜 내림차순으로 가져오세요.
select c.email, o.order_date, o.amount
from customers c
left join orders o 
	on c.id = o.customer_id
where amount > 600
order by order_date desc;

-- 각 고객별로, 주문 수를 나타내시오.
select first_name, last_name, count(*) as order_cnt
from customers c
left join orders o 
	on c.id = o.customer_id
group by email;

-- 각 고객별로 주문 금액 평균이 300 달러 이상인 데이터만 가져오시오.
select c.first_name, c.last_name, avg(o.amount) as AVG
from customers c
left join orders o 
	on c.id = o.customer_id
group by c.id having avg(o.amount) > 300;
-- group by 에서 조건을 걸때는 having 을 쓴다 where X

-- 각 고객별로 주문 금액 최대값이 600 달러 이상인 데이터만 가져와서,
-- 내릶차순으로 정렬하시오.
select c.first_name, c.last_name, max(o.amount) as MAX, c.email
from customers c
left join orders o 
	on c.id = o.customer_id
group by c.id having MAX >= 600
order by MAX desc;