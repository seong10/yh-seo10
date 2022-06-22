use mysql;

# mySQL 접속위한 유저 만들기
create user 'recipe_user'@'%' identified by 'recipe1234';
 
grant all on recipe_db.* to 'recipe_user'@'%';

