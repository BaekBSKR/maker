package com.maker.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maker.domain.Criteria;
import com.maker.domain.CustomerVO;
import com.maker.domain.PageDTO;
import com.maker.service.CustomerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/customer/*")
@Log4j
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	//로그인 메인 페이지
	@GetMapping(value="main")
	public void mainLogin() {
		log.info("로그인 메인화면");
	}
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {	
		log.info("회원가입 페이지 진입");	
		
	}
	
	//회원가입
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPOST(CustomerVO customer, RedirectAttributes rttr) {
		log.info("join 진입");
		int result = 0;
		
		// 회원가입 서비스 실행
		customerService.customerJoin(customer);
		rttr.addFlashAttribute("register_result", result);
		log.info("join Service 성공");
		
		return "redirect:/customer/main";
	}
		
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
		log.info("로그인 페이지 진입");
		
	}
	
	//아이디 중복 검사
	@RequestMapping(value = "/customerIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String customerIdChkPost(String customerId) {
		// log.info("customerIdChk() 진입");
		int result = customerService.idCheck(customerId);
		log.info("결과값: " + result);
			
		if (result != 0) {
			return "fail";     // 가입한 아이디가 있음
		}else if (customerId == "") {
			result = 2;
			return "no";
		}else {
			return "success";  // 가입한 아이디가 없음
		}
	}
	
	// 로그인
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, CustomerVO customer, RedirectAttributes rttr) throws Exception{
        
        log.info("login 메서드 진입");
        log.info("전달된 데이터 : " + customer);
    	
    	HttpSession session = request.getSession();
    	CustomerVO lvo = customerService.customerLogin(customer);
    	
    	
    	if (lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/customer/login";
        }
        
        session.setAttribute("customer", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:../customer/main";

    }
    
    // 로그아웃
    @RequestMapping(value = "logout.do", method = RequestMethod.POST)
    @ResponseBody
    public String logoutPOST(HttpServletRequest request) {
        log.info("logoutPOST 메소드 실행");
        
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "redirect:../customer/main";
        
    }
    
    // 고객번호 검색 팝업창 
 	@GetMapping("/customerPop")
 	public void customerPopGET(Criteria cri, Model model) {
 		log.info("customerPopGET.......");
 		
 		cri.setAmount(5);
 		
 		// 게시물 출력 데이터 
 		List list = customerService.customerGetList(cri);
 		
 		if(!list.isEmpty()) {
 			model.addAttribute("list",list);	// 작가 존재 경우
 		} else {
 			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
 		}
 		
 		
 		// 페이지 이동 인터페이스 데이터 
 		model.addAttribute("pageMaker", new PageDTO(cri, customerService.customerGetTotal(cri)));
 	}
	
}
