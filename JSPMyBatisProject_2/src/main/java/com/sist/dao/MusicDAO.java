package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
//musicFindData
public class MusicDAO {
	private static SqlSessionFactory ssf;
	
	//초기화 과정 : xml을 파싱하기
	static 
	{
		//자동인식블록~~
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			//mybatis에서 제공하는 태그와 속성만 사용해야한다
			//제공하는 태그는 dtd에 선언되어 있다.
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	//////////////////////////////////////////
	//아래는 이제 기능설정
	
	public static List<MusicVO> musicFindData(Map map) //원래 매개변수가 String[] fs, String ss 였는데 하나로 묶음
	{
		SqlSession session=null;
		List<MusicVO> list=new ArrayList<MusicVO>();
		try {
			session=ssf.openSession();
			list=session.selectList("musicFindData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
