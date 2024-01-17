<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../main/main.do">MVC Mini Project</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../main/main.do">Home</a></li>
      <li><a href="../member/join.do">회원가입</a></li>
      <li><a href="../reserve/date.do">예약</a></li>
      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">맛집
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../food/list.do">맛집 목록</a></li>
          <li><a href="../food/find.do">맛집 검색</a></li>
          <li><a href="#">맛집 예약</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">여행
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../seoul/site.do">명소</a></li>
          <li><a href="../seoul/nature.do">자연&관광</a></li>
          <li><a href="#">쇼핑</a></li>
        </ul>
      </li>
      <li><a href="../store/all.do">store</a></li>
         <!-- 난 이부분이 ../store/store_main.do 라고 생각했음.. -->
    </ul>
  </div>
 </nav>
</body>
</html>