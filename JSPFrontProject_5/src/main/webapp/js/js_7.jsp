<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
      355page 이벤트
      ============
      
      자주 사용하는 이벤트
      ==============
      : 사용자에 의해 발생
      
      많이 사용하는 이벤트
      ==============
      : onload : 브라우저가 html문서를 읽어서 화면에 출력되었을때
               => window.onload=function(){처리}
      : onclick : 클릭을 햇을때 => 버튼 / a / h1
      : onkeyup(검색) , onkeydown
      : onmouseover / onmouseout
      : onsubmit => 데이터 전송
      : onchange => select 태그에서 선택이 된 경우
      
      이벤트 처리 방법
      ===========
      1) 인라인 이벤트 모델
      2) 고전 이벤트 모델
      3) 표준 이벤트 모델
      4) 이벤트 리스너 모델
      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 1) 인라인 이벤트 모델
	function show() {
		alert("button click");
	}
</script>
</head>
<body>
	<button onclick="show()">클릭</button>
</body>
</html>