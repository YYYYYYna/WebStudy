package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
/*
 *   DAO => 오라클 연결
 *   Model => 요청을 받아서 처리를 해줌 => 결과값을 request에 모아두는것
 *   Controller => model에서 모아둔 request를 jsp로 전송
 */
public class StoreModel2 {
	@RequestMapping("store/all.do")
	public String store_all(HttpServletRequest request, HttpServletResponse response)
	{
		//요청을 할때 확장자 => .do
		//파일을 읽을때(include)할때 확장자 => .jsp
		
		//1.요청값 받기
		//all.jsp => 데이터 베이스 결과값을 전송(request)
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		//2. DB 연동
		GoodsDAO dao=GoodsDAO.newInstance();
		List<GoodsVO> list=dao.goodsAllListData(curpage);
		int totalpage=dao.goodsAllTotalPage();
		request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("list", list);
	    //3-1. 쿠키데이터 전송하기
	    Cookie[] cookies=request.getCookies();
	    List<GoodsVO> cList=new ArrayList<GoodsVO>();
	    if(cookies!=null)
	    {
	    	for(int i=cookies.length-1;i>=0;i--)
	    	{
	    		if(cookies[i].getName().startsWith("goods_"));
	    		{
	    			String no=cookies[i].getValue();
	    			GoodsVO vo=dao.goodsCookieData(Integer.parseInt(no));
	    			cList.add(vo);
	    		}
	    	}
	    }
	    request.setAttribute("cList", cList);
	    request.setAttribute("count", cList.size());
		//3-2. 결과값 모아서 request에 저장
		request.setAttribute("store_jsp", "../store/all.jsp");
		request.setAttribute("main_jsp", "../store/store_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("store/sp.do")
	public String store_sp(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("store_jsp", "../store/sp.jsp");
		request.setAttribute("main_jsp", "../store/store_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("store/best.do")
	public String store_best(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("store_jsp", "../store/best.jsp");
		request.setAttribute("main_jsp", "../store/store_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("store/detail_before.do")
	public String store_detail_before(HttpServletRequest request, HttpServletResponse response)
	{
		//쿠키는 해당 상품에대한 번호만 저장해서 불러오면됨
		String no=request.getParameter("no");
		Cookie cookie=new Cookie("goods_"+no,no);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		//브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../store/detail.do?no="+no;
	}
	
	@RequestMapping("store/detail.do")
	public String store_detail(HttpServletRequest request, HttpServletResponse response)
	{
		//사용자는 no로 보낼 예정
		String no=request.getParameter("no");
		GoodsDAO dao=GoodsDAO.newInstance();
		GoodsVO vo=dao.goodsAllDetailData(Integer.parseInt(no));
		String price=vo.getGoods_price();
		price=price.replaceAll("[^0-9]", ""); //숫자를 제외하고 전부 공백으로 바꾸라는뜻
		vo.setPrice(price);
		request.setAttribute("vo", vo);
		//${} => request.getAttribute("store_jsp");
		request.setAttribute("store_jsp", "../store/detail.jsp");
		request.setAttribute("main_jsp", "../store/store_main.jsp");
		return "../main/main.jsp";
	}
}
