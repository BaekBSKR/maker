package com.maker.domain;

public class TicketVO {
    private Long tno;
    private String t_time;
    private int t_price;
    private int sno;
    private Long mno;
    private Long cno;

    public TicketVO(){}

    public TicketVO(String t_time, int t_price, int sno,
                  Long mno, Long cno){
        this.t_time = t_time;
        this.t_price = t_price;
        this.sno = sno;
        this.mno = mno;
        this.cno = cno;
    }
}
