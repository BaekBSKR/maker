package com.maker.service;

import com.maker.domain.CustomerVO;

public interface CustomerService {
	// 회원가입
	public void customerJoin(CustomerVO customer);
		
	// 아이디 중복 검사
	public int idCheck(String customerId);
		
	//로그인
	public CustomerVO customerLogin(CustomerVO customer);
	
}
