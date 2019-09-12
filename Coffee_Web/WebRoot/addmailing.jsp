<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.coffee.entity.*,com.coffee.dao.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	// 设置编码格式
	request.setCharacterEncoding("utf-8");
	
	// 创建送餐表dao
	MailingInfoDao maiDao = new MailingInfoDao();
	
	// 获取相应参数
	String name = request.getParameter("maiName");
	String addr = request.getParameter("maiAddress");
	String phone = request.getParameter("maiPhone");
	String message = request.getParameter("maiMessage");
	
	// 创建送餐送餐对象
	MailingInfo maiInfo = new MailingInfo(0,name,addr,phone,message);
	
	// 执行添加到送餐表中
	boolean result = maiDao.addMailingInformation(maiInfo);
 %>

<?xml version="1.0" encoding="utf-8"?>
<Mailing>
			<!-- 	将添加结果返回	 -->
	<AddMailingResult><%=result %></AddMailingResult>
</Mailing>