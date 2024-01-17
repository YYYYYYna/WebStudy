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
white-space: nowrap; 	
overflow: hidden; 		
text-overflow: ellipsis;   
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1 class="text-center">맛집 리스트</h1>
         <table class="table">
           <c:forEach var="i" begin="1" end="10">
            <tr>
               <th width="10%" class="text-center">번호</th>
               <td width="15%" class="text-center"><img src="../main/mainlogo.png" width="20%"></td>
               <td width="20%" class="loc_title"><a href="fDetail.do">장소이름</a></td>
               <td width="55%">주소</td>
            </tr>
           </c:forEach>
         </table>
      </div>
   </div>
</body>
</html>