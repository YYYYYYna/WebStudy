<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String type="한식";
    FoodDAO dao=new FoodDAO();
    List<FoodVO> list=dao.foodCategoryList(type);
    request.setAttribute("list", list);
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
    width: 600px;
}
.row1{
    margin: 0 auto;
    width: 600px;
    height: 450px;
    overflow-y: auto;
}
.button{
    margin-bottom:50px 
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('.btn').click(function () {
		let type=$(this).attr("value"); //한식,중식,일식중 한개를 가져옴
		//alert(type)
		$.ajax({
			type:'post', //type=변수명
			url:'result.jsp',
			data:{"type":type}, //?역할부분
		    success:function(result)
		    {
		    	$('#print').html(result)
		    }
		}) 
	});
});
</script>
</head>
<body>
   <div class="container">
     <div class="row">
        <div class="button text-center">
           <input type="button" value="한식" class="btn btn-sm btn-danger">
           <input type="button" value="중식" class="btn btn-sm btn-primary">
           <input type="button" value="양식" class="btn btn-sm btn-info">
           <input type="button" value="일식" class="btn btn-sm btn-success">
        </div>
     </div>
     <div class="row row1" id="print">
     </div>
   </div>
</body>
</html>