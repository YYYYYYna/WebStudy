package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class ListModel implements Model {

	@Override
	public String handleRequest(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		//jsp로 보내는 값을 설정
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		return "board/list.jsp";
	}

}
