<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.coffee.entity.*,com.coffee.dao.*;" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	// 创建MenuInfoDao对象
	MenuInfoDao menuInfoDao = new MenuInfoDao();
	
	// 计算获取分页查询的总页数
	int pageSum = menuInfoDao.getMenuInfoPageSum();
	
 %>

<?xml version="1.0" encoding="utf-8"?>
<PageSum>
	<%=pageSum %>
</PageSum>