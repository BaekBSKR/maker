package com.maker.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TicketSvcTests {
	
	@Autowired
	private TicketService tSvc;
	
	@Test
	public void test1() {
		System.out.println(tSvc.isExistsTicketInfo("2023/10/10/18:00", 1));
	}
}
