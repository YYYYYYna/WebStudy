<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%
//session.setAttribute("id", "hong");
//우와~~이렇게 저장되어잇음 로그인된걸로 실행됨~~~

//1.session에 등록이 되어있는지 여부
    String id=(String)session.getAttribute("id");
    String name=(String)session.getAttribute("name");
    String admin=(String)session.getAttribute("admin");
%>

<%--
     [주요메소드]
     1. 저장 : setAttreibute("키","값");
        => 키 : String 
        => 값 : Object => 장바구니 => List
     2. 읽기 : Object getAttribute("키");
              => 형변환
     3. 저장기간설정 : setMaxinactionInterval()
                                         ==초단위
        => 기본 default : 1800초 (30분)
     4. 삭제
        => 일부삭제 : removeAttribute(키) => 장바구니
        => 전체삭제 : invalidate() => 로그아웃
     5. session은 브라우저당 1개만 배정 (접속자)
                 ================ 구분 : id => getId()
     6. 처음 저장인지 여부 확인 : isNew()
     7. Map 형식으로 되어 있다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.jsp">Food & Recipe & Travel</a></h1>
    </div>
    <div class="fl_right">
      <ul class="inline">
        <%
           //로그인 안되면? 로그인창보여주고
           if(id==null)
           {
        %>
        <form method="post" action="../member/login.jsp">
        <li>ID: <input type=text name=id style="width:100px"></li>
                                <%--데이터보낼때 id가 아니라 name으로 하는거 잊지말기 --%>
        <li>PW: <input type=password name=pwd style="width:100px"></li>
        <li><input type="submit" value=로그인></li>
        </form>
        
        <%
           }
           else
           {
        %>
        <form method="post" action="../member/logout.jsp">
        <li><%=name %>(<%=admin.equals("y")?"관리자":"일반사용자" %>)님 로그인이 되었습니다.</li>
        <li><input type="submit" value="로그아웃"></li>
        </form>
        <%
           }
        %>
      </ul>
    </div>
   </header>
</div>
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <ul class="clear">
      <li class="active"><a href="../main/main.jsp">홈</a></li>
      <li><a class="drop" href="#">회원</a>
         <%
              if(id==null) //로그인이 안됫으면?
              {
         %>
         <ul>
          <li><a href="pages/gallery.html">회원가입</a></li>
          <li><a href="pages/full-width.html">아이디 찾기</a></li>
          <li><a href="pages/sidebar-left.html">비밀번호 찾기</a></li>
        </ul>
         <% 
              }
              else{
         %>
        <ul>
          <li><a href="pages/gallery.html">회원수정</a></li>
          <li><a href="pages/full-width.html">회원 탈퇴</a></li>
        </ul>
        <%
              }
        %>
      </li>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../main/main.jsp?mode=2">맛집 검색</a></li>
          <li><a href="pages/full-width.html">맛집 예약</a></li>
          <li><a href="pages/full-width.html">맛집 추천</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">레시피</a>
        <ul>
          <li><a href="pages/gallery.html">레시피</a></li>
          <li><a href="pages/full-width.html">쉐프</a></li>
          <li><a href="pages/sidebar-left.html">레시피 만들기</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">서울 여행</a>
        <ul>
          <li><a href="pages/gallery.html">명소</a></li>
          <li><a href="pages/full-width.html">자연 & 관광</a></li>
          <li><a href="pages/sidebar-left.html">쇼핑</a></li>
          <li><a href="pages/sidebar-left.html">호텔</a></li>
          <li><a href="pages/sidebar-left.html">날씨</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="pages/gallery.html">자유게시판</a></li>
          <li><a href="pages/full-width.html">공지사항</a></li>
          <li><a href="pages/sidebar-left.html">묻고답하기</a></li>
        </ul>
      </li>
      <li><a href="#">스토어</a></li>
      
      <%if (id!=null && admin.equals("y")) {
      
      %>
         <li><a href="#">관리자페이지</a></li>
      
      <%} %>
     
      
      <%if (id!=null && admin.equals("n")){  %>
      
       <li><a href="#">마이페이지</a></li>
      <%} %>
      
       
    </ul>
    </nav>

</div>
</body>
</html>