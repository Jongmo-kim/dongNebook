create table "CATEGORY"(
    category_no number primary key,
    category_name varchar2(20) not null
);
create table "USER"(
    user_no number primary key,
    category_no number,
    user_id varchar2(100) not null unique,
    user_pw varchar2(100) not null,
    user_name varchar2(20) not null,
    phone char(13) null,
    email varchar2(100) not null,
    addr varchar2(100) null
);
create sequence user_seq;
create sequence category_seq;
alter table "USER" add constraint category_no_foreign_key 
foreign key(category_no) references "CATEGORY"(category_no);
commit;

