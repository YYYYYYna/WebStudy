package com.sist.model;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.sist.dao.*;
import com.sist.vo.*;
public class FuneralModel {
	
	
	public void funeralListData(HttpServletRequest request)
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

	    int curpage=Integer.parseInt(page);
		
	    FuneralDAO dao=new FuneralDAO();
		List<FuneralVO> list=dao.funeralAllListData(Integer.parseInt(type));
		int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
		
		final int BLOCK=8;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
		{
			endPage=totalpage;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("type", type);
	}
}
