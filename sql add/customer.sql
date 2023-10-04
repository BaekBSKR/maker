create table customer(
    cno number(10),
    c_nick varchar2(10) not null,
    c_pwd varchar2(15),
    c_mail varchar2(20) not null,
    c_id varchar2(30),
    c_birth varchar2(15)
);
CREATE sequence seq_customer;
drop sequence seq_customer;
/*seq_movie.nextval*/
alter table customer add constraint pk_customer primary key (cno);

insert into customer(cno, c_nick, c_pwd, c_mail, c_id, c_birth)
values(seq_customer.nextval, '사용자1', '', 'asdf@naver.com', '', '');

select * from customer;