package com.maker.mapper;

import java.util.List;

import com.maker.vo.TicketVO;

public interface TicketMapper {
    List<TicketVO> getList();
    TicketVO read(Long tno);
    void insert(TicketVO ticket);
    int delete(Long tno);
    int update(Long tno);
    int checkTicket(String t_time, int sno);
}
