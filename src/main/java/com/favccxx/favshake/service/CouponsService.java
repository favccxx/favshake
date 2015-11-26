package com.favccxx.favshake.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.favccxx.favshake.dao.ICouponsRepository;
import com.favccxx.favshake.entity.Coupons;

@Service
public class CouponsService {

	@Autowired
	ICouponsRepository couponsRepo;

	public void saveCoupons(Coupons coupons) {
		couponsRepo.saveCoupons(coupons);
	}

	public Coupons findRandomCoupons() {
		return couponsRepo.findRandomCoupons();
	}
}
