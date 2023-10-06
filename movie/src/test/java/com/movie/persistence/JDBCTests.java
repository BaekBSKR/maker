package com.movie.persistence;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class JDBCTests {
	
	@Test
	public void testConnection() throws SQLException{
		Connection conn = null;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "movie_project";
			String password = "1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			log.info(conn);
			log.info("데이터베이서 연결이 성공했습니다.");
		} catch (Exception e) {
			log.info("데이터베이스 연결이 실패했습니다.<br>");
			log.info("SQLException: " + e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
		}
		
	}
}
