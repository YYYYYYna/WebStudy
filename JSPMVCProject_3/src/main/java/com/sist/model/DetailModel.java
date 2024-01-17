package com.sist.model;
import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.model.Model;
import com.sist.vo.BoardVO;

public class DetailModel implements Model {

    @Override
	public String handleRequest(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetail(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		//request
		return "board/detail.jsp";
	}

}
