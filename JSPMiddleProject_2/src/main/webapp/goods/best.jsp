<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="mod" class="w"/>

<%
     //Controller 역할
     model.goodsListData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
   <div class="row">
      <h1 class="text-center">베스트상품</h1>
      <c:forEach var="vo" items="${list }">
         <div class="col-md-3">
           <div class="thumbnail">
             <a href="/w3images/nature.jpg">
               <img src="${vo.goods_poster }" title="${vo.goods_name }" style="width:100%">
               <div class="caption">
                 <p>${vo.goods_price }</p>
               </div>
             </a>
            </div>
          </div>
      </c:forEach>
   </div>
   <div class="heigth:10px"></div>
   <div class="text-center">
      <ul class="pagination">
      <%--
          <!ENTITY lt "<">
          <!ENTITY gt ">">
      --%>
        <c:if test="${startPage>1 }">
           <li><a href="main.jsp?type=${type }&page=${startPage-1}">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
           <li ${curpage==i?"class=active":"" }><a href="main.jsp?type=${type}&page=${i}">${i }</a></li>
        </c:forEach>
        <c:if test="${endPage<totalpage }">
           <li><a href="main.jsp?type=${type }&page=${endPage+1}">&gt;</a></li>
        </c:if>
      </ul>
   </div>
</body>
</html>