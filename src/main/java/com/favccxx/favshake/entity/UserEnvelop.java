package com.favccxx.favshake.entity;

import java.util.Date;

public class UserEnvelop {
	
	private String userId;
	
	private String userName;
	
	private String userAccount;
	
	private String envelopType;
	
	private String envelopValue;
	
	private Date createDate;
	
	private int isReceived;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEnvelopType() {
		return envelopType;
	}

	public void setEnvelopType(String envelopType) {
		this.envelopType = envelopType;
	}

	public String getEnvelopValue() {
		return envelopValue;
	}

	public void setEnvelopValue(String envelopValue) {
		this.envelopValue = envelopValue;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getIsReceived() {
		return isReceived;
	}

	public void setIsReceived(int isReceived) {
		this.isReceived = isReceived;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	
	
	

}
