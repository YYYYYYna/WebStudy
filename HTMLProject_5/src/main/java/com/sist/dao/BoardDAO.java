package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class BoardDAO {
	
	 private Connection conn;
	 private PreparedStatement ps;
	 private static BoardDAO dao; // 싱글턴 
	/*
	 *   DBCP => Data Base Connection Pool
	 *                                ----=connection을 관리하는 영역
	 *   1. 미리 Connection 객체를 생성
	 *      => 갯수는 maxIdle=?? 에서 물음표에 갯수를 지정한다
	 *   2. 연결되어있는 Connection 의 주소를 얻어온다
	 *   3. Connection을 사용
	 *   4. 사용후에는 반드시 반환 
	 *   ========================================================
	 *   => 장점
	 *      1. 보안이 뛰어나다
	 *      2. Connection 객체의 생성을 제어
	 *      3. 미리 연결했기 때문에 연결에 소모되는 시간을 줄일수 있다
	 *      4. 웹 프로그렘에 접근하는 인원이 많아도 쉽게 다운되지 않는다
	 *      5. 웹서버는 DBCP를 기본으로 하고 있다
	 *         => MyBatis / JPA
	 *         
	 *   JDBC => DBCP => 라이브러리(MyBatis/JPA)
	 *                           ========업계의핵심~~ 
	 */
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
	//사용후에 반환 (이부분은 이전과 코딩이 똑같음)
	public void disConnection()
	{
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	//싱글턴 만들어서 처리
	public static BoardDAO newInstance()
	{
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	//DBCP => 기능하고 관련이 없음 (연결,해제부분만!)
	//기능 생성
	//1-1. 목록출력 ==> Read (SELECT) =핵심기능=> 페이지나누기!+인라인뷰!
	public List<BoardVO> boardListData(int page)
	{
		  List<BoardVO> list=
		            new ArrayList<BoardVO>();

		try {
			getConnection();
			  String sql="SELECT no,subject,name,regdate,hit,num "
		               + "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
		               + "FROM (SELECT /*+ INDEX_DESC(board board_no_pk)*/no,subject,name,regdate,hit "
		               + "FROM board)) "
		               + "WHERE num BETWEEN ? AND ?";
		     ps=conn.prepareStatement(sql);
			//***실행전 ?에 꼭 값을 채워야함!!
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			//실행후에 결과값 받기
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	//1-2. 총페이지 구하기
	public int boardTotalPage()
	{
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM board";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally{
			disConnection();
		}
		return total;
	}
	
	//2. 데이터 추가 ==> Create (INSERT)
	public void boardInsert(BoardVO vo)
	{
		try {
			//1. 미리 오라클과 연결 => Connection(10) => 주소를 가지고 온다
			getConnection();
			//2. SQL문장 만들기
			String sql="INSERT INTO board(no,name,subject,content,pwd) "
					+"VALUES(board_no_seq.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			//3. SQL문장 실행 요청
			ps.executeUpdate(); //commit이 포함됨
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	
	//3. 상세보기 ==> Read (SELECT) =핵심기능=> 조회수증가!
	public BoardVO boardDetailData(int no)
	{
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="UPDATE board SET "
					+"hit=hit+1 "
					+"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			//여기까지가 조회수 증가 과정
			
			sql="SELECT no,name,subject,content,regdate,hit "
					+"FROM board"
					+"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			//결과값 받기
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	
	//4. 수정하기 ==> UPDATE (UPDATE) =핵심기능=> 비밀번호검색!
	//5. 삭제하기 ==> DELETE (DELETE) =핵심기능=> 비밀번호검색!
	//================================== CRUD!
	
}






















