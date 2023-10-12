package com.maker.service;

import java.util.List;

import com.maker.domain.Criteria;
import com.maker.domain.CustomerVO;

public interface CustomerService {
	// 회원가입
	public void customerJoin(CustomerVO customer);
		
	// 아이디 중복 검사
	public int idCheck(String customerId);
		
	//로그인
	public CustomerVO customerLogin(CustomerVO customer);
	
	// 고객번호 검색
    public List<CustomerVO> customerGetList(Criteria cri);
    
    // 고객 총 합
    public int customerGetTotal(Criteria cri);
}
