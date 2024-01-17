package com.sist.dao;
import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
public class MemberDAO {
	
	//매번 DAO에서 연결하는거 CommonsDataBase.get으로 만들어두고 가져옴
	private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
	
	//3. 기능설정~~~
	public static MemberVO isLogin(String id, String pwd)
	{
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdCount"); 
			                            //여기에 resultType 즉 sql문장이 들어가야함
			                            //해당sql문장을 수행하고? dao를 수행해달라는뜻
			if(count==0)
			{
				vo.setMsg("NOID");
			}
			else
			{
				MemberVO dvo=session.selectOne("memberPwd",id);
				                               //여기에 resultType 즉 sql문장이 들어가야함
                                               //해당sql문장을 수행하고? dao를 수행해달라는뜻
				if(pwd.equals(dvo.getPwd()))
				{
					vo.setMsg("OK");
					vo.setId(dvo.getId());
					vo.setName(dvo.getName());
					vo.setAdmin(dvo.getAdmin());
					vo.setPhone(dvo.getPhone());
					vo.setPost(dvo.getPost());
					vo.setAddr1(dvo.getAddr1());
					vo.setAddr2(dvo.getAddr2());
					vo.setEmail(dvo.getEmail());
				}
				else
				{
					vo.setMsg("NOPWD");
				}
			}
		}catch(Exception ex) {
			
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
}
