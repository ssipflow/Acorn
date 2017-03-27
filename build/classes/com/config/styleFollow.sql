-- admin
create user stylefollow identified by stylefollow;

grant resource, connect to stylefollow;

-- stylefollow/stylefollow
create table userInfo(
  userid varchar2(100) not null primary key,
  pwd varchar2(100) not null,
  gender varchar2(50));
  
create table userStyle(
  userid varchar2(100),
  style varchar2(20),
  constraint userStyle_userid_fk foreign key (userid) references userInfo(userid) on delete cascade);

create table post(
  idx number(4) not null primary key,
  userid varchar2(100) not null,
  weather varchar2(10) not null,
  style varchar2(20) not null,
  photo varchar2(100) not null,
  content varchar2(4000) not null,
  writeday date default sysdate,
  temp number(2) not null,
  constraint post_userid_fk foreign key(userid) references userInfo(userid) on delete cascade);

create table comments(
  cmntidx number(4) not null primary key,
  userid varchar2(100) not null,
  postidx number(4),
  commented varchar2(50),
  writeday date default sysdate,
  constraint comments_postidx_fk foreign key(postidx) references post(idx) on delete cascade,
  constraint comments_userid_fk foreign key(userid) references userinfo(userid) on delete cascade);
  
create table likes(
  idx number(4),
  userid varchar2(10) not null,
  constraint likse_idx_fk foreign key(idx) references post(idx) on delete cascade,
  constraint likes_userid_fk foreign key(userid) references userinfo(userid) on delete cascade);
  
create sequence post_seq;
create sequence comment_seq;