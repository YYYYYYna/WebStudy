package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class CommonsDataBase {
	private static SqlSessionFactory ssf;
	
	static
	{
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	//이건...ssf의 getter를 만듬...왜인지 모르겟음.
	//위의 ssf부분이랑 static{}을 메소드화 시켜서 불러옴
	public static SqlSessionFactory getSsf() {
		return ssf;
	}
	
	
}
