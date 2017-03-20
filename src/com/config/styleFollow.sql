-- admin
create user stylefollow identified by stylefollow;

grant resource, connect to stylefollow;

-- stylefollow/stylefollow
create table userInfo(
  userid varchar2(10) not null primary key,
  pwd varchar2(10) not null,
  gender varchar2(5));
  
create table userStyle(
  userid varchar2(10),
  style varchar2(20),
  constraint userStyle_userid_fk foreign key (userid) references userInfo(userid));

create sequence post_seq;

create table post(
  idx number(4) not null primary key,
  userid varchar2(10) not null,
  weather varchar2(10) not null,
  style varchar2(20) not null,
  photo varchar2(100) not null,
  content varchar2(4000) not null,
  writeday date default sysdate,
  constraint post_userid_fk foreign key(userid) references userInfo(userid));
  
create sequence comment_seq;

create table comments(
  cmntidx number(4) not null primary key,
  userid varchar2(10) not null,
  postidx number(4),
  constraint comments_postidx_fk foreign key(postidx) references post(idx));
  
create table likes(
  idx number(4),
  userid varchar2(10) not null,
  constraint likse_idx_fk foreign key(idx) references post(idx));