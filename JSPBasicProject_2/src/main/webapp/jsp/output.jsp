<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       [input.jsp에서 넘어온 값 받기 과정]
       //1. 한글 디코딩하기 잊지말기 
            모든 JSP마다 내장 객체를 가지고 있음
            따라서 request를 사용할수 있음
            ==> 내장객체임으로!! 화면을 바꾸면 내장객체는 초기화됨
                리퀘스트를 여러번 사용하면 그 값이 페이지마다 달라짐
                따라서 되도록 리퀘스트를 한개만 사용해서 DB로 보내야함 ==> 이게 AJAX의 원리
                아 혹은 중간중간 session을 사용해서 중간중간 DB를
                저장하는것도 하나의 방법이 될수 있음
--%>

<%
//1. 한글 디코딩하기 잊지말기 
try{
	//2. 화면변경시 request가 초기화됨 ==> session/AJAX로 해야함
	request.setCharacterEncoding("UTF-8");//이거 안하면 한글 다 깨짐
}catch(Exception ex){}

//3. 전송된값을 받는다
//<input type="text" size="15" name="name"/> 이 값을 아래 한줄에서 받음
String name=request.getParameter("name");
//radio는 name이 동일해야 그룹이 생성 => 한개만 선택
String sex=request.getParameter("sex");
String tel1=request.getParameter("tel1");
String tel2=request.getParameter("tel2");
//전화번호를 같이 받고 싶어도 꼭 따로 받아서 합쳐줘야함
String tel=tel1+")"+tel2;
String content=request.getParameter("content");
//여러개 한번에 받을때는 배열로 받아서 getParameterValues 사용
String[] hobby=request.getParameterValues("hobby");
%>

<%--
       <%= %> 혹은 <% %>는 이제 MVC에서는 사라짐...
       ---> 이제는 태그형으로 제작 : JSTL
            <% %> 에서 ${}로 바뀜~~
       
       => 내장객체
          ***request : JSP마다 request를 가지고 있다
                       단점은 화면 변경/새로고침 => request는 초기화
                       => HttpServletRequest 의 객체명
                       => jsp페이지로 데이터를 전송시에 데이터 전체를 묶어서 보내준다
                                                  =============== request
                       => request는 MAP형식으로 되어 있다
                          (키,값) => 키는 중복이 불가능 하다
                          <input type=text name="aaa">
                                           ==========
                                           getParameter("aaa")
                          <input type=text name="aaa">
                          <input type=text name="aaa">
                          ==> 이렇게 name이 중복되면 안됨!!! name이 key역할하기때문
                          
                          => ?name=aaa => getParameter("name")
                             ===== ===
                               키    값 
                               **?뒤에는 공백이있으면 안됨
                          => a.jsp
                             => null
                             if(a==null)
                          => a.jsp?name=
                             => " "
                             if(a.equals(""))
                          => form태그를 이용해서 전송 : post => action
                          => <a> ==> get => ()?name=홍길동
                       => 
          ***response
          ***session
          application : 업로드
          ===========
          pageContext => RequestDispatcher => include,forward
            <jsp:include>
          out
          =========== : 다운로드
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 1,6,7,8번 매우 중요!! -->
   <!-- IP를 확인하는 이유는 아이디당 하나씩만 증가시킬 기준을 잡기 위해 -->
   <h1>1. 사용자의 IP : <%=request.getRemoteAddr() %></h1>
   <h1>2. 서버정보 : <%=request.getServerName()%></h1>
   <h1>3. 서버프로토콜 : <%=request.getProtocol() %></h1>
   <h1>4. 전송방식 : <%=request.getMethod() %></h1>
   <h1>5. 포트번호 : <%=request.getServerPort() %></h1>
   <h1>6. 요청 URL : <%=request.getRequestURL() %></h1>
   <h1>7. 요청 URI : <%=request.getRequestURI() %></h1>
   <h1>8. ContextPath : <%=request.getContextPath() %>:루트폴더</h1>
   <h1>
       9. 전송값 <br>
       이름 : <%=name %> <br>
       성별 : <%=sex %> <br>
       전화 : <%=tel %> <br>
       소개 : <%=content %> <br>
       취미 : <%
                try{
                    out.write("<ul>");
                    for(String h:hobby)
                    {
                    	out.write("<li>"+h+"</li>");
                    }
                    out.write("</ul>");                    
                }catch(Exception ex)
                {
                	out.write("취미가 없습니다.");
                }
              %> 
   </h1>
</body>
</html>