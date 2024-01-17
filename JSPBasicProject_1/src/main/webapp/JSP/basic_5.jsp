<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
         for문의 경우에는 특별한 경우가 아니면 for-each구문을 사용함
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   //활성화, 비활성화할때 이렇게 짜면됨
   int sum=0,even=0,odd=0;
   for(int i=1;i<=100;i++)
   {
	   sum+=i;
	   if(i%2==0)
	   {
		   even+=i;
	   }
	   else
	   {
		   odd+=i;
	   }
   }
%>
<h3>1~100까지의 총합 : <%=sum %></h3>
<h3>1~100까지의 짝수 총합 : <%=even %></h3>
<h3>1~100까지의 홀수 총합 : <%=odd %></h3>
</body>
</html>