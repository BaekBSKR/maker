create table notice(
    nno number(10),
    n_title varchar2(10) not null,
    n_comment varchar2(15) not null,
    n_reg date default sysdate,
    cno number(10)
);
CREATE sequence seq_notice;
drop sequence seq_notice;
/*seq_movie.nextval*/
alter table notice add constraint pk_notice primary key (nno);
alter table notice add CONSTRAINT fk_notice
foreign key(cno) references customer(cno);

insert into notice(nno, n_title, n_comment, n_reg, cno)
values(seq_notice.nextval, '공지1', '00일 부로...', sysdate, 1);

select * from notice;