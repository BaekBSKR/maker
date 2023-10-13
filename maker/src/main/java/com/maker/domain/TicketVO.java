package com.maker.domain;

import java.util.List;

import lombok.Data;

@Data
public class TicketVO {
    private Long tno;
    private String t_time;
    private int t_price;
    private int sno;
    private Long mno;
    private Long cno;
    
    private List<MovieVO> movieVO;
    private String m_img;
    private String m_title;
    private String m_time;
    
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
