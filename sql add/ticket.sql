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
drop table ticket;

insert into ticket(tno, t_time, t_price, sno, mno, cno) 
values(seq_ticket.nextval, '2023/10/10/18:00', 10000, 4, 4, 1);
select sno from ticket where t_time = '2023/10/11/12:00' and mno = 4;
select * from ticket where cno = 1 order by tno desc;