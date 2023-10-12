package com.maker.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TicketMapperTests {
	@Autowired
	private TicketMapper mapper;

	@Test
	public void test1() {
		mapper.ticketCheck("2023/10/20/18:00", 1, 1);
	}
	@Test
	public void testList() {
		mapper.getReservedSeatsList("2023/10/11/12:00", 4);
	}
}
