<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let img=document.getElementById("image")
	//img.width=570 이렇게 크기 제어 가능
}
function change() {
	let img=document.getElementById("image")
	img.src='../image/m2.jpg';
	
	let div=document.getElementById("msg")
	div.textContent="새로운 이미지로 변경되었습니다.";
}
</script>
</head>
<body>
	<img id="image" src="../image/m1.jpg">
	<div id="msg">버튼클릭시 이미지 변경</div>
	<input type="button" value="변경" onclick="change()">
</body>
</html>