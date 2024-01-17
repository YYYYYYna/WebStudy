<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
      내장객체 => 미리 객체를 생성한 후에 사용이 가능하게 만든것
      ======
      1. 객체명
      2. 클래스
      3. 용도
      4. 주요메소드
      -----------------------------------------------
      ex) request 
          의 클래스 : HttpServletRequest
          의 용도 : 클라이언트의 요청값을 묶어서 저장하고 있다
                   클라이언트의 IP정보를 가지고 있음
                   세션이나 쿠키생성시 사용
                   한글변환 (디코딩)
          의 주요메소드 : getParameter(key명) => 단일값 받기
                       getParameterValues(key명) => 다중값 받기
                       setCharacterEncoding() => 한글값 변환(전송:인코딩/수신:디코딩)
                       --------------------------여기까진주요메소드
                       서버정보
                       getRemoteAddr() => ip값
                       getCookie(), getSession()
                       getRequestURL()
                       getRequestURI()
                       getContextPath()
                       추가정보
                       setAttribute()
                       getAttribute()
        ex) response 
            의 클래스 : HttpServletResponse
            의 용도 : HTML/Cookie 전송 
                     화면 변경, 헤더 작성
            의 주요메소드 : response.setContentType("")
                          => text/html
                          => text/xml
                          => text/plain
                         addCookie() => 해당 브라우저로 전송
                         sendRedirect(파일명) => GET
                         setHeader() => 다운로드
        ex) out
            의 용도 : 출력버퍼 (HTML을 출력해서 저장하는 공간)
                            =========================
                             | 요청한 브라우저에서 공간의 HTML을 읽어서 출력
                             | 자동으로 비워준다 => 브라우저 한개당 한개만 생성
                             | 기본 : 8kb
                   : 화면 출력
                     println(), print()
        ex) application
        ex) pageContext
        ex) config
        ex) page
            
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>out:JspWriter:버퍼관리</h1>
   1. 전체버퍼의 크기 확인: <%= out.getBufferSize() %> <%-- 8*1024 --%>
   <br>
   2. 남아있는 버퍼의 크기 확인 : <%= out.getRemaining() %>
   <br>
   3. 사용중인 버퍼 크기 확인 : <%=out.getBufferSize()-out.getRemaining() %>
   <br>
   4. &lt;=&gt; 대체: out.println() / out.write()
      => 복잡한 HTML을 만들 경우
      
   <br>
   <%
        out.println("<h1>OUT객체</h1>");
        out.print("<h1>OUT객체</h1>");
        out.write("<h1>OUT객체</h1>");   
   %>
   
</body>
</html>









