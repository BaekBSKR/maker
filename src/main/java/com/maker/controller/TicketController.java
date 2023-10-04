package com.maker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.maker.service.MovieService;
import com.maker.service.TicketService;
import com.maker.vo.MovieVO;
import com.maker.vo.TicketVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ticket/*")
public class TicketController {
	@Autowired
	private MovieService mSvc;
//	@Autowired
//	private TicketService tSvc;
	
//	@GetMapping("/form")
//    public String showTicketForm(Model model) {
//        // 필요한 로직 수행 후 JSP 페이지 이름 반환
//        return "ticketForm";
//    }
//
//    @PostMapping("/save")
//    public String saveTicket(@ModelAttribute TicketVO ticket) {
//        // 날짜와 시간을 'yyyyMMddHHmm' 형식으로 받아와서 TicketVO 객체에 설정
//        // 예매 정보를 저장하는 서비스 메서드 호출
//    	tSvc.register(ticket);
//        // 예매 성공 페이지로 리다이렉트 또는 다른 처리 수행
//        return "redirect:/ticket/success";
//    }
//
//    @GetMapping("/list")
//    public String showAllTickets(Model model) {
//        // 모든 예매 정보를 가져오는 서비스 메서드 호출
//        List<TicketVO> tickets = tSvc.getList();
//        // 모델에 예매 정보를 추가
//        model.addAttribute("tickets", tickets);
//        // 예매 목록을 보여주는 JSP 페이지 이름 반환
//        return "ticketList";
//    }
//	
//	
//    @GetMapping
//    public void TicketBooking(@RequestBody TicketVO ticket){
//    	tSvc.register(ticket);
//    }
//    @PostMapping("/ticketList")
//    public void ticketCheck(){
//    	tSvc.getList();
//    }
//    @GetMapping("/ticketBooking")
//    public void ticektBooking() {
//    	
//    }
    @GetMapping("/ticketList")
    public void ticketList() {
    	
    }
    @GetMapping("/ticketBooking")
    public void showTicketForm(Model model) {
        List<MovieVO> movies = mSvc.getList();
        model.addAttribute("movies", movies);
    }
    @GetMapping("/copyPage")
    public void copyPage() {
    }
    @GetMapping("/ticketForm")
    public void ticketForm() {
    }
}
