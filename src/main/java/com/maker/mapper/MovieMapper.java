package com.maker.mapper;

import java.util.List;

import com.maker.domain.MovieVO;

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
}
