<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    자바스크립트 반복문 종류 예시
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//do~while
	let i=1;
	do{
		document.write("i="+i+"<br>");
		i++;
	}while (i<=10)
	document.write("<hr>")
	
	//while
	document.write("<h3>while</h3>")
	document.write("i="+i+"<br>")
	i=1;
	while (i<=10) {
		document.write("i="+i+"<br>")
		i++;
	}
	document.write("<hr>")
	
	//for
	document.write("<h3>for</h3>")
	for(i=1;i<=10;i++)
		{
		 document.write("i="+i+"<br>")
		}
	document.write("<hr>")
	
	//break : 조건식에서 반복중단
	document.write("<h3>break</h3>")
	for(i=1;i<=10;i++)
		{
		if(i==5) break;//i===5일때 멈춤
		document.write("i="+i+"<br>")
		}
	document.write("<hr>")
	
	//continue : 특정부분을 제외할때 사용
	document.write("<h3>continue</h3>")
	for(i=1;i<=10;i++)
		{
		if(i==5) continue; //i===5일때 제외하고 증가식으로 이동
		document.write("i="+i+"<br>")
		}
	document.write("<hr>")
}
</script>
</head>
<body>

</body>
</html>