package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
import com.sist.vo.*;

//JSP에서 요청을 받아서 요청 처리후에 결과값을 request/session에 담아서 jsp로 넘겨주기 
//model에서 결과값을 추가해서 jsp로 request를 보내는게 setAttribute
public class GoodsModel {
	public void goodsListData(HttpServletRequest request)
	{
		String type=request.getParameter("type");
		if(type==null)
		{
			type="1";
		}
		String page=request.getParameter("page");
		if(page==null)
		{
			page="1";
		}
		
		//페이지 지정
		int curpage=Integer.parseInt(page);
		
		//페이지에 해당되는 목록
		GoodsDAO dao=new GoodsDAO();
		List<GoodsVO> list=dao.goodsAllListData(curpage, Integer.parseInt(type));
		int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
		{
			endPage=totalpage;
		}
		
		//JSP에서 출력할 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("type", type);
	}
	
	public void goodsDetailData(HttpServletRequest request)
	{
		//요청값을 받는다
		//table, no, type
		String table=request.getParameter("table"); //테이블번호
		String no=request.getParameter("no");       //상품번호
		String type=request.getParameter("type");   //화면변경
		
		//요청에 해당되는 데이터 베이스 값을 읽기
		GoodsDAO dao=new GoodsDAO();
		 GoodsVO vo=dao.goodsDetailData(Integer.parseInt(table), Integer.parseInt(no));

		
		//request값에 담아준다
		request.setAttribute("type", table);
		request.setAttribute("vo", vo);
		//=======detail.jsp 로 보냄
	}
}
