package com.maker.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import com.maker.domain.MovieVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MovieSvcTest {
	@Autowired
	private MovieService svc;
	@Autowired
	private MovieServiceImpl svcImp;
	@Test
	public void testList() {
		int cnt1 = svc.findByTitle("식, 타악");
		System.out.println(cnt1);
		int cnt2 = svcImp.findByTitle("식, 타악");
		System.out.println(cnt2);
	}
	
	@Test
	public void testReg() {
		Model model = null;
		List<MovieVO> movies = svc.getList();
        model.addAttribute("movies", movies);
	}
	
	@Test
	public void testString() {
		System.out.println(svc.getMovieTimeByTitle(" 가메라2: 레기온 내습"));
	}
}
