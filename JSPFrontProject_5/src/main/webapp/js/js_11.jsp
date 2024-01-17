<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//이전에 만든 jsp_10.jsp를 팝업으로 만드는법 => 우편번호입력에 주로 쓰임
	let btn=document.querySelector("button")
	btn.addEventListener('click',()=>{
		window.open('js_10.jsp','post','width=450, height=500')
	})
}
</script>
</head>
<body>
	<button>클릭</button>
</body>
</html>