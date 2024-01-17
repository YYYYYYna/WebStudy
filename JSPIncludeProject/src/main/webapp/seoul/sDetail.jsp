<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-bottom: 1px solid #d2d2d2;
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1 class="text-center">장소 상세보기</h1>
         <table class="table">
            <tr><td colspan="4"><img src="${vo.poster }"></td></tr>
            <tr>
               <th class="info text-center" width="10%">번호</th>
               <td width="10%">${vo.no }</td>
               <th class="info text-center" width="10%">장소명</th>
               <td width="70%">${vo.title }</td>
            </tr>
            <tr>
               <th class="info text-center" width="10%" class="text-center">주소</th>
               <td colspan="3" width="10%">${vo.address }</td>
            </tr>
            <tr>
               <th class="info text-center" width="10%" class="text-center">설명</th>
               <td colspan="3" width="10%">${vo.msg }</td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>