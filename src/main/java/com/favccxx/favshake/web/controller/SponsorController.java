package com.favccxx.favshake.web.controller;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.favccxx.favshake.entity.BlessWords;
import com.favccxx.favshake.entity.Coupons;
import com.favccxx.favshake.entity.Sponsor;
import com.favccxx.favshake.service.BlessWordsService;
import com.favccxx.favshake.service.CouponsService;
import com.favccxx.favshake.service.SponsorService;

@Controller
@RequestMapping("/sponsor")
public class SponsorController {

	@Autowired
	BlessWordsService blessWordsService;
	@Autowired
	CouponsService couponsService;
	@Autowired
	SponsorService sponsorService;
	
	@RequestMapping("/initSponsor")
	public ModelAndView initSponsor(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sponsor/sponsor_add");
		return mav;
	}
	

	@RequestMapping("/addBless")
	@ResponseBody
	public String addBless(String sponsorName, String sponsorEmail, String sponsorBless,String blessType){
		BlessWords blessWords = new BlessWords();
		blessWords.setBlessId(new ObjectId().toString());
		blessWords.setBlessType(blessType);
		blessWords.setBlessContent(sponsorBless);
		blessWords.setCreateUserName(sponsorName);
		blessWords.setCreateUserEmail(sponsorEmail);
		blessWords.setCreateDate(new Date());
		blessWordsService.saveBlessWords(blessWords);
		return "SUCCESS";
	}
	
	@RequestMapping("/addCoupons")
	@ResponseBody
	public String addCoupons(String sponsorName, String sponsorEmail, String couponsName, String couponsURL){
		Coupons coupons = new Coupons();
		coupons.setCouponsId(new ObjectId().toString());
		coupons.setCouponsName(couponsName);
		coupons.setCouponsURL(couponsURL);
		coupons.setCouponsStatus(1);
		coupons.setCreateUserName(sponsorName);
		coupons.setCreateUserEmail(sponsorEmail);
		coupons.setCreateDate(new Date());
		couponsService.saveCoupons(coupons);
		return "SUCCESS";
	}
	
	
	@RequestMapping("/addSponsorCash")
	@ResponseBody
	public String addSponsorCash(String sponsorName, String sponsorEmail, String cashNum){
		Sponsor sponsor = new Sponsor();
		sponsor.setSponsorId(new ObjectId().toString());
		sponsor.setSponsorName(sponsorName);
		sponsor.setSponsorEmail(sponsorEmail);
		sponsor.setSponsorType("CASH");
		sponsor.setSponsorCash(cashNum);
		sponsorService.saveSponsor(sponsor);
		return "SUCCESS";
	}
}
