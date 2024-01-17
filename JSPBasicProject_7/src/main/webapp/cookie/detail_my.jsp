<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.FoodModel"></jsp:useBean>
<%
model.foodDetailData(request);
%>

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
margin: 0 auto;
width: 960px;
}
.table{
margin: 0 auto;
}
</style>
</head>
<body>
   <div class="container">
      <div class="col-sm-7">
         <table class="table">
            <tr>
               <td width="30%" class="text-center" rowspan="9">
                  <img src="https://www.menupan.com/${vo.poster }" style="width: 100%">
               </td>
            </tr>
            <tr>
               <td colspan="1">
                  <h3>${vo.name }&nbsp;<span style="color: orange;">${vo.score }</span></h3>
               </td>
            </tr>
            <tr>
               <td width="15%">주소</td>
               <td width="55%">${vo.address }</td>
            </tr>
            <tr>
               <td width="15%">전화</td>
               <td width="55%">${vo.phone }</td>
            </tr>
            <tr>
               <td width="15%">음식종류</td>
               <td width="55%">${vo.type }</td>
            </tr>
            <tr>
               <td width="15%">가격대</td>
               <td width="55%">${vo.pirce }</td>
            </tr>
            <tr>
               <td width="15%">좌석</td>
               <td width="55%">${vo.seat }</td>
            </tr>
            <tr>
               <td width="15%">영업시간</td>
               <td width="55%">${vo.time }</td>
            </tr>
            <tr>
               <td width="15%">테마</td>
               <td width="55%">${vo.theme }</td>
            </tr>
            <tr>
               <td width="15%">소개</td>
               <td width="55%">${vo.content }</td>
            </tr>
            <tr>
               <td colspan="2" class="text-right">
                  <a href="find.jsp?fd=${fd}&ss=${ss}" class="btn btn-sm btn-danger">목록</a>
               </td>
            </tr>
         </table>
      </div>
      <div class="col-sm-5">
         
      </div>
   </div>
</body>
</html>