<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     Ajax / Vue / React => 서버에서 값을 읽어와서 처리
     ==> 자바 / 자바 스크립트 매칭 ==> Array, JSON
     
     Array => 제공되는 내장객체 / 배열[]
     1) 배열에 값을 추가할때
        push()
     2) 배열의 마지막 값 제거
        pop()
     3) 원하는 위치까지 잘라서 새로운 배열을 생성
        slice() ==> Ajax ==> 페이지 나누기에 사용
     4) indexOf() : 데이터의 위치확인
     5) find() : 데이터 검색
     6) delete : 배열 완전 삭제
     7) length : 저장된 갯수(배열의크기) 가져오기
     
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//0. 배열선언 ==> 보통은 이부분을 백/자바에서 데이터를 가져옴
	let names=[
		{name:'심청이'},
		{name:'홍길동'},
		{name:'성춘향'},
		{name:'이순신'},
		{name:'박문수'}
	]
	//1. 배열출력 확인
	console.log(names)
	//2. 인원수 확인
	console.log("인원수:"+names.length)
	//3-1. 인원 추가
	names.push({name:"을지문덕"})
	//3-2. 배열추가 확인
	console.log(names)
	//4-1. 마지막 인원 제거
	names.pop()
	//4-2. 배열삭제 확인
	console.log(names)
	//5-1. 전체 인원 제거
	names.length = 0;
	//5-2. 배열삭제 확인
	console.log(names.length)
}
</script>
</head>
<body>

</body>
</html>