<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      교제 다 공부할 필요없구 자바, 데이터베이스, 제공예제 는 제외하고 진행하면됨
      한 1/3만 하면됨
      
      JSP = Java Server Page
      ===
      1. 지시자
         <%@ page %>
             contextType : 브라우저에 전송 => 파일형식
                  = text/html;charset=UTF-8
                  = text/xml;charset=UTF-8
                  = text/plain;charset=UTF-8
                  =====> html,xml,json
                  =====> 자바변경 =====> response.setContextType()
              errorPage : error가 날 경우에 지정된 파일로 이동
              isErrorPage : true/false => exception 객체 사용시
              import : 외부 클래스를 읽어올때 => 여러번 사용
                  => jsp에서만 사용 ==> MVC는 사용하지 않는다 
              buffer : 기본8kb => 증가 가능 2배씩 권장
                                        =======
         <%@ taglib %>
      2. 스크립트
         <% %> : 일반 자바 (main 안에 소스 코딩)
                 => 제공하는 태그를 이용해서 사용
         <%= %> : 데이터 풀력
                  => ${}
                  => 가급적이면 <% %>를 제거
                     JSP === Controller === Model === DAO 과정을 진행
                                            ----- 자바(재사용성)
                                            model2방식
      3. 내장객체 (MVC에서도 사용)
         **request / **response / **session / application / out / pageContext
      4. JSP 액션 테그
         <jsp:useBean> <jsp:setProperty> <jsp:include>
      ----------------여기까지 기초과정
      5. EL
      6. JSTL
      7. MVC
      ----------------여기까지 중급과정
      8. XML
      9. Annotation
      ----------------여기까지 고급과정
      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>