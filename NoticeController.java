package com.maker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maker.domain.Criteria;
import com.maker.domain.NoticeVO;
import com.maker.domain.PageDTO;
import com.maker.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@RequiredArgsConstructor
@RequestMapping("/notice/*")
@Log4j
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록 페이지 접속
	@RequestMapping(value = "noticeManage", method = RequestMethod.GET)
	public void noticeManageGet(Criteria cri, Model model) {
		log.info("공지사항 목록 페이지 이동");
		
		List list = noticeService.noticeGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);	// 작가 데이터가 있을 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 데이터가 없을 경우
		}
		
		// 페이지 이동 인터페이스 데이터 
        int total = noticeService.noticeGetTotal(cri);
        PageDTO pageMaker = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMaker);
	}
	
	// 공지사항 상세 페이지 
    @GetMapping({"/noticeDetail", "/noticeModify"})
	public void noticeGetInfoGET(long nno, Criteria cri, Model model) {
		//log.info("noticeDetail......." + notice);
		
		// 공지사항 페이지 정보
		model.addAttribute("cri", cri);
		
		// 선택 공지사항 정보
		model.addAttribute("noticeInfo", noticeService.noticeGetDetail(nno));
		
	}
    
    // 공지사항 수정 
 	@PostMapping("/noticeModify")
 	public String noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
 		log.info("noticeModifyPOST......." + notice);
 		
 		int result = noticeService.noticeModify(notice);
 		rttr.addFlashAttribute("modify_result", result);
 		
 		return "redirect:/notice/noticeManage";
 		
 	}
 	
 	// 공지사항 삭제
 	@PostMapping("/noticeDelete")
 	public String noticeDeletePOST(long nno, RedirectAttributes rttr) {
 		log.info("noticeDeletePOST..........");
 		long result = 0;
 		
 		try {
 			result = noticeService.noticeDelete(nno);
 		} catch (Exception e) {
 			e.printStackTrace();
 			result = 2;
 			rttr.addFlashAttribute("delete_result", result);
 	
 			return "redirect:/notice/noticeManage";
 			
 		}
 		
 		rttr.addFlashAttribute("delete_result", result);
 		
 		return "redirect:/notice/noticeManage";
 		
 	}
	
	// 공지사항 등록 페이지 접속
	@RequestMapping(value = "noticeEnroll", method = RequestMethod.GET)
	public void noticeEnrollGet() {
		log.info("공지사항 등록 페이지 이동");
		
	}
	
	// 공지사항 등록 
    @RequestMapping(value="noticeEnroll.do", method = RequestMethod.POST)
    public String noticeEnrollPOST(NoticeVO notice, RedirectAttributes rttr) {
        log.info("noticeEnroll :" +  notice);
        
        noticeService.noticeEnroll(notice);
        rttr.addFlashAttribute("enroll_result", notice.getN_title());
        
        return "redirect:/notice/noticeManage";
        
    }
    
}
