package com.coffee.dao;

import com.coffee.entity.*;
import com.coffee.extend.DateFormater;

public class ReservationInfoDao extends BaseDao {

	/**	添加预约订单到订餐表中，
	 * 	@param res:要添加的订单对象
	 * 	@return 返回是否添加成功*/
	public boolean addReservationInformation(ReservationInfo res){
		boolean result = false;
		
		// 拼凑sql语句，并在控制台输出sql语句
		String sql = "INSERT INTO ReservationInfo(ResID,ResPartySize,ResDate,ResName,ResEmail,ResPhone,ResMessage) " +
					 "VALUES(Seq_ReservationInfo_ID.NEXTVAL,"+
					 		 res.getResPartySize()+
					 		 ",to_date('"+DateFormater.getStringByDate(res.getResDate())+"','yyyy-MM-dd'),'"+
					 		 res.getResName()+"','"+
					 		 res.getResEmail()+"','"+
					 		 res.getResPhone()+"','"+
					 		 res.getResMessage()+"')";
		System.out.println("添加预约订餐表的sql："+sql);
		
		// 执行并判断是否，添加成功
		if (this.executeUpdate(sql) > 0){
			result = true;
		}
		
		return result;
	}
	
}
