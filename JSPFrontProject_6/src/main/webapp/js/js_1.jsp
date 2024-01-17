<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let index=1;
window.onload=function(){
	setInterval('show()',500);
}
function show() {
	index++;
	if(index>7)
		index=1
	let img=document.querySelector('img')
	img.src='../image/m'+index+'.jpg'
	img.width='570'
}
</script>
</head>
<body>
	<center>
		<img src="../image/m1.jpg">
	</center>
</body>
</html>