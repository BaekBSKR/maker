package com.maker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maker.domain.MovieVO;
import com.maker.domain.PagingVO;
import com.maker.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/movie/*")
@Log4j
public class MovieController {
	@Autowired
	private MovieService mSvc;
	
	@GetMapping("/movielist")
	public void movielist(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = mSvc.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<MovieVO> movies = mSvc.getview();

		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", mSvc.selectBoard(vo));
		model.addAttribute("movies", movies);
	}

	@GetMapping("/movieinfo")
	public void movieinfo(@RequestParam("m_title") String m_title, Model model) throws Exception {
		List<MovieVO> vo = mSvc.readview(m_title);
		model.addAttribute("movies", vo);
	}
}
