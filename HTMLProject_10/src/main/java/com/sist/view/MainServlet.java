package com.sist.view;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
      // 사용자 요청값 
		String mode=request.getParameter("mode");
      /*
       * 요청값은..getParameter로 받는듯...왜냐면 저번에 FoodDAO할때 page값을 getParameter로 받음
       * 요청값=매개변수 개념인듯???
       */
      if(mode==null)
			mode="1";
		String name="";
		switch(mode)
		{
		case "1":
			name="GoodsAllServlet";
			break;
		case "2":
			name="GoodsSpecialServlet";
			break;
		case "3":
			name="GoodsBestServlet";
			break;
		case "4":
			name="GoodsNewServlet";
			break;
		case "5":
			name="GoodsDetailServlet";
			break;
		}
      /*
       * 그리고 주의할점은 request."get"RequestDispatcher 처럼 get으로 받았는데
       * 따로 set으로 넘기지 않아도 되는 이유는 DAO메소드에서 set의 역할을 대신하기 때문
       */
      out.write("<html>");
		out.write("<head>");
		out.write("</head>");
		out.write("<body>");
		RequestDispatcher rd=request.getRequestDispatcher("MenuServlet");
		rd.include(request, response);
      /*
       *  <jsp:include page="">
       *  jsp에서는 page가 this의 개념이라함 잘모르겟음;
       *  같은 css를 출력할때 이렇게 include(request, response)를 사용하는듯??
       *  근데 <head></head>라인이 끝났는데 어케 css가 들어가지?
       *  ==> 이거 그냥 java에서 데이터값 받은거라 html 위치 상관 없음
       */
		out.write("<div style=\"height:30px\"></div>");
		out.write("<div class=container>");
		rd=request.getRequestDispatcher(name);
		rd.include(request, response);// 모든 서블릿이 request를 공유 
		out.write("</div>");
		out.write("</body>");
		out.write("</html>");
		
		
   }

}