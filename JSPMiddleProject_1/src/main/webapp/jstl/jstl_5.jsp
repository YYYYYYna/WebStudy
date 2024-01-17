<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
     fn => String 메소드에서만 가능
--%>

<%
     String msg="Hello JSTL";
%>
<c:set var="msg" value="Hello JSTL"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prefix="fn" functions 예제</title>
</head>
<body>
   <h1>String(자바)</h1>
   <%=msg.length() %> <br>
   <%=msg.substring(0,5) %>
   
   
   <h1>String(jstl)</h1>
   ${fn:length(msg) } <br>
   ${fn:substring(msg,0,5) } <br>
</body>
</html>