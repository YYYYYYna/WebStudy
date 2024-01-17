<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>switch예제</title>
</head>
<body>
   <h1>자바(switch)</h1>
   <%
       int i=2;
       switch(i)
       {
    	   case 0:
   %>
       ♡♡♡
   <%
    	   break;
    	   case 1:
   %>
       ♥♡♡
   <%
    	   break;
    	   case 2:
   %>
       ♥♥♡
   <%    

           break;
           case 3:
   %>
      ♥♥♥
   <%  
       }
   %>
   <%--
   <c:set> 에 관산 속성정리)
   - value 속성 : 값을 입력합니다.  EL을 사용할 수 있습니다.
   - target 속성 : 프로퍼티를 설정할 빈 또는 맵을 가집니다.
   - property 속성 : 설정할 프로퍼티 입니다.
   - var 속성 : 값이 저장되는 변수명 입니다.
   - scope 속성 : 변수가 저장된  Scope 입니다. 
                 page, request, session, 
                 application 을 가질 수 있고, 
                 기본값은 page 입니다.
   --%>
   <h1>&lt;c:choose&gt;</h1>
   <c:set var="i" value="2"/>
   <%--value값에 해당되는 값으로 출력됨 난 2로 해놔서 하트2개출력 --%>
   <c:choose>
     <c:when test="${i==0 }">♡♡♡</c:when>
     <c:when test="${i==1 }">♥♡♡</c:when>
     <c:when test="${i==2 }">♥♥♡</c:when>
     <c:when test="${i==3 }">♥♥♥</c:when>
   </c:choose>
   
    <h1>&lt;c:choose&gt : 신영오빠 파일</h1>
  <c:set var="i" value="4"/>
  <%--value값에 해당되는 값으로 출력됨 오빠는 별4개출력 --%>
  <c:choose>
   <c:when test="${i==0 }">☆☆☆☆☆</c:when>
   <c:when test="${i==1 }">★☆☆☆☆</c:when>
   <c:when test="${i==2 }">★★☆☆☆</c:when>
   <c:when test="${i==3 }">★★★☆☆</c:when>
   <c:when test="${i==4 }">★★★★☆</c:when>
   <c:when test="${i==5 }">★★★★★</c:when>
  </c:choose>
</body>
</html>