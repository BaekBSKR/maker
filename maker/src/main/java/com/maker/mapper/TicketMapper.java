package com.maker.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
import com.maker.domain.TicketVO;

public interface TicketMapper {
    List<TicketVO> getList(Long cno);
    TicketVO read(Long tno);
    void insert(TicketVO ticket);
    int delete(Long tno);
    int update(Long tno);
    int ticketCheck(
    		@Param("t_time")String t_time,
    		@Param("sno")int sno,
    		@Param("mno")int mno);
    List<Integer> getSeatList(String t_time);
    List<Integer> getReservedSeatsList(
    		@Param("t_time")String t_time,
            @Param("mno")int mno);
    // 예매 총 갯수
 	public int countBoard();
 	// 페이징 처리 예매 조회
 	public List<MovieVO> selectBoard(PagingVO vo);
}
