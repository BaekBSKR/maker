package com.maker.service;

import java.util.List;

import com.maker.vo.MovieVO;

public interface MovieService {
	void register(MovieVO movie);
	MovieVO get(String m_title);
	boolean modify(MovieVO movie);
	int remove(String m_title);
	List<MovieVO> getList();
	int findByTitle(String m_title);
}
