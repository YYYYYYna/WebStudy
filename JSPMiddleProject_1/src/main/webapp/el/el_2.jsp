<%@page import="com.sist.dao.studentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
        581page
        기본객체 (내장객체)
        => ***requestScope / ***sessionScope / applicationScope
        => param / pageContext
        EL은 자바 변수를 출력하는것이 아님
        request,session에 저장된 데이터를 출력
--%>
<%--
<%
String name="홍길동";
request.setAttribute("name", "심청이");
session.setAttribute("name", "박문수");
//key명명이 같은경우 request인지 session인지 선언을 안하면 request가 우선순위로 출력됨

//**param => getParameter("name")
//param.key => param.name

//applicationScope는 잘 사용하지 않지만 realpath때문에 자주 사용함

/*
       ${}는 출력물이 reqeust,session에 담겨 출력을 요청시에만 사용
       
*/
%>
--%>

<jsp:useBean id="model" class="com.sist.dao.studentModel"/>
<%
studentVO vo=model.studentDetailData();
request.setAttribute("vo",vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_2_requestScope</title>
</head>
<body>
<%--
<p>setAttribute는 request를 우선순위로 가진 ${name } 입니다.</p>
<p>request.setAttribute는 requestScope.가 생갹된 ${requestScope.name } 입니다.</p>
<p>session.setAttribute는 sessionScope.가 생갹된 ${sessionScope.name } 입니다.</p>
<p>일반변수로 출력은 <%=name %> 입니다.</p>
--%>
<p>학번 : ${vo.hakbun }</p>
<%-- 
//이렇게 적으면 오류남
<p>학번 : ${vo.gethakbun }</p>
<p>이름 : ${vo.getName }</p>
<p>국어 : ${vo.getKor }</p>
--%>
<p>국어 : ${vo.kor }</p>
<p>영어 : ${vo.eng }</p>
<p>수학 : ${vo.math }</p>
 
</body>
</html>