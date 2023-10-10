package com.maker.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
import com.maker.domain.TicketVO;
import com.maker.mapper.MovieMapper;
import com.maker.mapper.TicketMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Service
@ToString
public class TicketServiceImpl implements TicketService {
	
	private final TicketMapper tMapper;
	private final MovieMapper mMapper;
	
    public void register(TicketVO ticket) {
    	tMapper.insert(ticket);
    }
    public List<TicketVO> getList(Long cno) {
        return tMapper.getList(cno);
    }
    public List<Integer> getSeatList(String t_time){
    	return tMapper.getSeatList(t_time);
    }
    //티켓 중복 확인
    public String isExistsTicketInfo(String t_time, int sno, String m_title) {
    	int mno = mMapper.findMnoByTitle(m_title);
        String isExists = "false";
        if(tMapper.ticketCheck(t_time, sno, mno) > 0) {
        	isExists = "true";
        }
        return isExists;
    }
	@Override
	public TicketVO get(Long tno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int remove(Long tno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int findByCno(Long cno) {
		// TODO Auto-generated method stub
		return 0;
	}
	//예약 좌석 목록
	@Override
	public List<Integer> getReservedSeats(String t_time, String m_title) {
		int mno = mMapper.findMnoByTitle(m_title);
		return tMapper.getReservedSeatsList(t_time, mno);
	}
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return tMapper.countBoard();
	}

	@Override
	public List<MovieVO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return tMapper.selectBoard(vo);
	}
}
