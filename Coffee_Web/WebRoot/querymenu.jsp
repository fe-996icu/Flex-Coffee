<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.coffee.entity.*,com.coffee.dao.*;" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	// 创建MenuInfoDao对象
	MenuInfoDao menuInfoDao = new MenuInfoDao();
	
	// 创建集合，接收分页查询出来的菜单项
	List<MenuInfo> list = null;
	
	// 设置编码格式
	request.setCharacterEncoding("utf-8");
	
	// 获取参数，
	String selectedPage = request.getParameter("selectedPage");
	
	// 如果，没有传入页数，就查找第一页的菜单
	if(selectedPage == null||selectedPage == ""){
		list = menuInfoDao.getMenuInfosByPageCount(1);
	}else{
		// 将页码转换为整型，并查找相应页数的菜单项目
		int p = Integer.parseInt(selectedPage);
		list = menuInfoDao.getMenuInfosByPageCount(p);
	}
		
%>

<?xml version="1.0" encoding="utf-8"?>
<MenuInfo>
	<%
		// 遍历查询的结果
		for(MenuInfo m : list){%>
			<Menu>
				<ID><%=m.getMenuID() %></ID>
				<Name><%=m.getMenuName() %></Name>
				<Price><%=m.getPrice() %></Price>
			</Menu>
		<%}
	%>
</MenuInfo>