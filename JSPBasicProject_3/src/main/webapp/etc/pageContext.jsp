<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       2. 웹 흐름 제어
          include(), forward() => 파일마다 request공유를 한다
          => <jsp:include>
          => 
             1. <%@ include file="" %> : 정적
                => file에는 반드시 file명을 설정한다
                   menu / footer
             2. <jsp:include page=""> : 동적
                => 내용출력시에 변경
                   page=변수명
                   
             => JSP안에 특정위치에 다른 JSP를 포함
             a.jsp
              <html>
                <body>
                   <%
                      int a=10;
                   %>
                   <h1><%=a%></h1>
                </body>
              </html>
              
              b.jsp
              <html>
                <body>
                   <%
                      int a=100;
                   %>
                   <h1><%=a%></h1>
                   <%@ include file="a.jsp" %> //이러면 오류남
                                                 왜냐면 a라는 변수가
                                                 한페이지에 두번 생기게 된까
                                                 그래서 같은 이름의 변수가
                                                 없도록 주의 해야함!!!
                                                : 무조건 파일 하나를 꼭 지정해야함
                                                  메뉴처럼 바뀌는 객체는 지정시
                                                  에러가 생길수 있음
                                                  
                   <jsp:include page="a.jsp"> //이러면 오류 안남
                                                동적 include는
                                                같은 이름 변수가 없어도
                                                상관없음
                   <jsp:forward page="">
                            : mvc구조 만들때 주로 사용됨
                </body>
              </html> 
              
              **모든 JSP는 테그형으로 인식하는것이 좋다 : 화면출력용으로만 주로 사용      
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