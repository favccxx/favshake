package com.favccxx.favshake.dao.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.favccxx.favshake.dao.ISponsorRepository;
import com.favccxx.favshake.entity.Sponsor;

@Repository
public class SponsorRepositoryImpl implements ISponsorRepository {
	
	@Autowired
	MongoTemplate mongoTemplate;

	public void saveSponsor(Sponsor sponsor) {
		sponsor.setSponsorDate(new Date());
		mongoTemplate.save(sponsor);
	}

}
