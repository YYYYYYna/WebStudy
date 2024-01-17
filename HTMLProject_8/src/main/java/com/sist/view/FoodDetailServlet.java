package com.sist.view;

import java.io.*;
import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FoodDetailServlet")
public class FoodDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//사용자가 보내준 값=request
		String fno=request.getParameter("fno");
		
		//fno에 해당되는 데이터 정보를 가져오기 => FoodDAO
		
		
		//최신 방문(쿠키저장)
		//**주의사항 : 한 파일 안에서 response를 두번쓰면 안됨!!
		
		
		//데이터베이스 연동
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.FoodDetailData(Integer.parseInt(fno));
		
		//읽어온 데이터를 html에 출력하기
		
		 // 5. 데이터를 HTML를 이용해서 출력
	      out.write("<html>");
	      out.write("<head>"); // CSS / JavaScript 가 없는 경우 생략 해도 된다
	      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
	      out.write("<style type=text/css>");
	      out.write(".container{margin-top:50px}");
	      // margin:10px 10px 10px 10px 
	      //        top right bottom left
	      out.write(".row{margin:0px auto;width:900px}"); // auto -> 가운데 정렬
	      out.write(".a{margin-left:5px}");
	      out.write("</style>");
	      out.write("</head>");
	      out.write("<body>"); // 화면 UI
	      out.write("<div class=container>"); // container : 전체 영역 만들어주는 것 (wrapper 도 비슷)
	      out.write("<div class=row>"); // 맛집 이미지. 내용이 달라질 떄 영역 구분 = row
	      out.write("<table class=table>");
	      out.write("<tr>");
	      StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
	      while(st.hasMoreTokens())
	      {
	    	  out.write("<td>");
	    	  out.write("<img src="+st.nextToken()+" style=\"width:100%\" class=img-rounded>");
	    	  out.write("</td>");
	      }
	      out.write("</tr>");	      
	      out.write("</table>");
	      out.write("</div>");
	      out.write("</div>");
	      out.write("<div style=\"height:30px\"></div>");
	      out.write("<div class=row>");
	      out.write("<div class=col-sm-8>");
	      out.write("<table class=table>");
	      out.write("<tr>");
	      out.write("<td colspan=2>");
	      out.write("<h3>"+vo.getName()+"&nbsp;<span style=\"color:orange\">"+vo.getScore()+"</span></h3>");
	      out.write("<td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>주소</th>");
	      out.write("<td width=85%>"+vo.getAddress()+"</td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>전화</th>");
	      out.write("<td width=85%>"+vo.getPhone()+"</td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>음식종류</th>");
	      out.write("<td width=85%>"+vo.getType()+"</td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>가격대</th>");
	      out.write("<td width=85%>"+vo.getPrice()+"</td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>영업시간</th>");
	      out.write("<td width=85%>"+vo.getTime()+"</td>");
	      out.write("</tr>");
	      
	      out.write("<tr>");
	      out.write("<th width=15%>주차</th>");
	      out.write("<td width=85%>"+vo.getParking()+"</td>");
	      out.write("</tr>");
	      
	      if(!vo.getMenu().equals("no"))
	      {
	    	  out.write("<tr>");
		      out.write("<th width=15%>메뉴</th>");
		      out.write("<td width=85%>");
		      out.write("<ul>");
		      st=new StringTokenizer(vo.getMenu(),"원");
		      while(st.hasMoreTokens())
		      {
		    	  out.write("<li>"+st.nextToken()+"원</li>");
		      }
		      out.write("</ul>");
		      out.write("</td>");
		      out.write("</tr>");
	      }
	      
	      out.write("<tr>");
	      out.write("<td colspan=2 class=text-right>");
	      out.write("<a href=# class=\"btn btn-xs btn-danger\">좋아요</a>");
	      out.write("<a href=# class=\"btn btn-xs btn-success\">찜하기</a>");
	      out.write("<a href=# class=\"btn btn-xs btn-info\">예약</a>");
	      out.write("<a href=FoodListServlet class=\"btn btn-xs btn-primary\">목록</a>");
	      out.write("</td>");
	      out.write("</tr>");
	      
	      out.write("</table>");
	      out.write("</div>");
          out.write("<div class=col-sm-4>");
	      out.write("</div>");
	      out.write("</div>");
	      out.write("</div>");
	      out.write("</body>");
	      out.write("</html>");
	      
		  //자동으로 브라우저에서 읽어간다
	}

}















