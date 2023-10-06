package com.maker.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maker.domain.TicketVO;

public interface TicketMapper {
    List<TicketVO> getList();
    TicketVO read(Long tno);
    void insert(TicketVO ticket);
    int delete(Long tno);
    int update(Long tno);
    int ticketCheck(@Param("t_time")String t_time, @Param("sno")int sno);
    List<Integer> getSeatList(String t_time);
}
