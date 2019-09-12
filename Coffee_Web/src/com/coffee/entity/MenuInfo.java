package com.coffee.entity;

public class MenuInfo {
	
	private int menuID;
	
	private String menuName;
	
	private double price;

	public MenuInfo() {
		super();
	}

	public MenuInfo(int menuID, String menuName, double price) {
		super();
		this.menuID = menuID;
		this.menuName = menuName;
		this.price = price;
	}

	public int getMenuID() {
		return menuID;
	}

	public void setMenuID(int menuID) {
		this.menuID = menuID;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}
