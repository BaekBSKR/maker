package com.maker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.maker.domain.CustomerVO;
import com.maker.service.CustomerService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/customer")
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
		
		// 회원가입 서비스 실행
		customerService.customerJoin(customer);
		log.info("join Service 성공");
		
		return "redirect:/customer/main";
	}
		
	
	
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
		log.info("로그인 페이지 진입");
			
	}
	
}
