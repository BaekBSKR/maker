package com.maker.mapper;

import java.util.List;

import com.maker.domain.Criteria;
import com.maker.domain.NoticeVO;

public interface NoticeMapper {
	public void noticeEnroll(NoticeVO notice);              // 곻지사항 등록
	public List<NoticeVO> noticeGetList(Criteria cri);      // 공지사항 목록
	public int noticeGetTotal(Criteria cri);                // 공지사항 개수
	public NoticeVO noticeGetDetail(long nno);              // 공지사항 상세
	public int noticeModify(NoticeVO notice);               // 공지사항 수정
	public long noticeDelete(long nno);                     // 공지사항 삭제
	
}
