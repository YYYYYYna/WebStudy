<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
     와...........걍 연산자정리함
     
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//292page 연산자
window.onload=function(){
	//단항연산자(++,--,!)
	let a=10;
	let b=a++; //후치 연산자 => 대입=>증가
	document.write("a="+a+"<br>");
	document.write("b="+b+"<br>");
	
	a=10;
	b=++a;
	document.write("a="+a+"<br>");
	document.write("b="+b+"<br>");
	
	let d=1;
	d=!d;
	
    /*
    //0으로 나눴을때 Infinity라는 오류가 남 ==> 자주나는오류니까 기억하기
    
    //${}는 자바에서 값 받아올때 사용하는 함수라서 오류남
    let t=${t}
    document.write("t="+t+"<br>");
	*/
};
</script>
</head>
<body>
</body>
</html>