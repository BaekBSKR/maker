package com.maker.service;

import java.util.List;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
import com.maker.domain.TicketVO;

public interface TicketService {
	void register(TicketVO ticket);
    TicketVO get(Long tno);
    int remove(Long tno);
    List<TicketVO> getList(Long cno);
    int findByCno(Long cno);
    List<Integer> getSeatList(String t_time);
    String isExistsTicketInfo(String t_time, int sno, String m_title);
    List<Integer> getReservedSeats(String t_time, String m_title);
    // 예매 총 갯수
 	int countBoard();
 	// 페이징 처리 예매 조회
 	List<MovieVO> selectBoard(PagingVO vo);
}
