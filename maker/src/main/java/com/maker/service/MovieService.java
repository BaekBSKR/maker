package com.maker.service;

import java.util.List;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;

public interface MovieService {
	void register(MovieVO movie);
	MovieVO get(String m_title);
	boolean modify(MovieVO movie);
	int remove(String m_title);
	List<MovieVO> getList();
	int findByTitle(String m_title);
	String getMovieTimeByTitle(String m_title);
	List<MovieVO> getview();
	List<MovieVO> readview(String m_title);
	List<MovieVO> lastview();
	// 게시물 총 갯수
	int countBoard();
	// 페이징 처리 게시글 조회
	List<MovieVO> selectBoard(PagingVO vo);
	int findMnoByTitle(String m_title);
}