<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*,com.sist.change.*"%>
<%
request.setCharacterEncoding("UTF-8");
String mode=request.getParameter("mode");
if(mode==null){
	mode="1";
}
int no=Integer.parseInt(mode);
String jsp=jspChange.change(no);
%>
<!DOCTYPE html>
<html>
<head>
<title>Gravity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- header 있던 자리 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- home 있던 자리 -->
<jsp:include page="<%=jsp %>"></jsp:include>
<!-- footer 있던 자리 -->
<jsp:include page="footer.jsp"></jsp:include>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<!-- JAVASCRIPTS --> 
<script src="../layout/scripts/jquery.min.js"></script> 
<script src="../layout/scripts/jquery.backtotop.js"></script> 
<script src="../layout/scripts/jquery.mobilemenu.js"></script> 
<script src="../layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>