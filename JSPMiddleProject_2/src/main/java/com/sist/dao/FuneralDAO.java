package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;
public class FuneralDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection(); 
	private static FuneralDAO dao;
	
	private final int Row_Size=1;
	
	public List<FuneralVO> funeralAllListData(int page)
	{
		List<FuneralVO> list=new ArrayList<FuneralVO>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT mno, infoimage, infoh3, num "
					+ "FROM (SELECT mno, infoimage, infoh3, rownum as num "
					+ "FROM (SELECT mno, infoimage, infoh3 "
					+ "FROM FUNERALINFO ORDER BY mno ASC)) "
					+ "WHERE num BETWEEN ? AND ? ";
			ps=conn.prepareStatement(sql);
			int start=(Row_Size*page)-(Row_Size-1);
			int end=Row_Size*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FuneralVO vo=new FuneralVO();
				vo.setMno(rs.getInt(1));
				vo.setInfoimage(rs.getString(2));
				vo.setInfoh3(rs.getString(3));
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
	
	public int goodsTotalPage(int type)
	{
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/"+Row_Size+") "
					+ "FROM FUNERALINFO";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
}
