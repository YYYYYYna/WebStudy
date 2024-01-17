<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function()
{
    func();
}
function func() {
	document.write("func() 1...")
}
function func() { //오버라이딩된걸로 출력됨
	document.write("func() 오버라이딩...")
}
</script>
</head>
<body>

</body>
</html>