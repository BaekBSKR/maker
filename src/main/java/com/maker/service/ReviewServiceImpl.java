package com.maker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
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
		
		int m_starCnt = movieMapper.countStar(mno);
		if(m_starCnt < 1) {
			movieMapper.updateStar(review.getR_star(), mno);
			reviewMapper.insert(review);
		} else {
			float m_star = movieMapper.findStar(mno);
			m_star = (m_star * m_starCnt)/(m_starCnt + 1);
			movieMapper.updateStar(m_star, mno);
			reviewMapper.insert(review);
		}
		
	}
	@Override
	public List<ReviewVO> getList(Long mno){
		return reviewMapper.getList(mno);
	}
	@Override
	public int getCnt(Long mno) {
		return reviewMapper.countReview(mno);
	}
	@Override
	public List<ReviewVO> selectBoard(PagingVO vo, Long mno) {
		return reviewMapper.selectBoard(vo, mno, vo.getStart(), vo.getEnd());
	}
}
