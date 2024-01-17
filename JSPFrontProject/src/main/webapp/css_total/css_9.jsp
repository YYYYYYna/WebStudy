<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	width: 100px;
	height: 100px;
	background-color:lightblue;
	outline: 5px solid black; 
}
.wrap{
    display: flex;
    flex-direction: column;
}
.main{
    display: flex;
}
</style>
</head>
<body>
   <div class="wrap">
      <div class="header">header</div>
      <div class="main">
         <div>aside</div>
         <div>main</div>
         <div>section</div>
      </div>
      <div>footer</div>
   </div>
</body>
</html>