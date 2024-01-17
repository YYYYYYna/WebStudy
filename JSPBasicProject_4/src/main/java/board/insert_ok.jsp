<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%--아래가 메모리할당 --%>
<jsp:useBean id="dao" class="com.sist.dao.BoardDAO"/>

<jsp:useBean id="bean" class="com.sist.dao.BoardBean">
  <%--
      bean.setName(request.getParameter("name"))
      bean.setNo(Integer.parseInt(request.getParameter("no")))
   --%>
  <jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
    
<%
//id가 등록되면 객체로도 사용이 가능 => 컴파일싱 자동으로 자바로변경
dao.boardInsert(bean);
response.sendRedirect("list.jsp");
%>