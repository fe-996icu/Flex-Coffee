package com.coffee.dao;

import com.coffee.entity.*;

public class MailingInfoDao extends BaseDao {

	
	/**	添加送餐信息到送餐表中
	 * @param mailingInfo:要添加的送餐信息
	 * @return	返回是否天津爱成功
	 */
	public boolean addMailingInformation(MailingInfo mailingInfo){
		boolean result = false;
		
		// 拼凑sql语句，并在控制台上输出sql语句
		String sql = "INSERT INTO MailingInfo(MaiID,MaiName,MaiAddress,MaiPhone,MaiMessage) " +
					 "VALUES(Seq_MailingInfo_ID.NEXTVAL,'"+
					 		 mailingInfo.getMaiName()+"','"+
					 		 mailingInfo.getMaiAddress()+"','"+
					 		 mailingInfo.getMaiPhone()+"','"+
					 		 mailingInfo.getMaiMessage()+"')";
		System.out.println(sql);
		
		// 执行sql命令
		if(this.executeUpdate(sql) > 0){
			return true;
		}
		
		return result;
	}
	
}
