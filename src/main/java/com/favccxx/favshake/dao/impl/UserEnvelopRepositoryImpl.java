package com.favccxx.favshake.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.favccxx.favshake.dao.IUserEnvelopRepository;
import com.favccxx.favshake.entity.UserEnvelop;

@Repository
public class UserEnvelopRepositoryImpl implements IUserEnvelopRepository {

	@Autowired
	MongoTemplate mongoTemplate;
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	public void saveUserEnvelop(UserEnvelop userEnvelop) {
		userEnvelop.setCreateDate(new Date());
		mongoTemplate.save(userEnvelop);
	}

	@SuppressWarnings("static-access")
	public boolean hasCashedToday(String account) {
		Query query = new Query();	
		Criteria criteria = new Criteria();
		criteria.and("userAccount").is(account);	
		Calendar calendar = Calendar.getInstance(); 
		calendar.set(Calendar.HOUR_OF_DAY, 0); 
		calendar.set(Calendar.HOUR,0);
		calendar.set(Calendar.MINUTE,0);
		calendar.set(Calendar.SECOND,0);
		Date startDate = calendar.getTime();
		calendar.set(Calendar.HOUR,23);
		calendar.set(Calendar.MINUTE,59);
		calendar.set(Calendar.SECOND,59);
		Date endDate = calendar.getTime();
		criteria.where("createDate").gte(startDate).lte(endDate); 
		query.addCriteria(criteria);
		UserEnvelop userEnvelop = mongoTemplate.findOne(query, UserEnvelop.class);
		if(userEnvelop==null){
			return false;
		}
		return true;
	}

}
