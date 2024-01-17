<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../jsp/table.css">
<style type="text/css">
   .title{
       width:280px;
       margin: 30px auto;
       display: flex;
       justify-content: space-between;
   }
   a{
      color: black;
      text-align: center;
   }
   a:hover {
	color: green;
	text-decoration: underline;
}
   text-center{
    text-align: center;
   }
   .submitArea{
     border-top: 2px solid black;
   }
   .submitArea button {
	
}
</style>
</head>
<body>
   <center>
   
    <div class="title">
      <img src="mainlogo.png" width="80" height="80">
      <h1>자유 게시판</h1>
     </div>
     <form method="post" action="insert_ok.jsp">
     <table class="table_content" width=800>
         <tr>
            <th width="20%">이름</th>
            <td width="80%">
               <input type="text" name="name" size="15" required="required">
            </td>
         </tr>
         <tr>
            <th width="20%">제목</th>
            <td width="80%">
               <input type="text" name="subject" size="45" required="required">
            </td>
         </tr>
         <tr>
            <th width="20%">내용</th>
            <td width="80%">
               <textarea rows="10" cols="50" name="content" required="required"></textarea>
            </td>
         </tr>
         <tr>
            <th width="20%">비밀번호</th>
            <td width="80%">
               <input type="password" name="pwd" size="10" required="required">
            </td>
         </tr>
         <tr class="submitArea">
            <td colspan="2" class="text-center">
               <button>글쓰기</button>
               <input type="button" value="취소" onclick="javascript:history.back()">
            </td>
         </tr>
     </table>
     </form>
</body>
</html>