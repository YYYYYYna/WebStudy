package com.sist.board;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// GET/POST 두가지방식을 통합 => service()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HTML로 변환을 시킨다음에 브라우저로 전송하는 역할을 여기서 수행함
		response.setContentType("text/html;charset=UTF-8");
		/*
		 * request와 response는 Spring에서도 쓰임으로 꼭 잊지말기
		 * 
		 * request (요청) (=사용자가 보낸값)
		 *     => getParameter("태그의 name속성")
		 * response (응답)
		 *     => 3가지중 어떤 형태로 실행을 요청할건지 결정해야함
		 *        1.HTML ==> text/html ==> HTML 
		 *        2.XML  ==> text/xml ==> AJAX
		 *        3.JSON ==> text/plain ==> VueJS,ReactJS
		 *     => 실행을 설정하는 메소드 : setContentType()
		 *     => 화면을 이동하는 메소드 : sendRedirect()
		 *                            ==============GET
		 *     => 화면 전송 : <a> (GET방식)
		 *                : <form> (GET/POST방식)
		 *                         =============
		 *                         그외 GET으로 받을때는 doGet / Post는 doPost
		 */
		
		/*
		 * 데이터를 전송할때
		 * => 전송없이 수행 => GET (주로 HTML 화면 출력)
		 * => GET방식이라면? => DEFAULT => doGET으로 실행해야함 (POST로 받으면 오류남)
		 * 
		 * <input> = 사용자가 입력해서 서버로 전송
		 */
		//전송해야하는 브라우저 설정하기
		PrintWriter out=response.getWriter(); //=response에 저장된 값을 보낸다는 뜻
		//사용자로부터 페이지를 받기 => request
		//BoardListServlet?page=1
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		//데이터 받기
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curpage);
		
		//HTML
		int totalpage=dao.boardTotalPage();
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=stylesheet href=table.css>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center>");
		/*
		 * 104page
		 * 태그
		 * ---
		 * 각각의 속성에 따라 출력되는 크기가 다르니까 유념하기
		 * inline속성
		 *  <span>
		 *  <input>, <img>, <a>
		 * block속성
		 *  <div>
		 *  <h1>~<h6>
		 *  <table>, <ul>, <ol>, <dl> ==> 목록출력
		 */
		out.println("<h1>자유게시판</h1>");
		
		out.println("<table class=table_content width=800>");
		out.println("</tr>");
		out.println("<td>");
		out.println("<a href=BoardInsertServlet>새글</a>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		
		out.println("<table class=table_content width=800>");
		out.println("<tr>");
		out.println("<th width=10% align=center>번호</th>");		
		out.println("<th width=45% align=center>제목</th>");		
		out.println("<th width=15% align=center>이름</th>");		
		out.println("<th width=20% align=center>작성일</th>");		
		out.println("<th width=10% align=center>조회수</th>");		
		out.println("</tr>");
		
		for(BoardVO vo:list)
		{
			out.println("<tr height=35>");
			out.println("<td width=10% align=center>"+vo.getNo()+"</td>");		
			out.println("<td width=45%><a href=BoardDetailServlet?no="+vo.getNo()+">"+vo.getSubject()+"</a></td>");		
			out.println("<td width=10% align=center>"+vo.getName()+"</td>");
			out.println("<td width=15% align=center>"+vo.getRegdate().toString()+"</td>");		
			out.println("<td width=20% align=center>"+vo.getHit()+"</td>");				
			out.println("</tr>");
		}
		
		out.println("</table>");
		
		out.println("<table class=table_content width=800>");
		out.println("<tr>");
		out.println("<td align=left>");
		out.println("<select name=fs>");
		out.println("<option value=name>이름</option>");
		out.println("<option value=subject>제목</option>");
		out.println("<option value=content>내용</option>");		
		out.println("</select>");
		out.println("<input type=text name=ss size=20>");		
		out.println("<input type=button value=검색>");		
		out.println("</td>");
		out.println("<td align=right>");
		out.println("<a href=BoardListServlet?page="+(curpage>1?curpage-1:curpage)+">이전</a>&nbsp;");
		out.println(curpage+" page / "+totalpage+" pages");
		out.println("<a href=BoardListServlet?page="+(curpage<totalpage?curpage+1:curpage)+">다음</a>");		
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}

}



