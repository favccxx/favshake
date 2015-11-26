package com.favccxx.favshake.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.favccxx.favshake.dao.ISponsorRepository;
import com.favccxx.favshake.entity.Sponsor;

@Service
public class SponsorService {
	
	@Autowired
	ISponsorRepository sponsorRepo;
	
	public void saveSponsor(Sponsor sponsor) {
		sponsorRepo.saveSponsor(sponsor);
	}

}
