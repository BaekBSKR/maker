package com.maker.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.maker.domain.PagingVO;
import com.maker.domain.ReviewVO;

public interface ReviewMapper {
	public List<ReviewVO> getList(Long mno);
	public ReviewVO read();
	public void insert(ReviewVO review);
	public int delete(String m_title);
	public int update(ReviewVO review);
	public List<ReviewVO> getview();
	public List<ReviewVO> readview(Long mno);
	public List<ReviewVO> lastview();
	// 게시물 총 갯수
	public int countReview(Long mno);
	// 페이징 처리 게시글 조회
	public List<ReviewVO> selectBoard(
			@Param("PageVO")PagingVO vo,
			@Param("mno")Long mno,
			@Param("start")int start,
			@Param("end")int end);
	public float sumStar(Long mno);
}
