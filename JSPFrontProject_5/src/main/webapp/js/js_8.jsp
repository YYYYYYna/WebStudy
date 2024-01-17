<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 2) 고전 이벤트 모델
	window.onload = function() {
		//2-1)사진 hover효과
		let img = document.querySelector("img")
		img.onmouseover = function() {
			img.style.opacity = 0.5
		}
		//2-1)익명의 함수 이용
		img.onmouseout = function() {
			img.style.opacity = 1;
		}
		//2-2)버튼추가
		let button=document.querySelector("button")
		button.onclick=function(){
			alert("버튼클릭!!")
		}
	}
</script>
</head>
<body>
	<img src="../image/m1.jpg">
	<p></p>
	<button>클릭</button>
</body>
</html>