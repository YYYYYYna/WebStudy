<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
       JSTL
         -- Tag Lib
         <% %> 를 태그형을 제작
                 = 1. 변수선언
                      => int a=10; => <c:set var="a" value="10"/>
                   2. 제어문
                      => for(int i=1;i<=10;i++)
                         <c:forEach var="i" begin="1" end="10" value="1">
                      =>  for(SawonVO vo:list)
                          <c:forEach var="vo" items="list" varStatus="in">
                           (varStatus : 인덱스 번호)          ========== index
                                                           => 번호 출력 / 다른 List
                      => <c:forTokes var"" value="" delim="">
                         StringTokenizer st=new StringTokenizer(value,delim)
                         while(st.hasMoreTodenizer)
                         {
                         }
                      => <c:if> 조건문
                         <c:if text="${}">
                               =========조건문
                         if(test)
                         단점 : else문장이 없다
                               ===========but 사용자 정의가가능! 
                      => 다중조건문 => XML로 제작되어있음
                                   ====
                                   1. 태그나 속성 => 대문자 구분
                                   2. 속성값 => ""
                                   3. 계층구조 => 여는태그, 닫는태그 일치
                                      => <jsp:include>
                         <c:choose>
                           <c:when test="조건문">출력</c:when>
                           <c:when test="조건문">출력</c:when>
                           <c:when test="조건문">출력</c:when>
                         </c:choose>
                   3. 화면이동
                         <c:redirect url""/>
                         => response.sendRedirect(url)
                   4. 화면출력
                         <%= %>
                         <c:out value=""> => Jquery => $
                         ${} => import가 동일하게 있으면 오류 발생
                   =================================================core
                   5. 날짜변환 / 숫자변환
                      SimpleDateFormet sdf=new SimpleDateFormet("yyyy-MM-dd")
                      <fmt:formatDate value="" pattern="yyyy-MM-dd"> => 그러나 오라클에서 TO_CHAR로 아예 변환해서 가져오는게 편리
                       ===
                       format형이니까 default prefix값이 달라진다
                       
                      DecimalFormat d=new DecimalFormat("###,###");
                      <fmt:formatNumber value="" type="currency">
                   =================================================format
                   6. 메소드 호출
                   =================================================functions                 
--%>
<%
     //JSTL도 출력은 EL
     List<String> nList=new ArrayList<String>();
     nList.add("홍길동");
     nList.add("이순신");
     nList.add("강감찬");
     nList.add("심청이");
     nList.add("춘향이");
     
     List<String> sList=new ArrayList<String>();
     sList.add("남자");
     sList.add("남자");
     sList.add("남자");
     sList.add("여자");
     sList.add("여자");
     
     request.setAttribute("nList", nList);
%>
<c:set var="sList" value="<%=sList %>"/>
<%--c:set은 일반 변수가 아니라 request.setAttribute(var,value) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:forEach 와 varStatus 예제</title>
</head>
<body>
    <h1>이름</h1>
    <ul>
       <c:forEach var="name" items="${nList }">
          <li>${name }</li>
       </c:forEach>
    </ul>
    <h1>성별</h1>
    <ul>
       <c:forEach var="sex" items="${sList }">
          <li>${sex }</li>
       </c:forEach>
    </ul>
    <h1>이름(성별)</h1>
    <ul>                                      <%--s는 for문의 i같은 역할--%>
       <c:forEach var="name" items="${nList }" varStatus="s">
          <li>${name }(${sList[s.index] })</li>
                            <%--
                            s번째 인덱스번호로 나옴
                            ${s.current} 현재 for문의 해당하는 번호
                            ${s.index} 0부터의 순서
                            ${s.count} 1부터의 순서
                            ${s.first} 첫 번째인지 여부
                            ${s.last} 마지막인지 여부
                            ${s.begin} for문의 시작 번호
                            ${s.end} for문의 끝 번호
                            ${s.step} for문의 증가값
                            --%>
       </c:forEach>
    </ul>
</body>
</html>