package com.favccxx.favshake.dao;

import com.favccxx.favshake.entity.UserEnvelop;

public interface IUserEnvelopRepository {

	public void saveUserEnvelop(UserEnvelop userEnvelop);
	
	public boolean hasCashedToday(String account);
	
}
