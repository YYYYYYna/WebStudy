<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
     이벤트 리스너 이용 : => 사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
   text-align: center;
}
#box{
   margin: 0 auto;
   width: 200px;
   height: 200px;
   border: 1px solid black;
}
</style>
<script type="text/javascript">
window.onload=function(){
	let div=document.querySelector('#box')
	                                //이부분 function(){}에서 ()=>{}으로 바꿈
	div.addEventListener('mousedown',()=>{
		box.style.background='pink';
	})
	div.addEventListener('mouseup',event=>{
		event.currentTarget.style.background='orange';
	})
}
</script>
</head>
<body>
	<div id="box"></div>
</body>
</html>