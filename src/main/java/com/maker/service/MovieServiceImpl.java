package com.maker.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.maker.mapper.MovieMapper;
import com.maker.vo.MovieVO;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Service
@ToString
public class MovieServiceImpl implements MovieService {
	private final MovieMapper mapper;
	@Transactional
	@Override
	public void register(MovieVO movie) {
		if(mapper.findByTitle(movie.getM_title())==0) {
			mapper.insert(movie);
		} else {
			System.out.println("이미 존재하는 영화 정보입니다");
		}
	}

	@Override
	public MovieVO get(String m_title) {
		// TODO Auto-generated method stub
		return mapper.read(m_title);
	}

	@Override
	public int remove(String m_title) {
		// TODO Auto-generated method stub
		return mapper.delete(m_title);
	}

	@Override
	public List<MovieVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public boolean modify(MovieVO movie) {
		boolean modifyResult = mapper.update(movie) == 1;
		return modifyResult;
	}

	@Override
	public int findByTitle(String m_title) {
		return mapper.findByTitle(m_title);
	}
}
