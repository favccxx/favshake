package com.favccxx.favshake.entity;

public class RedEnvelop {
	
	public RedEnvelop(){
		
	}
	
	public RedEnvelop(String redEnvelopType){
		this.redEnvelopType = redEnvelopType;
		if("1".equals(redEnvelopType)){
			this.redEnvelopURL = "http://123.57.155.30/favshake/initReceiveCash";
			this.redEnvelopName = "";			
		}
		
	}
	
	private String redEnvelopId;

	/**
	 * 红包名称
	 */
	private String redEnvelopName;
	/**
	 * 红包值
	 */
	private String redEnvelopValue;
	/**红包类型*/
	private String redEnvelopType;
	/**红包链接*/
	private String redEnvelopURL;
	
	
	public String getRedEnvelopId() {
		return redEnvelopId;
	}

	public void setRedEnvelopId(String redEnvelopId) {
		this.redEnvelopId = redEnvelopId;
	}

	public String getRedEnvelopName() {
		return redEnvelopName;
	}
	public void setRedEnvelopName(String redEnvelopName) {
		this.redEnvelopName = redEnvelopName;
	}
	public String getRedEnvelopValue() {
		return redEnvelopValue;
	}
	public void setRedEnvelopValue(String redEnvelopValue) {
		this.redEnvelopValue = redEnvelopValue;
	}
	public String getRedEnvelopType() {
		return redEnvelopType;
	}
	public void setRedEnvelopType(String redEnvelopType) {
		this.redEnvelopType = redEnvelopType;
	}
	public String getRedEnvelopURL() {
		return redEnvelopURL;
	}
	public void setRedEnvelopURL(String redEnvelopURL) {
		this.redEnvelopURL = redEnvelopURL;
	}
	
	
}
