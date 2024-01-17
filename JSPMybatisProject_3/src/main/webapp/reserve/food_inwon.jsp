<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('.inwon').click(function () {
		let inwon=$(this).text();
		$('#food_inwon').text(inwon);
		$('#ok').show()
	})//click
})//function
</script>
</head>
<body>
	<table>
		<tr>
			<td><c:forEach var="i" begin="1" end="10">
			       <span class="btn btn-xs btn-info">${i }</span>
				</c:forEach>
				<span class="btn btn-xs btn-info">단체</span>
		    </td>
		</tr>
	</table>
</body>
</html>












