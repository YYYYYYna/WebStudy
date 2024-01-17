<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<%
//한글 디코딩
request.setCharacterEncoding("UTF-8");

%>

<%--메모리할당하기 : StudentBean bean=new StudentBean()과 같은 코딩 --%>
<jsp:useBean id="bean" class="com.sist.bean.StudentBean">
   <jsp:setProperty name="bean" property="*"/>
   <%--위의 코딩이 아래의 코딩 긴걸 대신함...
   
   //데이터를 받는다
   String hakbun=request.getParameter("hakbun");
   String name=request.getParameter("name");
   String kor=request.getParameter("kor");
   String eng=request.getParameter("eng");
   String math=request.getParameter("math");

   //데이터 묶기
   StudentBean sb=new StudentBean();
   sb.setHakbun(Integer.parseInt(hakbun));
   sb.setName(name);
   sb.setKor(Integer.parseInt(kor));
   sb.setEng(Integer.parseInt(eng));
   b.setMath(Integer.parseInt(math));
    --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>학생 정보</h1>
   <p>학번 : <%=bean.getHakbun() %></p>
   <p>학번 : <jsp:getProperty name="bean" property="hakbun"/> </p>
   <p>이름 : <%=bean.getName() %></p>
   <p>국어 : <%=bean.getKor() %></p>
   <p>영어 : <%=bean.getEng() %></p>
   <p>수학 : <%=bean.getMath() %></p>
</body>
</html>