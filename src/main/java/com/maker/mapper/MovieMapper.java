package com.maker.mapper;

import java.util.List;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;

public interface MovieMapper {
	public List<MovieVO> getList();
	public MovieVO read(String m_title);
	public void insert(MovieVO movie);
	public int delete(String m_title);
	public int update(MovieVO movie);
	public int findByTitle(String m_title);
	public String getMovieTimeByTitle(String m_title);
	public List<MovieVO> getview();
	public List<MovieVO> readview(String m_title);
	public List<MovieVO> lastview();
	public int findMnoByTitle(String m_title);
	// 게시물 총 갯수
	public int countBoard();
	// 페이징 처리 게시글 조회
	public List<MovieVO> selectBoard(PagingVO vo);
}
