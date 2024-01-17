<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%-- 여긴 html 부분이 아니라 데이터 처리하는 부분 : servlet으로 따지면 dopost부분! --%>

<%       
      //1. 요청데이터 가지고 오기
      request.setCharacterEncoding("UTF-8");
      String name=request.getParameter("name");
 	  String subject=request.getParameter("subject");
 	  String content=request.getParameter("content");
 	  String pwd=request.getParameter("pwd");
  	  // page / no
 	  String no=request.getParameter("no");
 	  String curpage=request.getParameter("page");
 	  BoardVO vo=new BoardVO();
 	  vo.setName(name);
 	  vo.setSubject(subject);
 	  vo.setContent(content);
 	  vo.setPwd(pwd);
 	  vo.setNo(Integer.parseInt(no));

      //2. 데이터 베이스 연동
      BoardDAO dao=BoardDAO.newInstance();
      boolean bCheck=dao.boardUpdate(vo);
      
      //3. 화면 이동
      //3-1. 비밀번호가 틀렸을때 => history.back()
      if(bCheck==false)
      {
   %> 
   
       <script>
        alert("비밀번호가 틀립니다.");
        history.back();
       </script>
  <% 
      }
      else
      {
    	  response.sendRedirect("detail.jsp?no="+no+"&page="+curpage);
    	  //sendRedirect는 get방식이다
      }
      //3-2. 비밀번호가 맞았을때 => detail.jsp
%>
