package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*; //데이터베이스 정보 => DataSource
import javax.naming.*; //Context => 이름을 객체로 가진다
/*
 * DBCP => 미리 Connection을 연결 => POOL안에 연결
 * 사용후에 다시 POOL안에 반환 => 재사용
 * Connection 생성을 제한 => 연결시간을 줄일수 있다
 * 웹 개발을 하는 업체는 DBCP를 사용한다
 * MyBatis / JPA의 기본은 DBCP
 */
public class FoodDAO {
	
	//has-a => 포함클래스
	private Connection conn; //오라클 연결객체
	//오라클 서버와 연결하는 socket
	
	private PreparedStatement ps; //sql 송수신 => 전송 결과값 받기
	//OutputStream / BufferedReader
	
	private static FoodDAO dao; //싱글턴
	//메모리 누수 방지!! (싱글턴은 무조건 static임!)
	
	/*
	 *    [예를들어 예약을 하는 카테고리가 많은 경우]
	 *     게스트하우스,호텔,맛집,영화 등등을 한개의 테이블로 만들기
	 *     테이블 안에는 구분자를 주면됨 게스트하우스=1, 호텔=2, 맛집=3, 영화=4...
	 *     이렇게 해야지 한개의 메소드로 다 처리가 가능!
	 */
	
	//1.미리 연결된 주소값을 얻기(DBCP형식)
	public void getConnection()
	{
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env"); //C드라이브에 접근
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {}
	}
	
	//**만약? 메소드 여러개가 반복적으로 사용하는 경우 => 클래스화 시켜야함!! => jar가 이런 형식으로 라이브러리를 묶어놓은 형식임~~
	//2.반환 => 재사용:반복수행을 메소드화해서 줄이는방식
	public void disConnection()
	{
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	//3.싱글턴 말하기
	public static FoodDAO newInstance()
	{
		if(dao==null)
		{
			dao=new FoodDAO();
		}
		return dao;
	}
	//=========> 여기까지가 DAO 제작시 필수사항
	
	//4.기능설정
	//:아래 페이지수를 1~12??로 출력하면서 다음버튼을 누르면 13부터 블럭단위로 나오도록
	public List<FoodVO> foodListData(int page)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			//1)주소값 얻기
			getConnection();
			//2)sql문장 얻기
			String sql="SELECT fno,name,poster,num "
					+"FROM (SELECT fno,name,poster,rownum as num "
					+"FROM (SELECT /* + INDEX_ASC(food_location pk_food_location) */fno,name,poster "
					+"FROM food_location)) "
					+"WHERE num BETWEEN ? AND ? ";
			ps=conn.prepareStatement(sql); //오라클로 전송
			int rowSize=12;
			//여기서부터는 sql문장의 ?값을 채우는 내용임
			int start=(rowSize*page)-(rowSize-1); //rownum은 1번부터 시작함!!
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			//여기서부터는 실행요청!
			ResultSet rs=ps.executeQuery();
			while(rs.next())//첫번째 row부터 읽어서 마지막까지 읽는다
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^"));
				vo.setPoster(poster);
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
	
	// 총페이지
	   public int foodTotalPage()
	   {
	      int total=0;
	      try
	      {
	         // 주소 얻기
	         getConnection();
	         String sql="SELECT CEIL(COUNT(*)/12.0) "
	               +"FROM food_location";
	        ps=conn.prepareStatement(sql);
	        ResultSet rs=ps.executeQuery();
	        rs.next();
	        total=rs.getInt(1);
	        rs.close();
	      }catch(Exception ex)
	      {
	         // 에러확인
	         ex.printStackTrace();
	      }
	      finally
	      {
	         // 반환
	         disConnection();
	      }
	      return total;
	   }
	   
	   //상세보기 : sql문 2번씀
	   public FoodVO FoodDetailData(int fno)
	   {
		   FoodVO vo=new FoodVO();
		   try {
			   getConnection();
			   
			   //1)조회수 증가하는 sql문
			   String sql="UPDATE food_location SET "
					   +"hit=hit+1 "
					   +"WHERE fno="+fno;
			   ps=conn.prepareStatement(sql);
			   ps.executeUpdate();
			   
			   //2)결과값 받는 sql문
			   sql="SELECT fno,name,score,address,tel,poster,type,price,parking,menu,time "
					   +"FROM food_location "
					   +"WHERE fno="+fno;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setFno(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setScore(rs.getDouble(3));
			   vo.setAddress(rs.getString(4));
			   vo.setPhone(rs.getString(5));
			   vo.setPoster(rs.getString(6));
			   vo.setType(rs.getString(7));
			   vo.setPrice(rs.getString(8));
			   vo.setParking(rs.getString(9));
			   vo.setMenu(rs.getString(10));
			   vo.setTime(rs.getTime(11));
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

	}
	
