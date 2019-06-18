create database kkh;
use kkh;

-- 멤버
-- ID(PK), PW not null, 닉, 연락처, 이메일, 가입날짜 not null, 접속일수(현재 날짜-가입날짜)
create table user (
	user_id varchar(10) primary key,
    user_pw varchar(15) not null,
    user_nick varchar(8) not null unique,
    user_tel int(11),
    user_mail varchar(30),
    user_regist_date date not null,
    user_count_day int(10)
);
select * from user;
insert into user values(6,6,6,6,6,'2019-06-01',0);
update user set user_count_day = datediff(now(),user_regist_date) where user_id = 5;


-- 게시판ID&게시판명
-- 게시판_ID(PK) auto in, 게시판명(not null)
create table board_info (
	board_id int(3) auto_increment primary key,
    board_name varchar(8) 
);

-- 로그인된 글
-- 글번호(PK) auto in, 게시판_ID(FK-게시판ID&게시판명), 제목, 닉(FK-멤버), 내용, 날짜, 수정날짜, 추천수, 조회수
create table article_user (
	article_user_id int(8) auto_increment primary key,
    board_id int(3),
    title_user varchar(10) not null,
    user_nick varchar(8),
    content_user varchar(500) not null,
    write_date date not null,
    update_date timestamp,
    like_count int(4),
    read_count int(6) default 0,
    
    foreign key (board_id) references board_info (board_id),
    foreign key (user_nick) references user (user_nick)
);

-- 로그인 안된 글
-- 글번호(PK) auto in, 게시판_ID(FK-게시판ID&게시판명), 제목, 유동닉, 내용, 날짜, 수정날짜, 추천수, 조회수, 글비번 notnull
create table article_guest (
	article_guest_id int(8) auto_increment primary key,
    board_id int(3),
    title_guest varchar(10) not null,
    guest_nick varchar(8) not null,
    content_guest varchar(500) not null,
    write_date date not null,
    update_date timestamp,
    like_count int(4),
    read_count int(6) default 0,
    article_password int(3) not null,
    
    foreign key (board_id) references board_info (board_id)
);



-- 로그인된 댓글
-- 댓글_ID(PK), 글번호(FK-글), 내용, 닉(FK-멤버), 날짜, 추천수
create table comment_user (
	comment_user_id int(8) primary key,
    article_user_id int(8),
    comment_user varchar(100) not null,
    user_nick varchar(8),
    write_date timestamp not null,
    like_count int(4),
    
    foreign key (user_nick) references user (user_nick),
    foreign key (article_user_id) references article_user (article_user_id)
);


-- 로그인 안된 댓글
-- 댓글_ID(PK), 글번호(FK-글), 내용, 유동닉, 날짜, 추천수, 댓글비번
create table comment_guest (
	comment_guest_id int(8) primary key,
    article_guest_id int(8),
    comment_guest varchar(100) not null,
    guest_nick varchar(8) not null,
    write_date timestamp not null,
    like_count int(4),
    comment_password int(3) not null,
    
    foreign key (article_guest_id) references article_guest (article_guest_id)
);

-- '글'에서 뷰1
-- 글번호(PK), 게시판_ID(FK), 제목, 글쓴이, 날짜, 추천수, 조회수.

 
