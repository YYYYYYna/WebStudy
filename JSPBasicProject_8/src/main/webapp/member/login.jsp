<%@page import="com.sist.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"/>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

MemberVO vo=dao.isLogin(id, pwd);
if(vo.getMsg().equals("NOID"))
{
%>
   <script type="text/javascript">
    alert("아이디가 존재하지 않습니다.");
    history.back();
   </script>
<%	
}
else if(vo.getMsg().equals("NOPWD"))
{
%>
	<script type="text/javascript">
	  alert("비밀번호가 틀립니다.");
	  history.back();
	</script>
<%		
}
else if(vo.getMsg().equals("OK"))
{
	//여긴 로그인이 된상태임
	//가장먼저 할일은? 1. 세션에 저장
	session.setAttribute("id", vo.getId());
	session.setAttribute("name", vo.getName());
	session.setAttribute("admin", vo.getAdmin());
	
	//두번째로 할일은
	response.sendRedirect("../main/main.jsp");
}
%>
