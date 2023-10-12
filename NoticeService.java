package com.maker.service;

import java.util.List;

import com.maker.domain.Criteria;
import com.maker.domain.NoticeVO;

public interface NoticeService {
	// 공지사항 등록
	public void noticeEnroll(NoticeVO notice);
	
	// 공지사항 목록
	public List<NoticeVO> noticeGetList(Criteria cri);
	
	// 공지사항 개수
	public int noticeGetTotal(Criteria cri);
	
	// 공지사항 상세
	public NoticeVO noticeGetDetail(long nno);
	
	// 공지사항 수정
	public int noticeModify(NoticeVO notice);
	
	// 공지사항 삭제
	public long noticeDelete(long nno);
	
}
