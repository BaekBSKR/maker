package com.maker.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.maker.domain.Criteria;
import com.maker.domain.NoticeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	@Autowired
	private NoticeMapper noticeMapper;
	
	
	// 공지사항 등록 테스트
	@Test
	public void noticeEnroll() {
		NoticeVO notice = new NoticeVO();
		
		notice.setN_title("공지2");
		notice.setN_comment("01일 부로...");
		notice.setCno(2);
		
		noticeMapper.noticeEnroll(notice);
		
	}
	
	// 공지사항 목록 테스트
	@Test
	public void noticeGetList() {
		Criteria cri = new Criteria();
		cri.setKeyword("공지");
		
		List<NoticeVO> list = noticeMapper.noticeGetList(cri);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list: " + i + ".........." + list.get(i));
		}
	}
	
	// 공지사항 개수 테스트
	@Test
	public void noticeGetTotal() {
		Criteria cri = new Criteria();
		cri.setKeyword("공지");
		
		int total = noticeMapper.noticeGetTotal(cri);
		
		System.out.println("total.........." + total);
	}
	
	// 공지사항 상세 테스트
	@Test
	public void noticeGetDetail() {
		int nno = 30;
		NoticeVO notice = noticeMapper.noticeGetDetail(nno);
		
		System.out.println("notice..........." + notice);
	}
	
	// 공지사항 수정 테스트
	@Test
	public void noticeModify() {
		NoticeVO notice = new NoticeVO();
		
		notice.setNno(111);
		System.out.println("수정 전..................." + noticeMapper.noticeGetDetail(notice.getNno()));
		
		notice.setN_title("수정");
		notice.setN_comment("수정일1...");
		
		noticeMapper.noticeModify(notice);
		System.out.println("수정 후..................." + noticeMapper.noticeGetDetail(notice.getNno()));
	}
	
	// 공지사항 삭제 테스트
	@Test
	public void noticeDelete() {
		long nno = 114;
		long result = noticeMapper.noticeDelete(nno);
		
		if (result == 1) {
			System.out.println("삭제 성공");
		}
	}
	
}
