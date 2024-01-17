<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
document.querySelector(CSS선택자)
                       태그명
                       #아이디명
                       .클래스명
                       계층구조도 가능
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	/*
	//방법1)맨처음 한개만 설정됨
	let h1=document.querySelector("h1") 
	// <h1 style="color:red">
	h1.style.color="orange";
	h1.style.background="skyblue";
	*/
	/*
	//방법2)여러개 설정
	let h1s=document.querySelectorAll("h1") //베열형태로인식됨 
	console.log("h1="+typeof h1) //하면 object형태로 나옴!
	//방법2-1)for
	for (let h1 of h1s) {
		h1.style.color="orange";
		h1.style.background="skyblue";
	}*/
	//방법2-2)foreach
	let h1s = document.querySelectorAll("h1");

	h1s.forEach((h1) => {
	  h1.style.color = "orange";
	  h1.style.background = "skyblue";
	});
	/*
	forEach 함수를 사용하여 h1s 배열의 각 요소에 대해 주어진 함수를 실행합니다. 
	map 함수는 배열의 각 요소에 대해 주어진 함수를 호출하고 그 결과로 새로운 배열을 생성합니다. 
	하지만 여기서는 단순히 배열의 각 요소에 대해 동작을 수행하고 있으므로 forEach가 더 적절합니다.
	
	map 함수는 각 요소에 대해 주어진 함수를 호출하고 그 결과로 새로운 배열을 생성합니다. 
	그러나 map 함수는 각 요소의 반환값을 모아 새로운 배열을 생성하는 것이 주 목적이며, 
	map 함수 내에서의 부작용(side effect)은 지양됩니다.

	forEach 함수는 주로 부작용이 중요한 경우에 사용되며, 배열의 각 요소에 대해 주어진 함수를 실행하고자 할 때 활용됩니다. 
	따라서 map 함수를 사용하여 스타일을 변경하는 것은 적절하지 않습니다.
	*/
}
</script>
</head>
<body>
	<h1>hello JavaScript</h1>
	<h1>hello JavaScript</h1>
	<h1>hello JavaScript</h1>
</body>
</html>