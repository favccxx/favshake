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

import com.favccxx.favshake.dao.IBlessWordsRepository;
import com.favccxx.favshake.entity.BlessWords;

@Repository
public class BlessWordsRepositoryImpl implements IBlessWordsRepository {

	@Autowired
	MongoTemplate mongoTemplate;
	
	public void saveBlessWords(BlessWords blessWords) {
		int randomNum = 1;
		Query query = new Query();	
		Sort sort = new Sort(new Order(Direction.DESC,"createDate"));
		query.with(sort);
		
		BlessWords existBlessWords = mongoTemplate.findOne(query, BlessWords.class);
		if(existBlessWords!=null){
			randomNum = existBlessWords.getBlessNum() + 1;
		}
		
		blessWords.setBlessNum(randomNum);
		blessWords.setCreateDate(new Date());		
		mongoTemplate.save(blessWords);
	}

	public BlessWords findRandomBlessWords() {
		int maxNum = 1;
		Query query = new Query();	
		Sort sort = new Sort(new Order(Direction.DESC,"createDate"));
		query.with(sort);
		
		BlessWords existBlessWords = mongoTemplate.findOne(query, BlessWords.class);
		if(existBlessWords!=null){
			maxNum = existBlessWords.getBlessNum() + 1;
		}
		
		int randomNum = (new Random()).nextInt(maxNum) ;
		if(randomNum < 1) {
			randomNum = 1;
		}
		query = new Query();	
		Criteria criteria = new Criteria();
		criteria.and("blessNum").is(randomNum);	
		query.addCriteria(criteria);
		BlessWords blessWords = mongoTemplate.findOne(query, BlessWords.class);
		return blessWords;
	}

	public int findLatestBlessWordsNum() {
		Query query = new Query();	
		Sort sort = new Sort(new Order(Direction.DESC,"createDate"));
		query.with(sort);
		
		BlessWords blessWords = mongoTemplate.findOne(query, BlessWords.class);
		if(blessWords==null){
			return 1;
		}
		
		return blessWords.getBlessNum()+1;
	}

}
