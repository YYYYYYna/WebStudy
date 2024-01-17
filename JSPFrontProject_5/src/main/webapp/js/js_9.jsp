<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
     이벤트 리스너 이용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//4) 이벤트 리스너 모델
	window.onload = function() {
		let h1 = document.querySelector("#h1")
		let gBtn = document.querySelector('#green')
		let bBtn = document.querySelector('#blue')
		let rBtn = document.querySelector('#red')
		/*
		만약 jquery엿다면
		let h1=$(#h1)
		으로 작성가능
		 */
		//이렇게 내부에서 처리하는게 이벤트 리스너
		gBtn.addEventListener('click', function() {
			h1.style.color="green"
		});
		bBtn.addEventListener('click', function() {
			h1.style.color="blue"
		});
		rBtn.addEventListener('click', function() {
			h1.style.color="red"
		});
		/*
		만약 jquery엿다면
		h1.on('click',function(){
		});
		으로 작성가능
		 */
	}
</script>
<style type="text/css">
body {
   text-align: center;
}
</style>
</head>
<body>
	<h1 id="h1">제목</h1>
	<button id="green">green</button>
	<button id="blue">blue</button>
	<button id="red">red</button>
</body>
</html>