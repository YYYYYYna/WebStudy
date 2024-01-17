package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.dbcp.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private static FoodDAO dao;
	public static FoodDAO newInstance()
	{
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	
	//목록
	public List<FoodVO> foodListData(int page, String fd, String ss)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT fno,poster,name,address,num "
					+ "FROM (SELECT fno,poster,name,address,rownum as num "
					+ "FROM (SELECT fno,poster,name,address "
					+ "FROM food_menu_house  "
					+ "WHERE "+fd+" LIKE '%'||?||'%' " //검색어 ss부분
					+ "ORDER BY fno ASC)) "
					+ "WHERE num BETWEEN ? AND ? ";
			//컬럼명이나 테이블명은 ?로 처리할수 없다!!
			//왜냐면 ps.setString(1,fd) => address => 'address'로 읽힘
			//MyBatis => ${} #{}에 따라 ''인지 아닌지가 달라짐
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, ss);
			//fd => , ss
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setAddress(rs.getString(4));
				list.add(vo);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	//총페이지
	public int foodTotalPage(String fd,String ss)
	{
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM food_menu_house  "
					+ "WHERE "+fd+" LIKE '%'||?||'%' "; //검색어 ss부분
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	/*
	 *    1. 데이터베이스 => 어떤값을 (요청)하는지 중요
	 *    2. 화면 어떤 데이터가 필요한지 중요...
	 */
	//상세보기
	public FoodVO foodDetailData(int fno)
	{
		//ss/fd=>화면이동변수
		FoodVO vo=new FoodVO();
		try {
			
			conn=dbconn.getConnection();
			String sql="SELECT fno,poster,name,type,address,phone,"
					+ "score,theme,price,time,seat,content "
					+ "FROM food_menu_house "
					+ "WHERE fno="+fno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setType(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setPhone(rs.getString(6));
			vo.setScore(rs.getDouble(7));
			vo.setTheme(rs.getString(8));
			vo.setPirce(rs.getString(9));
			vo.setTime(rs.getString(10));
			vo.setSeat(rs.getString(11));
			vo.setContent(rs.getString(12));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
}
