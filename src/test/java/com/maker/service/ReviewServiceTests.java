package com.maker.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.maker.domain.ReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewServiceTests {
	@Autowired
	private ReviewService svc;
	
	@Test
	public void rvReg() {
		ReviewVO review = new ReviewVO(
				"test1", "아이들이 보기 그래요.",
				3, 8L, 1L);
		svc.register(review);
	}
}
