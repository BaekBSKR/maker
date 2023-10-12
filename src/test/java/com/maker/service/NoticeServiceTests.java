package com.maker.service;

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
public class NoticeServiceTests {
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 등록 테스트
	@Test
	public void noticeEnroll() {
		NoticeVO notice = new NoticeVO();
		
		notice.setN_title("공지3");
		notice.setN_comment("02일 부로...");
		notice.setCno(3);
		
		noticeService.noticeEnroll(notice);
		
	}
	
	// 공지사항 목록 테스트
	@Test
	public void noticeGetList() {
		Criteria cri = new Criteria();
		cri.setKeyword("공지");
		
		List<NoticeVO> list = noticeService.noticeGetList(cri);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list: " + i + ".........." + list.get(i));
		}
	}
	
	// 공지사항 개수 테스트
	@Test
	public void noticeGetTotal() {
		Criteria cri = new Criteria();
		cri.setKeyword("공지");
		
		int total = noticeService.noticeGetTotal(cri);
		
		System.out.println("total............." + total);
	}
	
	// 공지사항 상세 테스트
	@Test
	public void noticeGetDetail() {
		int nno = 30;
		NoticeVO notice = noticeService.noticeGetDetail(nno);
			
		System.out.println("notice..........." + notice);
	}
	
	// 공지사항 수정 테스트
	@Test
	public void noticeModify() {
		NoticeVO notice = new NoticeVO();
		
		notice.setNno(110);
		System.out.println("(service)수정 전..................." + noticeService.noticeGetDetail(notice.getNno()));
		
		notice.setN_title("수정2");
		notice.setN_comment("수정일2...");
		
		noticeService.noticeModify(notice);
		System.out.println("(service)수정 후..................." + noticeService.noticeGetDetail(notice.getNno()));
	}
	
}
