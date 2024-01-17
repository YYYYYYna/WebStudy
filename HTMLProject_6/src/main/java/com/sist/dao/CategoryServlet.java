package com.sist.dao;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
/*
 *    1. 사이트 주소가 /CategoryServlet 처럼 만들어 졌을때
 *       1) 톰캣에 의해 메모리 할당 => new CategoryServlet()
 *       2) init()
 *       3) service() : Thread => 사용자가 요청시 마다 호출되는 메소드
 *          =========
 *          =GET/POST를 동시에 처리함
 *       4) destory()
 */
@WebServlet("/Categoryservlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		//response안에는 client의 아이디를 저장하고 있음
		
		//요청값 받기
		String cno=request.getParameter("cno");
		if(cno==null)
		{
			cno="1";
		}
		
		//데이터 베이스 읽기 => html시작전에 읽어와야함
		FoodDAO dao=FoodDAO.newInstance();
		List<CategoryVO> list=dao.categoryListData(Integer.parseInt(cno));
		
		out.write("<html>");
		out.write("<head>");
		out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
		out.write("<style type=text/css>");
		out.write(".container{margin-top:50px;}");
		out.write(".row{margin:0px auto; width:900px;}");
		out.write("</style>");
		/*
		 * bootstrap => 모든 내용이 Class 속성
		 * CSS의 기본
		 * 1. * => 전체
		 * 2. 태그명
		 * 3. 아이디 (#) => 중복이 없음 = 한개만 변경
		 * 4. 클래스 (.) => 중복이 있음 = 여러개를 동시에 변경
		 */
		out.write("</head>");
		out.write("<body>");
		out.write("<div class=container>");
		out.write("<div class=row>");
		out.write("<a href=CategoryServlet?cno=1 class=\"btn btn-sm btn-danger\">믿고 보는 맛집 리스트</a> &nbsp;");
		out.write("<a href=CategoryServlet?cno=2 class=\"btn btn-sm btn-success\">지역별 맛집 리스트</a> &nbsp;");
		out.write("<a href=CategoryServlet?cno=3 class=\"btn btn-sm btn-primary\">메뉴별 맛집 리스트</a>");
		out.write("</div>");
		out.write("<div class=row>");
		for(CategoryVO vo:list)
		{
			out.write("<div class=\"col-md-4\">");
			out.write("<div class=\"thumbnail\">");
			out.write("<a href=FoodListServlet?cno="+vo.getCno()+">");
			out.write("<img src="+vo.getPoster()+" alt=\"Lights\" style=\"width:100%\">");
			out.write("<div class=\"caption\">");
			out.write("<p>"+vo.getTitle()+"</p>");
			out.write("</div>");
			out.write("</a>");
			out.write("</div>");
			out.write("</div>");
		}
		out.write("</div>");
		out.write("</div>");
		out.write("</body>");
		out.write("</html>");
		
	}

}
