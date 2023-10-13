package com.maker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maker.domain.ReviewVO;
import com.maker.mapper.MovieMapper;
import com.maker.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Service
@ToString
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private MovieMapper movieMapper;
	@Override
	public void register(ReviewVO review) {
		Long mno = review.getMno();
		reviewMapper.insert(review);
		movieMapper.countStar(mno);
		float m_star = movieMapper.findStar(mno);
		movieMapper.updateStar(m_star, mno);
	}
	
}
