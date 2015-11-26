package com.favccxx.favshake.dao;

import com.favccxx.favshake.entity.Coupons;

public interface ICouponsRepository {
	
	public void saveCoupons(Coupons coupons);
	
	public Coupons findRandomCoupons();

}
