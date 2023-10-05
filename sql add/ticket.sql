create table ticket(
    tno number(10),
    sno number(10),
    t_time varchar2(20),
    t_price number,
    mno number(10),
    cno number(10)
);
CREATE sequence seq_ticket;
drop sequence seq_ticket;
/*seq_movie.nextval*/
alter table ticket add constraint pk_ticket primary key (tno);

alter table ticket add CONSTRAINT fk_ticket_cus
foreign key(cno) references customer(cno);
alter table ticket add CONSTRAINT fk_ticket_mov
foreign key(mno) references movie(mno);

alter table ticket drop CONSTRAINT fk_ticket;

insert into ticket(tno, sno, mno, cno, t_time,t_price)
values(seq_ticket.nextval, 35, 1, 1, '10~12', 10000);
/*202309081000*/
select * from ticket;
ALTER TABLE ticket MODIFY (t_time VARCHAR2(20));
commit;