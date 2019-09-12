package com.coffee.extend;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormater {

	/**		格式时间的格式		*/
	private static final String patter;

	/**		格式时间对象		*/
	private static final DateFormat dateFormat;
	
	
	
	// 静态初始化
	static {
		patter = "yyyy-MM-dd";
		dateFormat = new SimpleDateFormat(patter);
	}
	
	
	
	
	
	/**	传出字符串，自动转换成Date对象，
	 * 	如果，转换失败就返回当前日期，格式为yyyy-MM-dd*/
	public static Date getDateByString(String date){
		try {
			return dateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Date();
	}

	/**	传入Date对象，返回yyyy-MM-dd格式的字符串
	 * 	*/
	public static String getStringByDate(Date date){
		return dateFormat.format(date);		
	}
	
}
