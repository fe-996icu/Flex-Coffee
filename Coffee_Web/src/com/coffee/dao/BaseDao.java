package com.coffee.dao;

import  java.sql.*;

import java.util.ResourceBundle;

public class BaseDao {
	
	private static final String DRIVER;
	
	private static final String URL;
	
	private static final String USER ;
	
	private static final String PASS;
	
	protected Connection con = null;
	
	protected PreparedStatement ps = null;
	
	protected ResultSet rs = null;
	
	/** 静态初始化，加载驱动	*/
	static{
		// 解析Oracle源文件
		ResourceBundle res = ResourceBundle.getBundle("oracle");
		DRIVER = res.getString("driver");
		URL = res.getString("url");
		USER = res.getString("user");
		PASS = res.getString("pass");
		
		// 加载驱动类
		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/**	获取连接
	 * 	@return：Connection连接对象		*/
	public Connection getConnection() throws SQLException{
		// 返回Connection的实现类对象
		return DriverManager.getConnection(URL,USER,PASS);
	}
	
	/**	关闭所有资源，ResultSet，PreparedStatement，Connection
	 * 	@param rs:ResultSet
	 * 	@param ps:PreparedStatement
	 * 	@param con:Connection*/
	public void closeAll(ResultSet rs,PreparedStatement ps,Connection con){
		
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (ps != null) {
			try {
				ps.close();
				ps = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (con != null) {
			try {
				con.close();
				con = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	/**	所有基于增删改的命令，都可以调用此方法，
	 * 	只需传入一条sql语句，必须是完善的sql语句
	 * 	@return 受影响的行数	int
	 */
	protected int executeUpdate(String sql){
		int result = -1;
		
		try {
			// 获取连接
			this.con = this.getConnection();
			
			// 创建执行对象
			this.ps = this.con.prepareStatement(sql);
			
			// 执行命令，返回受影响的行数
			result = this.ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 关闭所有资源
			this.closeAll(rs, ps, con);
		}
		
		return result;
	}
	
}
