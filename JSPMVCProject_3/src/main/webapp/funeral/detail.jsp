<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row{
   margin: 0px auto;
   width: 800px;
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1 class="text-center">내용보기</h1>
         <table class="table">
            <tr>
               <td colspan="4"><img class="text-center" src="${vo.infoimage }"></td>
            </tr>
            <tr>
               <th width="20%" class="text-center info">번호</th>
               <td width="30%" class="text-center">${vo.mno }</td>
               <th width="20%" class="text-center info">순서명</th>
               <td width="30%" class="text-center">${vo.infoh3 }</td>
            </tr>
            <tr>
               <th width="20%" class="text-center info">내용</th>
               <td colspan="3">${vo.infop }</td>
            </tr>
            <tr>
               <td colspan="4" class="text-right">
                  <a href="#" class="btn btn-xs btn-warning">수정</a>
                  <a href="#" class="btn btn-xs btn-info">삭제</a>
                  <a href="list.do" class="btn btn-xs btn-success">목록</a>
               </td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>