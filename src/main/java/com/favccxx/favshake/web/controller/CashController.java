package com.favccxx.favshake.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.favccxx.favshake.entity.UserEnvelop;
import com.favccxx.favshake.service.UserEnvelopService;

@Controller
public class CashController {
	
	@Autowired
	UserEnvelopService userEnvelopService;

	@RequestMapping("/initReceiveCash")
	public ModelAndView initReceiveCash(String redEnvelopValue) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("envelope/CashEnvelope");
		mav.addObject("redEnvelopValue", redEnvelopValue);
		return mav;
	}
	
	@RequestMapping("/receiveCash")
	@ResponseBody
	public String receiveCash(String alipayAccount, String cashValue){
		//再次校验帐号的合法性
		if(StringUtils.isEmpty(alipayAccount) || StringUtils.isEmpty(cashValue)){
			return "0";
		}
		//校验今天是否已领取
		boolean flag = userEnvelopService.hasCashedToday(alipayAccount);
		if(flag){
			return "1";
		}
		
		UserEnvelop userEnvelop = new UserEnvelop();
		userEnvelop.setEnvelopType("CASH");
		userEnvelop.setUserAccount(alipayAccount);
		userEnvelop.setEnvelopValue(cashValue);
		userEnvelop.setIsReceived(1);
		userEnvelopService.saveUserEnvelop(userEnvelop);
		return "2";
	}
}
