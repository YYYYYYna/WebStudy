<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%--
   1. 동작 과정
      1) 요청 : http://localhost/JSPBasicProject_2/jsp/basic_1.jsp
               => basic_1.jsp를 찾아서 실행 결과를 보여달라
               => 주소창 
      2) 웹서버에서 요청을 받는다 
         ===== HTML/XML/JSON => 자체 처리
         ===== .jsp/servlet => 처리가 불가능
      3) jsp => WAS(Web Application Server) => 톰캣
                jsp,servlet 번역 (자바 처리) => jsp 엔진 (= 톰캣)
      4) 톰캣
          = jsp ==> 자바파일로 변경
            basic_1.jsp ==> basic_1_jsp.java
            ===========
             | 코딩된 내용이 _jspServer() 메소드 안에 들어간다 
               public void _jspService()
               {
                  session , pageContext , page , exception
                  out , application , config ==> 생성 
                  ========================== 내장 객체
                  =======================================
                  
                  jsp에서 코딩한 내용을 첨부 => _jspService() 메소드 안에 첨부
                  =======================================
               }
      = 컴파일 => basic_1_jsp.class => 서블릿
      = 실행 => out.write("<html>")
               => 출력버퍼에 출력
               => ====== html을 브라우저에서 읽어서 출력
      *** html/css/javascript를 사용하기 편리하게 만들어져 있다 => JSP
          html태그앞에 out.write()가 생략되어 있다 => JSP
   2. 지시자 => 설정 (139page)
      page : jsp파일에 대한 정보
        사용법)
        <%@ page 속성=값 속성=값 속성=값 %>
                 속성은 지정되어 있다
                 속성은 한번만 사용이 가능 => import는 여러번 사용이 가능
                 => XML 형식으로 만들어져 있다
                    =======
                    문법이 어렵다 (1. 대소문자를 구분 | 2. 값을 설정할 때 반드시 "")
                 => info : 파일에 대한 설명
                    info="게시판 수정파일" 
                 => contentType : 브라우저 전송 => 어떤 형식인지를 알려준다
                    contentType="text/html;charset=UTF-8" => html 형식 
                    contentType="text/xml;charset=UTF-8" => xml 형식
                                          =============
                                          UTF-8 / EUC-KR
                                            |        ㄴ Window에서만(git에서 깨질수도)
                                            | 운영체제 호환
                    *** GIT (공유) => UTF-8로 변경 후 값을 가져와야 한다
                    *** MAC / Window => 경로명 => 호환시키는 방법 있다 
                    => File.separator '\\'
                    contentType="text/plain;charset=UTF-8" => json 형식
                                 ==========
                                 | Vue/React (JSON 으로 보내야 사용 가능)
                    => VO(상세보기) => {} => JSON
                    => List(목록) => []
                    => Ajax 에서 JSON을 전송 => simple-json.jar 
                    =============         => jackson (json 만들어주는 파일)
                  = import : 라이브러리 불러올 때 사용
                    import=" , , "
      include : JSP안에 다른 JSP를 포함
                <%@ include file="" %> : 사용빈도가 거의 없다
                => 정적
                자바피일까지 포함 => 한번에 컴파일
                <jsp:include page="">
      taglib : JSP에서 자바문법(제어문,변수선언,메소드호출)
               ============= 태그형으로 제작
               JSP는 View의 역할만 수행 (= 화면 출력에만 주력)
                    ==== 화면 UI => 보안에 취약하기 때문에 UI에만 사용
                    
               = errorPage : 한개만 설정이 가능
               = isErrorPage : 종류별로 처리가 가능
                 => 404 : 파일이 없는 경우
                 => 500 : 자라 컴파일시 오류
                 => 403 : 접근 거부 => 암호/복호, 권한부여
                 => 400 : GET/POST => 전송방식
                 => 412 : 잘못된 전송 (bad request) => 배열 보냈는데 String으로 받을때
   3. 자바 사용법 
      <%
         <% %> ==> 이런식으로 java영역안에 중복으로 들어갈수는 없음
         
      %>
      
      아래는 변환되는 과정
      <%
        for(int i=0;i<3;i++)
        {
      %>
        	<h1><%=i %></h1>
      <%
        }
      %>
    
      <%
        for(int i=0;i<3;i++)
        {
      %>
            out.write("<h1>");
        	out.println(i);
        	out.write("</h1>");
      <%
        }
      %>
   ====================
   4. 내장 객체 => Spring에서는 자체 처리
   ================================= request,response (12/05 할 내용)
      => 답변형 게시판 
   5. 액션 태그
   
   6. 빈즈 => 병행 => VO (Getter/Setter. 데이터 모아서 보내는 방식)
   7. 데이터베이스 연동
   8. MVC
   ===================== Spring, Spring-Boot, 실무
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int a=10/0;
%>
</body>
</html>



























