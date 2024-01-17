<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
   
<%--core테그가져오기 : import와 역할이 같음 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
      JSTL => 자바의 제어문 => 태그로 만들어져 있다.
      ====
      core가 기본
      : 변수설정, 제어문처리, URL(화면이동)과 관련 => 태그를 이용함
      : prefix="c" 라면? <c:...으로 명명됨 c가 default
      : <c:set> 변수설정
        <c:set var="today" value="2023-12-11"/>
        해당값은 일반 변수값이 아닌 request.setAttribute("today","2023-12-11");
        따라서 ${today} 로 출력 가능 <% %>로 출력 안함!
      : <c:redirect url="a.jsp">
        해당값은 response.sendRedirect("a.jsp");
      : <c:if> if문 
        다중 조건문으로 else문 없이 만들어야함
      : <c:forEach> for문
      : <c:choose> switch
      : <c:forTokens>
      
      그외
      format / xml / sql / fn => String 메소드
      ======               == 가 중요 
      
--%>

<%
List<String> list=new ArrayList<String>();
list.add("홍길동");
list.add("심청이");
list.add("박문수");
list.add("이순신");
list.add("강감찬");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl_1_core</title>
</head>
<body>
   <h1>Java : for문</h1>
   <%
   for(int i=1;i<=10;i++)
   {
   %>
       <%=i %>&nbsp;
   <%
   }
   %>
   <h1>JSTL : for문</h1>
   <c:forEach var="i" begin="1" end="10" step="1">
     ${i}&nbsp;
   </c:forEach>
   
   <h1>Java : for-each구문 예시</h1>
   <ul>
   <%
   for(String name:list)
   {
   %>
      <li><%=name %></li>
   <%
   }
   %>
   </ul>
   
   <h1>JSTL : for-each구문 예시</h1>
   <ul>
      <c:forEach var="name" items="${name }">
         <li>${name }</li>
      </c:forEach>
   </ul>
</body>
</html>