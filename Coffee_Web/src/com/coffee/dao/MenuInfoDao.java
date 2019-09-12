package com.coffee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.coffee.entity.*;

public class MenuInfoDao extends BaseDao {
	
	/**	分页查询每页显示的行数，终态的，不允许再次修改	值为：12*/
	public static final int ROWCOUNT = 12;
	
	/**	获取结果集，通过传进来的sql语句*/
	private ResultSet getResultSetBySQL(String sql) throws SQLException{
		
		// 获取连接
		this.con = this.getConnection();
		
		// 初始化 PreparedStatement 执行对象
		this.ps = this.con.prepareStatement(sql);
		
		// 执行查找，返回结果集
		return this.ps.executeQuery();
		
	}
	
	/**	所有查询MenuInfo表数据的私有方法
	 * 	@param sql:要查询的sql语句
	 * 	@return ： 查询回来的MenuInfo泛型集合		*/
	private List<MenuInfo> getMenuInfosBySQL(String sql){
		List<MenuInfo> list = new ArrayList<MenuInfo>();
		
		try {
			
			// 获取结果集
			this.rs = this.getResultSetBySQL(sql);
			
			// 遍历结果集
			while (this.rs.next()) {
				// 获取相关属性
				int menuID = this.rs.getInt("MenuID");
				String menuName = this.rs.getString("MenuName");
				double price = this.rs.getDouble("Price");
				// 构建MenuInfo对象
				MenuInfo menuInfo = new MenuInfo(menuID, menuName, price);
				// 添加到集合中
				list.add(menuInfo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 关闭所有资源
			this.closeAll(rs, ps, con);
		}
		
		return list;
	}

	/**	分页查询菜单项目
	 * 	@param page：要显示第几页菜单，必须大于0，
	 * 				例如：查看第一页，就传入1，查看第二页就传入2.
	 * 				每页显示12行，ROWCOUNT最终属性定义
	 * 	@return 返回MenuInfo的泛型集合，集合长度12，ROWCOUNT最终属性定义的长度*/
	public List<MenuInfo> getMenuInfosByPageCount(int page){
		// 设置显示的页数，并计算显示第几行
		page -= 1;
		int form = page * MenuInfoDao.ROWCOUNT + 1;
		int to = MenuInfoDao.ROWCOUNT * (page + 1);
		// 拼凑sql语句，并输出
		String sql = "SELECT * FROM MenuInfo WHERE MenuID BETWEEN "+form+" AND "+to+"";
		System.out.println("分页查询MenuInfo表："+sql);
		// 返回查询结果
		return this.getMenuInfosBySQL(sql);
	}
		
	/**	获取菜单表中的分页查询后的总页数*/
	public int getMenuInfoPageSum(){
		int pageSum = 0;
		
		// 构造sql语句
		String sql = "SELECT CEIL(COUNT(*)/"+ROWCOUNT+") AS pageSum FROM MenuInfo";
		
		try {
			// 获取结果集
			this.rs = this.getResultSetBySQL(sql);
			
			// 读取结果集
			if(this.rs.next()){
				pageSum = this.rs.getInt("PAGESUM");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.closeAll(rs, ps, con);			
		}
		
		return pageSum;
	}
	
}
