package com.favccxx.favshake.dao.impl;

import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.favccxx.favshake.dao.ICouponsRepository;
import com.favccxx.favshake.entity.Coupons;

@Repository
public class CouponsRepositoryImpl implements ICouponsRepository {

	@Autowired
	MongoTemplate mongoTemplate;
	
	public void saveCoupons(Coupons coupons) {
		int randomNum = 1;
		Query query = new Query();	
		Sort sort = new Sort(new Order(Direction.DESC,"createDate"));
		query.with(sort);
		
		Coupons existCoupons = mongoTemplate.findOne(query, Coupons.class);
		if(existCoupons!=null){
			randomNum = existCoupons.getCouponsRandom() + 1;
		}
		
		coupons.setCouponsRandom(randomNum);
		coupons.setCreateDate(new Date());
		mongoTemplate.save(coupons);
	}

	public Coupons findRandomCoupons() {
		int maxNum = 1;
		Query query = new Query();	
		Sort sort = new Sort(new Order(Direction.DESC,"createDate"));
		query.with(sort);
		
		Coupons existCoupons = mongoTemplate.findOne(query, Coupons.class);
		if(existCoupons!=null){
			maxNum = existCoupons.getCouponsRandom() + 1;
		}
		
		int randomNum = (new Random()).nextInt(maxNum) + 1;
		query = new Query();	
		Criteria criteria = new Criteria();
		criteria.and("couponsRandom").is(randomNum);	
		query.addCriteria(criteria);
		Coupons coupons = mongoTemplate.findOne(query, Coupons.class);
		return coupons;
	}

}
