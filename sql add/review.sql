create table review(
    rno number(10),
    c_nick varchar2(10),
    r_comment varchar2(500),
    r_star float,
    mno number(10),
    cno number(10)
);
CREATE sequence seq_review;
drop sequence seq_review;
/*seq_movie.nextval*/
alter table review add constraint pk_review primary key (rno);

alter table review add CONSTRAINT fk_review_cus
foreign key(cno) references customer(cno);
alter table review add CONSTRAINT fk_review_mov
foreign key(mno) references movie(mno);

insert into review(rno, mno, cno, c_nick,
    r_comment, r_star)
values(seq_review.nextval, 1, 1, '사용자1', '이 영화는...', 3);

select * from review;

drop table review;