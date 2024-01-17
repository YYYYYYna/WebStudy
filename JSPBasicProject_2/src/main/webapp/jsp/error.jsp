<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>에러가 발생했습니다.<%=request.getParameter("data") %></h1>
<%--지금 이 error방법이 forword방법임... error를 넘겨줄때 URL값은 여전히 basic_1이기때문 == request값을 공유한다는뜻 --%>
</body>
</html>