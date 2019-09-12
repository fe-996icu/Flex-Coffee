package com.coffee.test;

//import java.util.Date;
//
//import com.coffee.dao.*;
//import com.coffee.entity.*;
//import com.coffee.extend.DateFormater;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		MenuInfoDao menuInfoDao = new MenuInfoDao();
		
		List<MenuInfo> list = menuInfoDao.getMenuInfosByPageCount(1);
			
		for (MenuInfo m : list) {
			System.out.println(m.getMenuID()+m.getMenuName()+m.getPrice());
		}
		*/
		
		
		/*// 测试添加预约订单
		ReservationInfoDao resDao = new ReservationInfoDao();
		
		ReservationInfo resInfo = new ReservationInfo(0, 20, new Date(), "Jean", "Jean@163.com", "19638527495","I have a Coffee！");
		
		boolean result = resDao.addReservationInformation(resInfo);
		
		System.out.println(result);
		*/
		
		/*
		// 测试添加送餐表
		MailingInfoDao maiDao = new MailingInfoDao();
		
		MailingInfo maiInfo = new MailingInfo(0, "Yukon", "Newborn", "+1 114616386", "I have a Coffee!");
		
		boolean result = maiDao.addMailingInformation(maiInfo);
		
		System.out.println(result);
		*/
		
		
		/*
		String d = "Wed Sep 14 00:00:00 GMT+0800 2011";
		
		Date date = DateFormater.getDateByString(d);
		
		System.out.println(date);
		*/
		
		double l = Math.ceil(1000.08333);
		
		System.out.println(l);
	}

}
