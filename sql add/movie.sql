create table movie(
    mno number(10),
    m_title varchar2(100) not null,
    m_comment varchar2(2500) not null,
    m_direct varchar2(40) not null,
    m_char varchar2(40) not null,
    m_open varchar2(10) not null,
    m_star float default 0,
    m_img nvarchar2(1000),
    m_time varchar2(5)
);
CREATE sequence seq_movie;
drop sequence seq_movie;
/*seq_movie.nextval*/
alter table movie add constraint pk_movie primary key (mno);

insert into movie(mno, m_title, m_comment, m_direct,
    m_char, m_open)
values(seq_movie.nextval, '영화1', '이 영화는...', '감독', '이배우', '20220101');

select *  from movie;

ALTER TABLE movie MODIFY (m_comment VARCHAR2(2500));
ALTER TABLE movie MODIFY (m_star float default 0);
commit;

delete movie;
select * from movie order by mno;

SELECT *
FROM movie
WHERE ROWNUM <= 5
order by m_star;

SELECT *
FROM movie
WHERE ROWNUM <= 5
order by mno desc;