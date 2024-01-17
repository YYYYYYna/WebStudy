package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.GoodsDAO;
/*
 * 모델예시
class Model
{
	@RequestMapping("a") //이 "밑에" 있는 메소드가 호출됨
	public void aaa()
	{
		System.out.println("Model:aaa()");
	}
}
 */
public class SeoulModel {
	
	@RequestMapping("seoul/site.do")
	public String seoul_site(HttpServletRequest request, HttpServletResponse response)
	{
		 // DB 연동
	      // 1. 요청값 받기
	      String page=request.getParameter("page");
	      if(page==null)
	         page="1";
	      int curpage=Integer.parseInt(page);
	      // 2. DB 연동 
	      SeoulDAO dao=new SeoulDAO(); // 싱글턴 해야되는데 안만들어놔서 그냥 메모리 할당했다.
	       //System.out.println("seoul-dao="+dao);
	      List<SeoulVO> list=dao.seoulLocationListData(curpage,"seoul_location");
	      int totalpage=dao.seoulLocationTotalPage("seoul_location");
	      
	      request.setAttribute("curpage", curpage);
	      request.setAttribute("totalpage", totalpage);
	      request.setAttribute("list", list);
	      // 3. 결과값 모아서 request에 저장
	      request.setAttribute("main_jsp", "../seoul/site.jsp"); // main_jsp 에 include 했으니 return 은 다 main.jsp?
	      return "../main/main.jsp";

	}
	
	@RequestMapping("seoul/nature.do")
	public String seoul_nature(HttpServletRequest request, HttpServletResponse response)
	{
		// DB 연동
	      // 1. 요청값 받기
	      String page=request.getParameter("page");
	      if(page==null)
	         page="1";
	      int curpage=Integer.parseInt(page);
	      // 2. DB 연동 
	      SeoulDAO dao=new SeoulDAO(); // 싱글턴 해야되는데 안만들어놔서 그냥 메모리 할당했다.
	      List<SeoulVO> list=dao.seoulLocationListData(curpage,"seoul_nature");
	      int totalpage=dao.seoulLocationTotalPage("seoul_nature");
	      
	      request.setAttribute("curpage", curpage);
	      request.setAttribute("totalpage", totalpage);
	      request.setAttribute("list", list);
	      // 3. 결과값 모아서 request에 저장
		request.setAttribute("main_jsp", "../seoul/nature.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("seoul/sDetail.do")
	public String seoul_detail(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../seoul/sDetail.jsp");
		return "../main/main.jsp";
	}
}










