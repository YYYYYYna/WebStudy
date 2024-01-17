package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class fListModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
		{
			page="1";
		}
		int curpage=Integer.parseInt(page);
		FuneralDAO dao=FuneralDAO.newInstance();
		List<FuneralVO> list=dao.funeralAllListData(curpage);
		int totalpage=dao.funeralTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		return "funeral/list.jsp";
	}

}
