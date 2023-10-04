create table userHistory(
    uhno number(10),
    mno number(10),
    c_nick varchar2(10),
    uh_comment varchar2(500),
    uh_star float,
    cno number(10)
);
CREATE sequence seq_userHistory;
drop sequence seq_userHistory;
/*seq_movie.nextval*/
alter table userHistory add constraint pk_userHistory primary key (uhno);

alter table userHistory add CONSTRAINT fk_userHistory
foreign key(cno) references customer(cno);

insert into userHistory(uhno, mno, cno, c_nick,
    uh_comment, uh_star)
values(seq_userHistory.nextval, 1, 1, '사용자1', '이 영화는...', 3);

select * from userHistory;