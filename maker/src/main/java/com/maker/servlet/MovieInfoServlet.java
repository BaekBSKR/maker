package com.maker.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.maker.service.MovieService;
import com.maker.service.TicketService;

@Component
public class MovieInfoServlet extends HttpServlet {
	private MovieService mSvc;
	private TicketService tSvc;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 영화 ID를 받아옵니다.
        String m_title = request.getParameter("m_title");
        String dateTime = request.getParameter("date");
        System.out.println(m_title + dateTime);
        String m_time = mSvc.getMovieTimeByTitle(m_title); // 상영 시작 시간
        String t_time = dateTime + m_time;// 예약 시간 정보
        List<Integer> bookedSeats = tSvc.getSeatList(t_time); // 예매된 좌석 목록

        // 응답을 JSON 형태로 작성
        JSONObject responseJson = new JSONObject();
        responseJson.put("m_time", m_time);
        responseJson.put("bookedSeats", bookedSeats);

        // 응답을 클라이언트로 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(responseJson.toString());
    }
}