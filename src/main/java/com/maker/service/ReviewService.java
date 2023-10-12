package com.maker.service;

import java.util.List;

import com.maker.domain.PagingVO;
import com.maker.domain.ReviewVO;

public interface ReviewService {
	public void register(ReviewVO review);
	public List<ReviewVO> getList(Long mno);
	// 게시물 총 갯수
	public int getCnt(Long mno);
	// 페이징 처리 게시글 조회
	List<ReviewVO> selectBoard(PagingVO vo, Long mno);
}
