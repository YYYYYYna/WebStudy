<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       JSP
       1. 지시자
          page => contentType,errorPage,import,buffer
          taglib => MVC (EL/JSTL)
       2. 자바 / HTML
          === 사용법 : <%%>
       3. 내장객체
          request : 사용자의 요청정보
                   => HttpServletRequest
          response : 응답 (브라우저로 전송 => HTML/Cookie)
                   => HttpServletResponse
          pageContext : JSP연결 => request를 유지
                     => PageContext => RequestDispatcher
                        include() / forward()
                        => <jsp:include> <jsp:forward>
          out : 메모리 HTML을 출력 => 출력버퍼 (관리)
                => JSPWriter => PrintWriter
                print() => <%= %> => ${}
          application : 서버정보 (서버관리)
                      => Controller / ServletContext
                         => getRealPath() => 실제 톰캣이 읽어가는 위치
          config => web.xml , execption : try~catch
                 => ServletConfig / Exception
          page => this
               => Object
          ***session : 서버에 필요한 정보 저장
                     => HttpSession
             => 사용자 정보 (로그인) / 장바구니 => 임시기억장소
             => 전역변수(공유변수) => 모든 JSP에서 사용이 가능
             **request=>매개변수 => 모든 JSP마다 한개씩 가지고 있음
                               => session / cookie => 생성
                                  getSession() / getCookie()
                => 화면 변경 / 새로고침 => 자동으로 초기화
        ============================================================
        동작
          => 1. JSP소스 생성 => 실행
             2. JSP를 자바로 변경
                jsp파일명_jsp => .java
                a.jsp => a_jap, main.jsp => main_jsp
             3. 컴파일 => .class
                => JVM이 .class로드
                => 한줄씩 번역 시작
                => out.write() => 메모리 출력
                                      |
                                  브라우저에서 읽어서 출력
             4. jsp => 메소드 안
                1) => _jspService() => 사용자 요청 시 마다 호출되는 메소드 
                      {
                         =====================
                          여기서 첨부되는 소스 코딩 
                         =====================
                      } 
                2) => JSP에서 모든 HTML 앞에는 out.write 가 생략되어 있다
             5. servlet / jsp
                   |       |
                수정시마다  컴파일없이
                 컴파일    새로고침
          => 주요메소드
             request
               = getParameter() :String: 단일값을 받는 경우
                 <input type=text,radio,password,file...>
                 <textarea>,<select>
                  ==> <form => submit>=>입력값만 넘어옴
               = getParameterValues() :String[]: 다중값을 받는경우
                 <input type=checkbox>
                 **웹은 모든 데이터형이 String이다
                   이 데이터를 변환할때 Wrapper를 사용함...
               = 사용자 요청 =====> 서버(웹서버=>톰캣(WAS)) =====> 개발자
                           한글                        한글
                        (encoding)                (decoding)
                 예)
                                                        <a href="a.jsp?name=홍길동">전송</a>
                 http://localhost/JSPBasicProject_7/jsp/a.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99
                                                                   (이부분이 홍길동이었음...)
               = setArribute, getAttribute : 추가된 내용 받기
                                   |
                                ${name} => request.getAttribute("name")
                 데이터를 추가해서 다른 JSP로 전송
                 ======================== MVC
               = getRequestURI , getRequestURL, getContextPath
               = getRemoteAddr()
             
             response
               = addCookie() => @Cookies()
               = sendRedirect() => return "redirect:"
               = setHeader()  
             
             out
               = clear()
               = print() / wirte()
             
             pageContext
               = include()
               = forward()
             
             application
               = getRealPath()
               = getInitParameter()
             
             exception
               = getMessage()
             
             => 데이터베이스
                JDBC : 연결 / 해제 => 시간이 많이 걸린다
                DBCP : 연결을 미리 설정하고 반환 => 재사용
                ORM : 라이브러리 제작 (MyBatis/JPA)
                
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>수정</h1>
   <a href="a.jsp?name=홍길동">전송</a>
</body>
</html>