package com.favccxx.favshake.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/a")
	public String A() {
		return "a";
	}
	
	@RequestMapping("/superPhotos")
	public String superPhotos(){
		return "envelope/SuperPhotosEnvelop";
	}
	
	@RequestMapping("/shake")
	public String shake(){
		return "shake";
	}

	@RequestMapping("/pcShake")
	public String pcShake(){
		return "pcShake";
	}
}
