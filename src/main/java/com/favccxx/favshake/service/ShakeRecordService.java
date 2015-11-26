package com.favccxx.favshake.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.favccxx.favshake.dao.IShakeRecordRepository;
import com.favccxx.favshake.entity.ShakeRecord;

@Service
public class ShakeRecordService {

	@Autowired
	IShakeRecordRepository shakeRecordRepo;
	
	public void saveShakeRecord(ShakeRecord shakeRecord){
		shakeRecord.setShakeDate(new Date());
		shakeRecordRepo.saveShakeRecord(shakeRecord);
	}
}
