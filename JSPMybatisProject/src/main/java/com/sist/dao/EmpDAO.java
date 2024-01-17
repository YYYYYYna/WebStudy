package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class EmpDAO {
	//파싱 (XML) => <select id=""> SELECT ~ #{} </select>
	//map.put("id","SELECT~") selectList(id명,?)
	
	//1. 마이바티스를 단독으로 쓸때 적는 코딩 / 스프링에서는 자동으로 생성됨
	private static SqlSessionFactory ssf;
	
	//2. XML을 전송하며 파싱(데이터읽기) 시작 : 초기화블록사용
	static
	{
		try {
			//2-1. xml 읽어오기
			Reader reader=Resources.getResourceAsReader("Config.xml");
			//2-2. xml 데이터 읽기 => Map에 저장
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	//3-1. 기능설정
	public static List<EmpVO> empListData()
	{
		SqlSession session=ssf.openSession(); //getConnection부분
		List<EmpVO> list=session.selectList("empListData"); //select의 id값 가져옴
		session.close(); //disConnection부분 : 꼭 닫아줘야함
		return list;
	}
	
	//3-2. join 실습
	public static List<EmpVO> empDeptJoinData()
	{
		SqlSession session=ssf.openSession(); //getConnection부분
		List<EmpVO> list=session.selectList("empDeptJoinData"); //select의 id값 가져옴
		session.close(); //disConnection부분 : 꼭 닫아줘야함
		return list;
	}
	
	//3-3. 서브쿼리
	public static List<EmpVO> empDeptSubqueryData()
	{
		SqlSession session=ssf.openSession(); //getConnection부분
		List<EmpVO> list=session.selectList("empDeptSubqueryData"); //select의 id값 가져옴
		session.close(); //disConnection부분 : 꼭 닫아줘야함
		return list;
	}
	
	//4. string으로 받기 => 제네릭 부분만 String으로 바꿔주면됨
	public static List<String> empNameData()
	{
		SqlSession session=ssf.openSession(); //getConnection부분
		List<String> list=session.selectList("empNameData"); //select의 id값 가져옴
		session.close(); //disConnection부분 : 꼭 닫아줘야함
		return list;
	}
	
	//5. foreach 실습
	 public static List<EmpVO> empFindData(String[] names)
	 {
		 SqlSession session=ssf.openSession();
		 Map map=new HashMap();
		 map.put("names", names);
		 List<EmpVO> list=session.selectList("empFindData",map);
		 session.close();
		 return list;
	 }
}
