<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--
         public void _jspService(request, response)
         {
             내장객체...란게 잇는데 난 놓쳐서 못가져옴..^^
             final 상수랑
             javax.servlet.http.HttpSession session = null;
             등등 생성을 안하고 잇는걸 사용하는 걸 뜻함
         } 
         
         그리고 jsp도 서블릿처럼 out.write형태이지만 톰캣에서 자동으로
         태크명으로 변환시켜주는거임~~
         ==> 메소드 안에서 코딩하는 배경이기 때문에 가능함
         
         69page 동작과정
         1. 웹 브라우저가 URL을 요청
         2. 웹 서버가 요청을 받는다
         3. .html , .css , .json => 웹서버 자체에서 처리 후 브라우저로 전송
            => jsp, servlet ... 번역이 불가능
               ------------
               |
               번역을 요청 => 톰캣 (의 수많은 메소드들..)
               |            ===================== WAS
               |             Web Application Server
              1) 자바로 변경 => (jsp파일명)_jsp.java
              2) 자바를 컴파일 => 서블릿
              3) 자바 실행
                 =======
                  | 브라우저에 읽어갈 메모리에 html을 출력해 준다
                    ================== 출력 스트림
              4) 출력된 메모리로부터 html을 한줄씩 읽어서 브라우저 출력
                                ================= 인터프리터
         71page => jsp의 생명주기
         => 자동 호출
            _jspInit() => 초기화 (web.xml 등록시 읽어간다)
                |
            _jspService() => JSP에서 코딩이 되는 영역 (화면, 결과를 출력)
                |           
            _jspDestory() => 새로고침/화면이동 자동으로 메모리 해제
                   
                
     --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      String name="홍길동";
      out.write(name);
   %>
</body>
</html>