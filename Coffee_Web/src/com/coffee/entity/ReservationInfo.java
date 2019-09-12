package com.coffee.entity;

import java.util.Date;


public class ReservationInfo {
	
	private int resID;
	
	private int resPartySize;
	
	private Date resDate;
	
	private String resName;
	
	private String resEmail;
	
	private String resPhone;
	
	private String resMessage;

	public ReservationInfo() {
		super();
	}

	public ReservationInfo(int resID, int resPartySize, Date resDate,
			String resName, String resEmail, String resPhone, String resMessage) {
		super();
		this.resID = resID;
		this.resPartySize = resPartySize;
		this.resDate = resDate;
		this.resName = resName;
		this.resEmail = resEmail;
		this.resPhone = resPhone;
		this.resMessage = resMessage;
	}

	public int getResID() {
		return resID;
	}

	public void setResID(int resID) {
		this.resID = resID;
	}

	public int getResPartySize() {
		return resPartySize;
	}

	public void setResPartySize(int resPartySize) {
		this.resPartySize = resPartySize;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResEmail() {
		return resEmail;
	}

	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getResMessage() {
		return resMessage;
	}

	public void setResMessage(String resMessage) {
		this.resMessage = resMessage;
	}

}
