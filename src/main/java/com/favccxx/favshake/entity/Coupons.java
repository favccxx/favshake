package com.favccxx.favshake.entity;

import java.util.Date;

public class Coupons {
	/**优惠券Id*/
	private String couponsId;
	/**优惠券发放方式*/
	private String couponsType;
	/**优惠券领用规则*/
	private String couponsRule;
	/**优惠券名字*/
	private String couponsName;
	/**优惠券金额*/
	private String couponsValue;
	/**优惠券随机数*/
	private int couponsRandom;
	/**优惠券领取连接*/
	private String couponsURL;
	/**优惠券使用地区*/
	private String couponsArea;
	/**过期日期*/
	private Date expiredDate;
	/**0:不可用；1：可用*/
	private int couponsStatus;

	private Date createDate;
	
	private String createUserName;
	
	private String createUserEmail;

	public String getCouponsId() {
		return couponsId;
	}

	public void setCouponsId(String couponsId) {
		this.couponsId = couponsId;
	}

	public String getCouponsType() {
		return couponsType;
	}

	public void setCouponsType(String couponsType) {
		this.couponsType = couponsType;
	}

	public String getCouponsRule() {
		return couponsRule;
	}

	public void setCouponsRule(String couponsRule) {
		this.couponsRule = couponsRule;
	}

	public String getCouponsName() {
		return couponsName;
	}

	public void setCouponsName(String couponsName) {
		this.couponsName = couponsName;
	}

	public String getCouponsValue() {
		return couponsValue;
	}

	public void setCouponsValue(String couponsValue) {
		this.couponsValue = couponsValue;
	}

	public String getCouponsURL() {
		return couponsURL;
	}

	public void setCouponsURL(String couponsURL) {
		this.couponsURL = couponsURL;
	}

	public String getCouponsArea() {
		return couponsArea;
	}

	public void setCouponsArea(String couponsArea) {
		this.couponsArea = couponsArea;
	}

	public Date getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}

	public int getCouponsStatus() {
		return couponsStatus;
	}

	public void setCouponsStatus(int couponsStatus) {
		this.couponsStatus = couponsStatus;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCouponsRandom() {
		return couponsRandom;
	}

	public void setCouponsRandom(int couponsRandom) {
		this.couponsRandom = couponsRandom;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getCreateUserEmail() {
		return createUserEmail;
	}

	public void setCreateUserEmail(String createUserEmail) {
		this.createUserEmail = createUserEmail;
	}
	
	
}
