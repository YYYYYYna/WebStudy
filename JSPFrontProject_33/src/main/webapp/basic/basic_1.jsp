<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//main
<%--
   1.자바 : main()
   2.자바스크립트 : window.onload=function()
   3.Jquery : $(function(){})
   4.VueJs : mounted()
   5.React : componentDidMounted()
   
   var=메모리누수현상
   
   --------------------------------------
   
   변수선언 => 자동지정변수 => jquery / vue / react 를 하고싶다면 해당 내용을 잘 알아야함
   let:지역변수 / const:상수
   
   --------------------------------------
   
   [자주나는 오류 예시]
   금액 : 1000
   <select>
     <option value="1">1개</option>
     <option>2개</option>
     <option>3개</option>
   </select>   
   이럴때 1000*2개를 하면 => NaN 오류가 남으로 text값 대신 value값을 가져와서
   계산을 할 수 있도록 value값 설정을 해주는게 좋다
   위의 select문의 경우 1개는 value값 1을 가져오지만 2개는 2개 String형을
   가져옴으로 오류가 나게됨~!~!
   
   EL은 javascript 내에서는
   let i=${}
   let name='${}'
   아래의 방법으로 사용이 가능하다
   그러나 jquery에서는 충돌이 일어날수 있으니 주의!
--%>
</script>
</head>
<body>

</body>
</html>