package com.favccxx.favshake.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.favccxx.favshake.dao.IUserEnvelopRepository;
import com.favccxx.favshake.entity.UserEnvelop;

@Service
public class UserEnvelopService {

	@Autowired
	IUserEnvelopRepository userEnvelopRepo;
	
	public void saveUserEnvelop(UserEnvelop userEnvelop){
		userEnvelopRepo.saveUserEnvelop(userEnvelop);
	}
	
	
	public boolean hasCashedToday(String account){
		boolean flag = false;
		flag = userEnvelopRepo.hasCashedToday(account);
		return flag;
	}
	
}
