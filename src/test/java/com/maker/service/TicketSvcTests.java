package com.maker.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.maker.domain.TicketVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TicketSvcTests {
	
	@Autowired
	private TicketService tSvc;
	@Autowired
	private MovieService mSvc;
	
	@Test
	public void test1() {
		System.out.println(tSvc.isExistsTicketInfo("2023/10/10/18:00", 1, " "));
	}
	@Test
	public void test2() {
		System.out.println(tSvc.getReservedSeats("", " 아빠닭").toString());
	}
	@Test
	public void test3() {
//		TicketVO ticekt = new TicketVO(
//			    "2023/10/10/18:00", 10000, 5,
//			    Long.valueOf(mSvc.findByTitle(" 아빠닭")),
//			    Long.valueOf(1)
//			);
//		tSvc.register(ticekt);
		System.out.println(mSvc.findMnoByTitle(" 아빠닭"));
	}
	@Test
	public void test4() {
		System.out.println(tSvc.getReservedSeats("2023/10/10/12:00", " 아빠닭").toString());
	}
}
