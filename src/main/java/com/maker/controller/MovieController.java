package com.maker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maker.service.MovieService;
import com.maker.vo.MovieVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/movie/*")
//@Log4j
public class MovieController {
	@Autowired
	private MovieService mSvc;
	
	@GetMapping("/movielist")
	public void movielist(Model model) {
		List<MovieVO> movies = mSvc.getview();
		model.addAttribute("movies", movies);
	}

	@GetMapping("/movieinfo")
	public void movieinfo(@RequestParam("m_title") String m_title, Model model) throws Exception {
		List<MovieVO> vo = mSvc.readview(m_title);
		model.addAttribute("movies", vo);
	}
}
