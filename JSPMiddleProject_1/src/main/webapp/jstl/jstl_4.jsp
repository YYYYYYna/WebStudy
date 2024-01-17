<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prefix="fmt"예제</title>
</head>
<body>
    <h1>날짜변환(자바)</h1>
<%
    Date date=new Date();
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    String today=sdf.format(date);
%>
    <%=today %>

    <h1>날짜변환(jstl)</h1>
    <c:set var="today" value="<%=date %>"/>
    ${today } <br>
    <p><b>아래는 pattern변경</b></p>
    <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
    
    <h1>숫자변환(자바)</h1>
<%
    int a=12345678;
    DecimalFormat d=new DecimalFormat("##,###,###");
    String s=d.format(a);
%>
    <%=s %>
    
    <h1>숫자변환(jstl)</h1>
    <c:set var="s" value="<%=a %>"/>
    ${s }
    <p><b>아래는 pattern변경</b></p>
    <fmt:formatNumber value="${s }" pattern="##,###,###"/>
</body>
</html>