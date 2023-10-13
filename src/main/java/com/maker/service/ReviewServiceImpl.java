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
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Service
@ToString
@Log4j
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private MovieMapper movieMapper;
	@Override
	public void register(ReviewVO review) {
		Long mno = review.getMno();
		log.info("영화 넘버 : " + mno);
		int m_starCnt = reviewMapper.countReview(mno);
		float m_star = reviewMapper.sumStar(mno);
		log.info("변화 전 평점(평점 합) : " + m_star);
		log.info("영화 현재 평점 개수 : " + m_starCnt);
		if(m_starCnt < 1) {
			log.info("리뷰가 없음");
			movieMapper.updateStar(review.getR_star(), mno);
			reviewMapper.insert(review);
		} else {
			log.info("리뷰가 있음");
			m_star = ((m_star+review.getR_star()))
					/(m_starCnt + 1);
			log.info("평점 계산 : " + m_star);
			m_star = Math.round(m_star*100F)/100F;
			log.info("평점 처리 : " + m_star);
			movieMapper.updateStar(m_star, mno);
			reviewMapper.insert(review);
			log.info("변화 후 평점 : " + m_star);
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
