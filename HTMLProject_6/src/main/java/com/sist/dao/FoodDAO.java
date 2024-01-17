package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

/*
       ====================
        new Connection() : false =사용하면?=> true
       ====================
        new Connection() : false
       ====================
        new Connection() : false
       ====================
 */
public class FoodDAO {
	
	private Connection conn;
	
	private PreparedStatement ps;
	//싱글턴 생성 => 객체 1개 생성
	private static FoodDAO dao;
	//메모리 누수 현상을 방지 => GC
	
	/*
	//DBCP => 기능하고 관련이 없음 (연결,해제부분만!)
    //DBCP를 이용해서 미리연결된 Connection 주소를 가지고 오는걸로 바뀜!
	public void getConnection()
	{
		try {
			//저장시에 => 탐색기 형식 메모리 주소를 저장 (=JNDI)
			 // 1. 탐색기 열기
	         Context init=new InitialContext();
	         // 2. 저장된 위치 확인
	         Context c=(Context)init.lookup("java://comp/env");
	         // 3. 실제 Connection 주소 얻기 
	         DataSource ds=(DataSource)c.lookup("jdbc/oracle");
	         // 4. Connection의 정보를 받는다 
	         conn=ds.getConnection();

			
		}catch(Exception ex) {}
	}
	 */
	
	//1. 미리 생성된 connection 주소 열기 
	public void getConnection() {
		try {
			
			Context init=new InitialContext();
			//pool연결
			Context c=(Context)init.lookup("java://comp/env");
			//데이터베이스의 정보를 얻어온다
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			//연결
			conn=ds.getConnection();
			
		}catch(Exception ex) {}
	}
	
	//2. 반환 => 재사용
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	//3. 싱글턴
	// newInstance() 혹은 getInstance() 등은 => Singleton
	// => 메소드 호출 : 사용자가 보내준 URL에 따라 자동호출 => invoke
	// => 메소드마다 구분 (인덱스) => 자바에서 어노테이션
	public static FoodDAO newInstance()
	{
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	//=========================================여기까지 기본으로 하는 내용 (외워야함)
	
	//4. 기능처리 : SQL
	public List<CategoryVO> categoryListData(int cno)
	{
		List<CategoryVO> list=new ArrayList<CategoryVO>();
		try {
			//Connection의 주소를 얻어오기
			getConnection();
			int start=0,end=0;
			
			if(cno==1)
			{
				start=1;
				end=12;
			}
			
			else if(cno==2)
			{
				start=13;
				end=18;
			}
			
			else if(cno==3)
			{
				start=19;
				end=30;
			}
			
			String sql="SELECT cno,title,poster,subject "
					+"FROM food_category "
					+"WHERE cno BETWEEN ? AND ? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				CategoryVO vo=new CategoryVO();
				vo.setCno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setSubject(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	public CategoryVO categoryInfoData(int cno)
	{
		CategoryVO vo=new CategoryVO();
		try {
			//주소 얻기
			getConnection();
			//sql문장제작
			String sql="SELECT title, subject "
					+"FROM food_category "
					+"WHERE cno="+cno;
			//sql문장 전송
			ps=conn.prepareStatement(sql);
			//결과값을 받는다
			ResultSet rs=ps.executeQuery();
			rs.next();
			//vo에 저장 => 브라우저로 전송
			vo.setTitle(rs.getString(1));
			vo.setSubject(rs.getString(2));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return vo;
	}
	
	//카테고리별 맛집 읽기
	public List<FoodVO> foodListData(int cno)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT fno,cno,poster,name,score,"
					+"address,phone,type "
					+"FROM food_house "
					+"WHERE cno="+cno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setCno(rs.getInt(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^"));
				vo.setPoster(poster);
				vo.setName(rs.getString(4));
				vo.setScore(rs.getDouble(5));
				String addr=rs.getString(6);
				addr=addr.substring(0,addr.indexOf("지번"));
				vo.setAddress(addr.trim());
				vo.setPhone(rs.getString(7));
				vo.setType(rs.getString(8));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
}


















