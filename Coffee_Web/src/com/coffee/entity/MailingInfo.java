package com.coffee.entity;

public class MailingInfo {
	
	private int maiID;
	
	private String maiName;
	
	private String maiAddress;
	
	private String maiPhone;
	
	private String maiMessage;

	public MailingInfo() {
		super();
	}

	public MailingInfo(int maiID, String maiName, String maiAddress,
			String maiPhone, String maiMessage) {
		super();
		this.maiID = maiID;
		this.maiName = maiName;
		this.maiAddress = maiAddress;
		this.maiPhone = maiPhone;
		this.maiMessage = maiMessage;
	}

	public int getMaiID() {
		return maiID;
	}

	public void setMaiID(int maiID) {
		this.maiID = maiID;
	}

	public String getMaiName() {
		return maiName;
	}

	public void setMaiName(String maiName) {
		this.maiName = maiName;
	}

	public String getMaiAddress() {
		return maiAddress;
	}

	public void setMaiAddress(String maiAddress) {
		this.maiAddress = maiAddress;
	}

	public String getMaiPhone() {
		return maiPhone;
	}

	public void setMaiPhone(String maiPhone) {
		this.maiPhone = maiPhone;
	}

	public String getMaiMessage() {
		return maiMessage;
	}

	public void setMaiMessage(String maiMessage) {
		this.maiMessage = maiMessage;
	}

}
