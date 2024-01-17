<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.loc_title{
white-space: nowrap; 	/* 텍스트가 줄바꿈 되지 않도록 함 */
overflow: hidden; 		/* 초과된 텍스트를 감추기 위해 오버플로우를 숨김 */
text-overflow: ellipsis;   
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1 class="text-center">명소 리스트</h1>
         <table class="table">
           <c:forEach var="vo" items="${list }">
            <tr>
               <th width="10%" class="text-center">${vo.no }</th>
               <td width="15%" class="text-center"><img src="${vo.poster }" width="100%"></td>
               <td width="20%" class="loc_title"><a href="sDetail.do">${vo.title }</a></td>
               <td width="55%">${vo.address }</td>
            </tr>
           </c:forEach>
         </table>
      </div>
      <div style="height: 20px"></div>
      <div class="row">
         <div class="text-center">
            <a href="../seoul/site.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
            ${curpage } page / ${totalpage } pages
            <a href="../seoul/site.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
         </div>
      </div>
      </div>
   </div>
</body>
</html>