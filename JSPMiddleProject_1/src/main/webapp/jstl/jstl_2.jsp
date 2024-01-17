<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:forTokens와 c:if 예제</title>
</head>
<body>
   <h1>&lt;c:forTokens&gt;</h1>
   <c:forTokens items="m1,m2,m3,m4,m5,m6" delims="," var="image">
      <img src="${image }.jpg" width="150">
   </c:forTokens>
   
   <h1>&lt;c:if&gt; : 짝수예제</h1>
   <c:forEach var="i" begin="1" end="10">
      <c:if test="${i%2==0 }">
         ${i }&nbsp;
      </c:if>
   </c:forEach>
   
   <h1>&lt;c:if&gt; : 홀수예제</h1>
   <c:forEach var="i" begin="1" end="10">
      <c:if test="${i%2!=0 }">
         ${i }&nbsp;
      </c:if>
   </c:forEach>
   
   <%--조건문은 문자도 가능하단걸 잊지 말기 --%>
</body>
</html>