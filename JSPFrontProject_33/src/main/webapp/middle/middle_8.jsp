<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
   margin-top: 50px
}
.row{
   margin: 0 auto;
   width: 800px;
}
</style>
<script type="text/javascript">
//이전 다음에 대한 전역변수를 잡아놔야함
let index=1;
let prev=()=>{
	index--;
	if(index<1)
		index=7;
	let img=document.querySelector('img');
	img.src='../image/m'+index+'.jpg'
}
let next=()=>{
	index++;
	if(index>7)
		index=1;
	let img=document.querySelector('img');
	img.src='../image/m'+index+'.jpg'
}
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="text-center">
            <img src="../image/m1.jpg" style="width: 570px; height: 270px;">
         </div>
      </div>
      <div style="height: 10px;"></div>
      <div class="row">
         <div class="text-center">
            <input type="button" class="btn-lg btn-primary" value="이전" onclick="prev()">
            <input type="button" class="btn-lg btn-danger" value="다음" onclick="next()">
         </div>
      </div>
   </div>
</body>
</html>