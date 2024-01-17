<%@page import="com.sist.dao.BoardVO"%>
<%@page import="com.sist.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 요청 데이터 받기
   //***request.setCharacterEncoding() 
   //   => 디코딩 과정이 없는이유는 한글이 아니라 알파벳/숫자이기 때문에 안해도됨
   String no=request.getParameter("no");
   String curpage=request.getParameter("page");
   
   //2. 오라클에서 데이터 가지고오기
   BoardDAO dao=BoardDAO.newInstance();
   BoardVO vo=dao.boardDetailData(Integer.parseInt(no));

   //3. 화면에 출력하기
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
   .title{
       width:280px;
       margin: 30px auto;
       display: flex;
       justify-content: space-between;
   }
   a{
      color: black;
      text-decoration: none;
   }
   a:hover{
      color: green;
      text-decoration: underline;
   }
   .text-right{
      text-align: right;
   }
</style>
</head>
<body>
  <center>
   <div class="title">
      <img src="mainlogo.png" width="80" height="80">
      <h1>자유 게시판</h1>
     </div>
    <table class="table_content" width=800>
       <tr>
        <th width="20%">번호</th>
        <td width="30%" class="text-center"><%=vo.getNo() %></td>
        <th width="20%">작성일</th>
        <td width="30%" class="text-center"><%=vo.getDbday() %></td>
      </tr>
       <tr>
        <th width="20%">이름</th>
        <td width="30%" class="text-center"><%=vo.getName() %></td>
        <th width="20%">조회수</th>
        <td width="30%" class="text-center"><%=vo.getHit() %></td>
      </tr>
       <tr>
        <th width="20%">제목</th>
        <td width="30%" colspan=3><%=vo.getSubject() %></td>
      </tr>
      <tr>
         <td colspan="4" class="text-left" valign="top" height="200"><pre style="white-space: pre-wrap;"><%=vo.getContent() %></pre></td>
      </tr>
      <tr>
        <td colspan="4" class="text-right">
           <a href="reply.jsp?no=<%=no%>&page=<%=curpage%>">답변</a>&nbsp;
           <a href="update.jsp?no=<%=no%>&page=<%=curpage%>">수정</a>&nbsp;
           <span id="delBtn" style="cursor: pointer;">삭제</span>&nbsp;
            <a href="list.jsp?page=<%=curpage%>">목록</a>
           <!-- back()을 하면 newinstance를 생성함으로 조회수증가가안됨 -->
        </td>
      </tr>
      <tr style=display: none; id="del">
         <td colspan="4" class="text-right">
          <form method="post" action="delete.jsp">
           <input type="hidden" name="no" value="<%=no%>">
           <input type="hidden" name="page" value="<%=curpage%>">
          비밀번호 : <input type="password" name="pwd" size="15">
          <button>삭제</button>
          </form>
         </td>
      </tr>
    </table>
  </center>
</body>
</html>