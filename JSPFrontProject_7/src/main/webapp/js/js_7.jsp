<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
      JSON 변환
 --%>
<script type="text/javascript">
window.onload=function(){
	let info={name:"홍길동" , age:20 , sex:"남자"};
	console.log(info)
	
	let data=JSON.stringify(info)
	console.log(data)
	
	let change=JSON.parse(data)
	console.log(change)
}
</script>
</head>
<body>

</body>
</html>