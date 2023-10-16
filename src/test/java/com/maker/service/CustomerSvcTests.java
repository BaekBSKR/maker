package com.maker.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.maker.domain.CustomerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerSvcTests {
	@Autowired
	private CustomerService customerSvc;
	
	@Test
	public void customerReg() {
		for(int i = 0; i <= 200; i ++) {
			CustomerVO vo = new CustomerVO();
			vo.setC_id("id" + i);
			vo.setC_mail("mail"+i+"@mail.com");
			vo.setC_nick("고객"+i);
			vo.setC_pwd("password"+i);
			vo.setC_birth("000"+i);
			customerSvc.customerJoin(vo);
		}
		
	}
}
