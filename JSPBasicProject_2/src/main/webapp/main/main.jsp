<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   *{
   text-align: center;
   }
   .container {
	width: 800px;
	height: 700px;
	border: 2px solid red;
	position: relative;
}
    .header{
    width: 800px;
    height: 150px;
    border: 2px solid cyan;
    }
    .aside{
    width: 200px;
    height: 400px;
    border: 2px solid blue;
    position: absolute;
    left: 0;
    }
    .section{
    width: 600px;
    height: 400px;
    border: 2px solid magenta;
    position: absolute;
    right: 0;
    }
    .footer{
    width: 800px;
    height: 150px;
    border: 2px solid black;
    position: absolute;
    bottom: 0;
    }
</style>
</head>
<body>
   <div class="container">
       <div class="header">
          <%@ include file="header.jsp" %>
       </div>
       <div class="aside">
          <%@ include file="aside.jsp" %>
       </div>
       <div class="section">
          <%@ include file="section.jsp" %>
       </div>
       <div class="footer">
          <%@ include file="footer.jsp" %>
       </div>
   </div>
</body>
</html>