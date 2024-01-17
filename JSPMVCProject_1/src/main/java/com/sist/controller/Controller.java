package com.sist.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;

@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /*
     *  사용자 요청시마다 호출되는 메소드
     *  => doGet() / doPost()
     *  => service => doGet()/doPost()를 통합
     *  
     *  모든요청에는 반드시 Controller가 필요하다
     *  /Controller?cmd=list 라면? => list model을 찾을수 있도록 만듬
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getParameter("cmd");
		String jsp="";
		//나중엔 if문 대신 map으로 간결하게 코드 작성 가능
		if(cmd.equals("list"))
		{
			ListModel model=new ListModel();
			jsp=model.execute(request);
			//jsp하나하나가 주문한 table이라고 생각하면됨
		}
		else if(cmd.equals("insert"))
		{
			InsertModel model=new InsertModel();
			jsp=model.execute(request);
		}
		else if(cmd.equals("update"))
		{
			UpdateModel model=new UpdateModel();
			jsp=model.execute(request);
		}
		else if(cmd.equals("delete"))
		{
			DeleteModel model=new DeleteModel();
			jsp=model.execute(request);
		}
		
		//request를 해당 JSP로 전송
		RequestDispatcher rd=request.getRequestDispatcher("view/"+jsp);
		rd.forward(request, response);
	}

}
