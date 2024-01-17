<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row4">
		<footer id="footer" class="clear">
			
			<div class="one_third first">
				<h6 class="title">공지사항</h6>
				<ul class="nospace linklist">
					<c:forEach var="novo" items="${nolist }">
					<li><a href="${nvo.link }"></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="one_third">
				<h6 class="title">오늘의 뉴스</h6>
				<ul class="nospace linklist">
					<li><a href="#">Home Page</a></li>
					<c:forEach var="nvo" items="${nlist }" varStatus="s">
					<c:if test="">
					<li><a href="${nvo.link }">${nvo.title }</a></li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="one_third">
				<h6 class="title">인기있는 맛집</h6>
				<ul class="nospace linklist">
				   <c:forEach var="fvo" items="${flist }">
					<li><a href="../food/food_before_detail.do?fno=${fvo.fno }">${fvo.title }</a></li>
				   </c:forEach>
				</ul>
			</div>
		</footer>
	</div>
	<div class="wrapper row5">
		<div id="copyright" class="clear">
			<p class="fl_left">
				Copyright &copy; 2023 - 강북쌍용교육센터 - <a href="#">D강의실</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="https://www.os-templates.com/"
					title="Free Website Templates">D강의실</a>
			</p>
		</div>
	</div>
</body>
</html>