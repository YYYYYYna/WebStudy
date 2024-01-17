<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String fd=request.getParameter("fd");
String ss=request.getParameter("ss");
String fno=request.getParameter("fno");

//1. 쿠키생성
Cookie cookie=new Cookie("food_"+fno,fno);

//2. 저장경로 설정
cookie.setPath("/");

//3. 저장기간
cookie.setMaxAge(60*60*24); //초단위라서 결국 24시간저장한다는뜻

//4. 쿠키를 브라우저로 전성
response.addCookie(cookie);

//5. 상세보기로 이동시키기
response.sendRedirect("detail.jsp?fno="+fno); //get방식이라서 ?뒤에 값을 넘겨야함
%>