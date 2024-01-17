<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     내장객체
     1) 브라우저 내장객체
        window : 브라우저 창을 제어
                 => open
                 => close
        document : 화면 (HTML의 태그) / body안쪽에
                   => querySelector
                   => write
        history : 기록정보
                  => back(), go() => 화면이동
        location : 화면 이동 정보
                   => href
     2) 내장객체
        = Number()
        = parseInt()
        = String() =====> 형변환
        *** 웹의 단점 : 모든 데이터가 문자열로 되어 있다
        String / Date / Array 
        ===================== 특별한 경우가 아니면 자바에서 처리
        = 서버에서 데이터 읽기 => ajax / vue / react
        
        String => 유효성 검사 (오라클 => Primary Key , NOT NULL)
        ======
         1. length : 입력된 문자의 갯수 => 비밀번호
         2. charAt(number)
                  ========문자열번호(0)
                  Hello
                  01234 ==> charAt(4) => 'o'
         3. indexOf 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	
}
</script>
</head>
<body>

</body>
</html>