package com.maker.service;

import java.util.List;

import com.maker.mapper.TicketMapper;
import com.maker.vo.TicketVO;

public class TicketServiceImpl {
	private TicketMapper mapper;
	
    public boolean isBookingExists(String t_time, int sno) {
        if(mapper.checkTicket(t_time, sno) == 0){
            return true;
        } else {
            return false;
        }
    }
    public void register(TicketVO ticket) {
    	mapper.insert(ticket);
    }
    public List<TicketVO> getList() {
        return mapper.getList();
    }
}
