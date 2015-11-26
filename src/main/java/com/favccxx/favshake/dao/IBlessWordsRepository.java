package com.favccxx.favshake.dao;

import com.favccxx.favshake.entity.BlessWords;

public interface IBlessWordsRepository {

	public void saveBlessWords(BlessWords blessWords);
	
	public BlessWords findRandomBlessWords();
	
	public int findLatestBlessWordsNum();
}
