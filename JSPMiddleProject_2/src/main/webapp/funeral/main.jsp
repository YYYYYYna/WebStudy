<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.model.FuneralModel"/>
<%
model.funeralListData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
   margin-top: 50px;
}
.row{
   margin: 0px auto;
   width: 1024px;
}
</style>
</head>
<body>
    <div class="row">
       <h1 class="text-center">전체상품</h1>
       <%--private int mno;
	private String infoimage,infoh3,infop; --%>
       <c:forEach var="vo" items="${list }">
          <div class="col-md-3">
           <div class="thumbnail">
            <a href="#">
               <img src="${vo.infoimage}" title="${vo.infoh3 }" style="width:100%">
               <div class="caption">
                 <p>${vo.infoh3 }</p>
               </div>
             </a>
            </div>
          </div>
       </c:forEach>
    </div>
    <div class="heigth:10px"></div>
    <div class="text-center">
       <ul class="pagination">
         <c:if test="${startPage>1 }">
           <li><a href="#">&lt;</a></li>
         </c:if>
         <c:forEach var="i" begin="${startpage }" end="${endpage }">
           <li ${curpage==i?"class=active":"" }><a href="main.jsp?page=${i }">${i }</a></li>
         </c:forEach>
         <c:if test="${endPage<totalpage }">
           <li><a href="#">&gt;</a></li>
         </c:if>
       </ul>
    </div>
</body>
</html>