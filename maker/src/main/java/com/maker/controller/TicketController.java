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

    @GetMapping("/ticketList")
    public void ticketList(Model model) {
    	List<TicketVO> tickets = tSvc.getList();
        model.addAttribute("tickets", tickets);
    }
    @GetMapping("/ticketBooking")
    public void showTicketForm(Model model) {
        List<MovieVO> movies = mSvc.getList();
        model.addAttribute("movies", movies);
    }

    @PostMapping("/ticketSave")
    public String getMovieTime(@RequestParam String t_time,
    		@RequestParam int sno, @RequestParam String m_title) {
        
        return "/ticketList";
    }
    @ResponseBody
    @GetMapping("/ticketChk")
    public String ticketChk(@RequestParam String t_time, 
    		@RequestParam int sno) {
    	return tSvc.isExistsTicketInfo(t_time, sno);
    }
    @ResponseBody
    @GetMapping("/timeChk")
    public String timeChk(@RequestParam String m_title) {
    	return mSvc.getMovieTimeByTitle(m_title);
    }
}
