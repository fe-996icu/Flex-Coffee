<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.coffee.entity.*,com.coffee.dao.*,com.coffee.extend.*;" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	// 设置编码格式
	request.setCharacterEncoding("utf-8");
	
	// 创建添加预约订单的Dao
	ReservationInfoDao resDao = new ReservationInfoDao();
	
	// 获取相应参数
	int partySize = Integer.parseInt(request.getParameter("resPartySize"));
	// 获取日期属性，转换成Date对象
	Date date = DateFormater.getDateByString(request.getParameter("resDate"));
	String time = request.getParameter("resTime");
	String name = request.getParameter("resName");
	String email = request.getParameter("resEmail");
	String phone = request.getParameter("resPhone");
	String message = request.getParameter("resMessage");
	
	// 创建订单对象
	ReservationInfo resInfo = new ReservationInfo(0,partySize,date,name,email,phone,message);

	// 添加订单到预约表中，
	boolean result = resDao.addReservationInformation(resInfo);
%>

<?xml version="1.0" encoding="utf-8"?>
<Reservation>
						<!--	返回添加结果	 -->
	<AddReservationResult><%=result %></AddReservationResult>
</Reservation>

