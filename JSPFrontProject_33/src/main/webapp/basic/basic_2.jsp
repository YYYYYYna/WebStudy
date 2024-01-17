<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     자바스크립트에서 제공하는 제어문
     조건문
       단일조건문
       선택조건문
       다중조건문
     선택문
     반복문
       do~while
       while : 무한스크롤
       ***for
     반복제어문
       break/
     
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function login() {
	//1. 입력한 ID를 읽기
	//$('#id') 혹은 target.value 혹은 $ref 가 실무에서 쓰임
	let id=document.querySelector("#id"); //태그를 가지고 와서 변수에 저장
	//태그를 객체모델로 인식 / 속성 : 멤버변수로 인식
	
	if(id.value==="") //자바에선 문자열은 .equrls를 사용하는데 js는 동일하게 ===을 사용함
	{
		//입력이 안된 경우
		let div=document.querySelector(".id");
		div.innerHTML="<font color=red>아이디를 입력하시오</font>";
		id.focus();
		return;
	}
	else
	{
		//입력이 된 경우
		let div=document.querySelector(".id");
		div.innerHTML="";
	}
	
	let pwd=document.querySelector("#pwd"); //태그를 가지고 와서 변수에 저장
	//태그를 객체모델로 인식 / 속성 : 멤버변수로 인식
	
	if(pwd.value==="") //자바에선 문자열은 .equrls를 사용하는데 js는 동일하게 ===을 사용함
	{
		//입력이 안된 경우
		let div=document.querySelector(".pwd");
		div.innerHTML="<font color=red>비밀번호를 입력하시오</font>";
		pwd.focus();
		return;
	}
	else
	{
		//입력이 된 경우
		let div=document.querySelector(".pwd");
		div.innerHTML="";
	}
}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px; 
}
.row{
   margin: 0 auto;
   width: 350px;
}
h1 {
	text-align: center;
}
</style>
</head>
<body>
   <div class="container">
      <h1>로그인</h1>
      <div class="row">
         <table class="table">
            <tr>
               <th class="text-center" width="20%">ID</th>
               <td width="80%">
                  <input type="text" id="id" size="input-sm" onclick="login()">
                  
                  <!-- 아래 div는 입력이 안될시 출력할 부분 -->
                  <div class="id"></div> 
               </td>
            </tr>
            <tr>
               <th class="text-center" width="20%">PW</th>
               <td width="80%">
                  <input type="password" id="pwd" size="input-sm" onclick="loginpwd()">
                  <div class="pwd"></div>
               </td>
            </tr>
            
            <tr>
               <td colspan="2" class="text-center">
                  <input type="button" value="로그인" class="btn-sm btn-info">
               </td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>