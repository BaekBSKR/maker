package com.maker.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maker.domain.MovieVO;
import com.maker.domain.TicketVO;
import com.maker.service.MovieService;
import com.maker.service.TicketService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ticket/*")
public class TicketController {
	@Autowired
	private MovieService mSvc;
	@Autowired
	private TicketService tSvc;
	
	//예약 목록
    @GetMapping("/ticketList")
    public void ticketList() {
//    	List<TicketVO> tickets = tSvc.getList();
//        model.addAttribute("tickets", tickets);
    }
    //예매 영화 목록
    @GetMapping("/ticketBooking")
    public void showTicketForm(Model model) {
        List<MovieVO> movies = mSvc.getList();
        model.addAttribute("movies", movies);
    }
//    //좌석 예매 확인
//    @ResponseBody
//    @PostMapping("/seatCheck")
//    public String  getMovieTime(@RequestBody Map<String, String> requestData) {
//    	String t_time = requestData.get("t_time");
//    	String snoString = requestData.get("sno");
//    	String m_title = requestData.get("m_title");
//    	// sno를 정수(int)로 변환
//    	int sno = Integer.parseInt(snoString);
//    	
//    	if() {
//    		return "true";
//    	} else {
//    		return "false";
//    	}
//    	
//        
//    }
    //좌석 예매 확인
    @ResponseBody
    @GetMapping("/ticketChk")
    public String ticketChk(@RequestParam String t_time, 
    		@RequestParam int sno,
    		@RequestParam String m_title) {
    	
    	return tSvc.isExistsTicketInfo(t_time, sno, m_title);
    }
    
    @ResponseBody
    @GetMapping("/timeChk")
    public String timeChk(@RequestParam String m_title) {
    	return mSvc.getMovieTimeByTitle(m_title);
    }
    //예매 등록
    @PostMapping("/ticketSave")
    public String getMovieTime(
        @RequestParam("sno") int sno,
        @RequestParam("t_time") String t_time,
        @RequestParam("m_title") String m_title) {
    	System.out.println(t_time);
        System.out.println(sno);
        System.out.println(m_title);
//        TicketVO ticket = new TicketVO();
//        
//        tSvc.register(ticket);
        System.out.println("예약완료");
        return "redirect:/ticket/ticketList";
    }
    
}
