<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   session.invalidate(); // 전체내용을 삭제할 때 사용
   response.sendRedirect("../main/main.jsp");
   
%>