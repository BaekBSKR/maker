package com.movie.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.movie.domain.CustomerVO;

import lombok.extern.log4j.Log4j;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CustomerMapperTests {
	@Autowired
	private CustomerMapper customerMapper;
	
	// 회원가입
	@Test
	public void testInsert() {
		CustomerVO customer = new CustomerVO();
				
		customer.setC_id("moo");
		customer.setC_pwd("2222");
		customer.setC_nick("사용자3");
		customer.setC_mail("zxcv@naver.com");
		customer.setC_birth("");
			
		customerMapper.customerJoin(customer);
			
	}
	
}
