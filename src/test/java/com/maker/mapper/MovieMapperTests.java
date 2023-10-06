package com.maker.mapper;

import com.maker.mapper.MovieMapper;
import com.maker.vo.MovieVO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MovieMapperTests {
	@Autowired
	private MovieMapper mapper;
	
	@Test
	public void testModify() {
		MovieVO movie = new MovieVO(" 기억의 밤", "2");
		mapper.update(movie);
		
	}
	@Test
	public void testTime() {
		mapper.getMovieTimeByTitle(" 성난 얼굴로 돌아보라");
	}
}
