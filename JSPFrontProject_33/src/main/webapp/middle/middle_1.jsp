<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    for : 반복문
    1. 일반 for
       for(초기값;조건식;증가식)
       {
          반복수행문장
       }
       
    2. forEach구문
       for(let data of 배열) => for(데이터형 변수:배열,컬렉션)
       {            ==
          반복수행문장 ==> 배열에서 실제 값을 읽어온다
       }
       : 같은 데이터형으로 이뤄진 배열들인경우 of
       
       for(let data in 배열)
       {            ==
          반복수행문장 ==> 배열의 인덱스 번호를 읽어 온다
          => 오라클 (JOIN)
       }
       : 데이터형이 다 다른 배열들을 사용할때는 in
       : 오라클의 경우 join을 할때 사용한다고 보면됨
    
    3. map 반복문 (가장 많이 사용되는 반복문) => vue, react
       사용법)
       배열명.map(function(데이터)){
                =============자동호출(배열에서읽은값1개를매개변수
            반복출력물
       }
       => 배열명.map((데이터)=>{
                        === 화살표 (function과 return을 제거)
                        === 람다식 : 함수의 포인터
       })
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	const names=["홍길동","심청이","이순신","강감찬","박문수"]
	const sexs=["남자","여자","남자","남자","남자"]
	
	//일반 for문
	document.write("<h3>일반 for</h3>")
	for(let i=0;i<names.length;i++)
		{ 
		  //length는 배열의 데이터 갯수
		  document.write(names[i]+"&nbsp;")
		}
	document.write("<hr>")
	
	//for of
	document.write("<h3>for of</h3>")
	for(let name of names)
		//for(String name:names)와 같은 형식
		{
			document.write(name+"&nbsp;")
		}
	document.write("<hr>")
	
	//for in : 배열의 인덱스 번호 출력 / 여러개 배열을 한번에 출력
	document.write("<h3>for in</h3>")
	for(let index in names)
		//for(String name:names)와 같은 형식
		{
			document.write(names[index]+"("+sexs[index]+")<br>")
		}
	document.write("<hr>")
    
	//함수형으로 변경 => map / forEach
	//일반 for, map, forEach
	document.write("<h3>map 사용법 : function </h3>")
	names.map(function (name) {
		document.write(name+"&nbsp;")
	})
	document.write("<hr>")
	
	document.write("<h3>map 사용법 : => </h3>")
	names.map((name)=>{
		document.write(name+"&nbsp;")
	})
	document.write("<hr>")
	
	//for each
	//일반 for, map, forEach
	document.write("<h3>for each 사용법1</h3>")
	names.foreach(function (name) {
		document.write(name+"&nbsp;")
	})
	document.write("<hr>")
	
	document.write("<h3>for each 사용법2</h3>")
	names.foreach((name)=>{
		document.write(name+"&nbsp;")
	})
	document.write("<hr>")
	
	let arr=["홍길동", 20, 'A', "영업", 3500]
	console.log("arr="+typeof arr)
	for(let data of arr)
		{
		document.write(data+"<br>");
		}
}
</script>
</head>
<body>

</body>
</html>