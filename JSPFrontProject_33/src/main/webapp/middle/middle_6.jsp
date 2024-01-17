<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     316page => 함수
     => 함수 : 코드의 집합
              기능처리 (사용자가 요청=>행위,브라우저에서만 작동)
              =====
              버튼클릭 / 마우스 오버 / 변경 / 키보드
              => 호출시에 이벤트
                 onclick / onmouseover(hover) / onmouseout / onchange / onkeydown / onkeyup
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	document.write("<h3>리턴형,매개변수 설정</h3>");
	let name=hello('홍길동');
	document.write(name);
	document.write("<hr>");
	
	document.write("<h3>리턴형만 존재하는 함수</h3>")
	let msg=hello2()
	document.write(msg+"<br>")
	document.write("<hr>");
	
	document.write("<h3>매개변수만 존재</h3>")
	hello3('홍길동')
	hello4()
	
}
//리턴형,매개변수 설정
function hello(name)
{
    return name+"님 환영합니다.";
}
//리턴형만 존재하는 함수
function hello2() {
	return "Hello JavaScript Function"
}
//void(자체출력) / 매개변수만 존재
function hello3(name) {
	document.write("<h3>매개변수만 존재</h3>")
	document.write(name+"<br>")
	document.write("<hr>")
}
//매개변수와 리턴형 둘다없는 함수
function hello4() {
	document.write("<h3>매개변수와 리턴형 둘다없는 함수</h3>")
	document.write("받을 데이터가 없다...<br>")
	document.write("<hr>")
	
}
</script>
</head>
<body>

</body>
</html>