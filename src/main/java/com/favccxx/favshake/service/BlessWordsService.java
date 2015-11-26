package com.favccxx.favshake.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.favccxx.favshake.dao.IBlessWordsRepository;
import com.favccxx.favshake.entity.BlessWords;

@Service
public class BlessWordsService {

	@Autowired
	IBlessWordsRepository blessWordsRepo;
	
	public void saveBlessWords(BlessWords blessWords) {
		blessWordsRepo.saveBlessWords(blessWords);
	}

	public BlessWords findRandomBlessWords() {
		return blessWordsRepo.findRandomBlessWords();
	}
}
