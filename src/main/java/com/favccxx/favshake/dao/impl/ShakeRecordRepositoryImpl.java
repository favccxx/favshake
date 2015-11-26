package com.favccxx.favshake.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.favccxx.favshake.dao.IShakeRecordRepository;
import com.favccxx.favshake.entity.ShakeRecord;

@Repository
public class ShakeRecordRepositoryImpl implements IShakeRecordRepository{

	@Autowired
	MongoTemplate mongoTemplate;
	
	public void saveShakeRecord(ShakeRecord shakeRecord) {
		mongoTemplate.save(shakeRecord);
	}

}
