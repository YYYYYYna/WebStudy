<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<!DOCTYPE html>

<%
//한글 디코딩
request.setCharacterEncoding("UTF-8");

//데이터를 받는다
String hakbun=request.getParameter("hakbun");
String name=request.getParameter("name");
String kor=request.getParameter("kor");
String eng=request.getParameter("eng");
String math=request.getParameter("math");

//데이터 묶기
StudentBean sb=new StudentBean();
sb.setHakbun(Integer.parseInt(hakbun));
sb.setName(name);
sb.setKor(Integer.parseInt(kor));
sb.setEng(Integer.parseInt(eng));
sb.setMath(Integer.parseInt(math));

//오라클
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>학생 정보</h1>
   <p>학번 : <%=sb.getHakbun() %></p>
   <p>이름 : <%=sb.getName() %></p>
   <p>국어 : <%=sb.getKor() %></p>
   <p>영어 : <%=sb.getEng() %></p>
   <p>수학 : <%=sb.getMath() %></p>
</body>
</html>