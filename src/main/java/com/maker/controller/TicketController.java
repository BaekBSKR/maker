package com.maker.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.maker.domain.CustomerVO;
import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
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
	
	//예매 목록
    @GetMapping("/ticketList")
    public void ticketList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
                          @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
                          HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	CustomerVO customer = (CustomerVO) session.getAttribute("customer");
    	Long cno = customer.getCno();
    	
    	//ticket서비스에 생성
        int total = tSvc.countBoard(cno);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        
        List<TicketVO> tickets = tSvc.getList(cno);

        model.addAttribute("paging", vo);
        model.addAttribute("viewAll", tSvc.selectBoard(vo, cno));
        model.addAttribute("tickets", tickets);
    }

    //예매 영화 목록
    @GetMapping("/ticketBooking")
    public void showTicketForm(Model model) {
        List<MovieVO> movies = mSvc.getList();
        model.addAttribute("movies", movies);
    }
    
    //좌석 예매 확인
    @ResponseBody
    @GetMapping("/ticketChk")
    public String ticketChk(@RequestParam String t_time, 
    		@RequestParam int sno,
    		@RequestParam String m_title) {
    	return tSvc.isExistsTicketInfo(t_time, sno, m_title);
    }
    
    //자동 좌석 예매 확인
    @ResponseBody
    @GetMapping("/seatChk")
    public ResponseEntity<List<Integer>>  seatChk(
    		@RequestParam String t_time, 
    		@RequestParam String m_title) {
    	System.out.println(t_time);
        List<Integer> reservedSeats = tSvc.getReservedSeats(t_time, m_title);
        System.out.println(reservedSeats.toString());
        // 예약된 좌석 목록을 반환
        return ResponseEntity.ok(reservedSeats);
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
            @RequestParam("cno") int cno,
            @RequestParam("t_time") String t_time,
            @RequestParam("m_title") String m_title) {
        
        tSvc.register(new TicketVO(
                t_time, 10000, sno,
                Long.valueOf(mSvc.findMnoByTitle(m_title)),
                Long.valueOf(cno)
        ));
        System.out.println("예약완료");
        return "redirect:/movie/movielist";
    }
}