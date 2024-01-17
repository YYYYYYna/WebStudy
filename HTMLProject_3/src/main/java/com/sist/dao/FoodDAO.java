package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//싱글턴 패턴 => 메모리 공간 1개 생성
	//new를 사용하지 않고 싱글턴으로 해결하려함
	private static FoodDAO dao;
	
	//드라이버 등록은 1번만 생성 => 생성자~~
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	
	public void getConnection()
	{
		try {
			//실무나가서는 이렇게 사용자명과 비밀번호 노출되도록 코딩하면 안됨!!
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	public void disConnection()
	{
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	//싱글턴 패턴
	public static FoodDAO newInstance()
	{
		//라이브러리 => newInstance, getInstance() => 싱글턴
		if(dao==null)
		{
			dao=new FoodDAO();
		}
		return dao;
	}
	
	//기능설정
	//목록(table) 출력하기 => 인라인뷰 => 페이지설정
	public List<FoodVO> foodListData(int page)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		//FoodVO = ROW
		//https://www.menupan.com/
		try {
			getConnection();
			
			//페이지마다 데이터 읽기
			int rowSize=20; //한페이지당 20개씩 출력한다는뜻
			//num BETWEEN ? AND ? => 1page는 1~20개 출력
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			                                       //만약에 이부분 주소가 너무 길면 자바 or 테이블 어디서 자를지 결정해야함
			 String sql="SELECT fno,poster,name,type,address,num "
		               + "FROM (SELECT fno,poster,name,type,address,rownum as num "
		               + "FROM (SELECT /*+ INDEX_ASC(food_menu_house fh_fno_pk)*/fno,poster,name,type,address "
		               + "FROM food_menu_house)) "
		               + "WHERE num BETWEEN ? AND ?";

			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			//INDEX_ASC(테이블명 인덱스명(),PK,UK) , INDEX_DESC() , INDEX()
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster("https://www.menupan.com"+rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setType(rs.getString(4));
				vo.setAddress(rs.getString(5));
				
				list.add(vo);
			}
			
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
	//총페이지 버튼만들기
	//방법1) 이전,다음
	//방법2) ◀1 2 3 4 5▶
	//근데 방법2가 생각보다 어려움으로 방법1로 실습함 / 실무에서는 방법2가 훨씬 많음!!
	public int foodTotalPage()
	{
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM food_menu_house";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return total;
	}
}
