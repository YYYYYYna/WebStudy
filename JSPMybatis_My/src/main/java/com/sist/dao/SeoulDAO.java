package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class SeoulDAO {
	private static SqlSessionFactory ssf=
			CommonsDataBase.getSsf();
	//기능설정
	/*
   <select id="seoulLocationListData" resultType="seoulVO" parameterType="hashmap">
      SELECT no,poster,title,num
      FROM (SELECT no,poster,title,rownum as num 
      FROM (SELECT no,poster,title ORDER BY ASC))
      WHERE num BETWEEN #{start} AND #{end}
   </select>
	 */
	public static List<SeoulVO> seoulLocationListData(Map map)
	{             //값이 여러개라서 List         
		List<SeoulVO> list=new ArrayList<SeoulVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("seoulLocationListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	/*
	<select id="seoulLocationTotalPage" resultType="int">
      SELECT CEIL(COUNT(*)/20.0) FROM seoul_location
   </select>
	 */
	public static int seoulLocationTotalPage()
	{
		int total=0;
		SqlSession session=null;
        try {
        	session=ssf.openSession();
			total=session.selectOne("seoulLocationTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
        return total;
	}
	
	//////////////////////////////////////////////////////////
	
	public static List<SeoulVO> seoulNatureListData(Map map)
	{             //값이 여러개라서 List         
		List<SeoulVO> list=new ArrayList<SeoulVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("seoulNatureListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	/*
	<select id="seoulNatureTotalPage" resultType="int">
      SELECT CEIL(COUNT(*)/20.0) FROM seoul_Nature
   </select>
	 */
	public static int seoulNatureTotalPage()
	{
		int total=0;
		SqlSession session=null;
        try {
        	session=ssf.openSession();
			total=session.selectOne("seoulNatureTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
        return total;
	}
	
	////////////////////////////////////////////////////////////
	
	public static List<SeoulVO> seoulShopListData(Map map)
	{             //값이 여러개라서 List         
		List<SeoulVO> list=new ArrayList<SeoulVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("seoulShopListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	/*
	<select id="seoulShopTotalPage" resultType="int">
      SELECT CEIL(COUNT(*)/20.0) FROM seoul_Shop
   </select>
	 */
	public static int seoulShopTotalPage()
	{
		int total=0;
		SqlSession session=null;
        try {
        	session=ssf.openSession();
			total=session.selectOne("seoulShopTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
        return total;
	}
	
	////////////////////////////////////////////////////
/*
 * <update id="seoulLocationHitIncrement" parameterType="int">
   UPDATE seoul_location SET
   hit=hit+1
   WHERE no=#{no}
</update>
<select id="seoulLocationDetailData" resultType="seoulVO" parameterType="int">
   SELECT * FROM seoul_location
   WHERE no=#{no}
</select>
 */
	public static SeoulVO seoulLocationDetailData(int no)
	{
		//매개변수는 사용자 요청값
		SeoulVO vo=new SeoulVO();
		SqlSession session=null;
        try {
        	session=ssf.openSession();
        	session.update("seoulLocationHitIncrement",no);
        	session.commit();
        	vo=session.selectOne("seoulLocationDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
}
