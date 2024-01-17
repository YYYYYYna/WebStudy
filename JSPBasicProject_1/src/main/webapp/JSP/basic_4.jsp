<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%--
     1. 데이터 읽기
        1) import를 설정
           방법1)
           <%@ import="java.util.*, com.sist.dao.*"%> : ,로 구분
           방법2)
           <%@ import="java.util.*"%> : 따로적기
           <%@ import="com.sist.dao.*"%>
     2. html의 해당 위치에 <% %> => for
        => 데이터 출력은 <%= %>
        => JSP의 중심은 view
 --%>
<!DOCTYPE html>
<%
    EmpDAO dao=EmpDAO.newInstance();
    List<EmpVO> list=dao.empListData();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/table.css">
<style type="text/css">
   .container{
        margin: 50px 0 0 0;
   }
   .row{
        width: 1000px;
        margin: auto;
   }
   h1{
        text-align: center;
   }
   table {
	margin: auto;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
   <h1>사원 목록</h1>
   <table class="table_content" width=800>
      <tr>
         <th>사번</th>
         <th>이름</th>
         <th>직위</th>
         <th>입사일</th>
         <th>급여</th>
      </tr>
      <%--
          <% 자바 소스 %> : 메소드 안에 들어가는 자바소스
                          모든 소스는 자바 문법을 사용한다
                          명령문;
          <%= 출력물 %> : out.println(여기들어갈내용:출력물)
          
          톰캣 : WAS => JSP/Servlet 엔진
          형상관리 : GIT
       --%>
      <%
         for(EmpVO vo:list)
         {
        	 %>
        	 <tr class="dataTr">
        	   <td class="text-center"><%=vo.getEmpno() %></td>
        	   <td class="text-center"><%=vo.getEname() %></td>
        	   <td class="text-center"><%=vo.getJob() %></td>
        	   <td class="text-center"><%=vo.getHiredate().toString() %></td>
        	   <td class="text-center"><%=vo.getSal() %></td>
        	 </tr>
        	 <%
         }
      %>
   </table>
   </div>
   </div>
</body>
</html>