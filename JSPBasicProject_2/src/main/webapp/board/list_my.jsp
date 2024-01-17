<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"
    errorPage="error.jsp"
%>
<% 
    //사용자 요청 => 요청 처리 결과를 받는다...
    //사용자가 페이지 요청 => 받는다 Object page=this
    String strPage=request.getParameter("page");
    if(strPage==null) //처음 실행 => 페이지 지정이 안된다 => 디폴트
    	strPage="1";
    
    //현재페이지 지정
    int curpage=Integer.parseInt(strPage);
    
    //오라클로부터 데이터 읽기
    BoardDAO dao=BoardDAO.newInstance();
    List<BoardVO> list=dao.boardListData(curpage);
    
    //총페이지
    int count=dao.boardRowCount();
    int totalpage=(int)(Math.ceil(count/10.0));
    
    //count변경 : 이렇게 해야 나중에 페이지가 넘어가도 번호관련 외우기
    count=count-((curpage*10)-10);
    
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
      text-align: center;
      text-decoration: none;
   }
   a:hover {
	color: green;
	text-decoration: underline;
}
   text-center{
    text-align: center;
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
           <td>
              <a href="insert.jsp">새글</a>
           </td>
        </tr>
     </table>
     <table class="table_content" width=800>
        <tr>
           <th width="10%">번호</th>
           <th width="45%">제목</th>
           <th width="15%">이름</th>
           <th width="20%">작성일</th>
           <th width="10%">조회수</th>
        </tr>
        <%
           for(BoardVO vo:list)
           {
        %>
             <tr>
               <td width="10%" class="text-center"><%=count-- %></td>
               <td width="45%">
               <% 
                  if(vo.getGroup_step()>0)
                  {
                	  for(int i=0;i<vo.getGroup_tab();i++)
                	  {
                		  out.write("&nbsp;&nbsp;");
                	  }
               %>
                          <img src="re_icon.png">
               <%
                  }
               %>
               
               <a href="detail.jsp?<%=vo.getNo() %>"><%=vo.getSubject() %></a> &nbsp;
               
               <%
                  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                  String today=sdf.format(new Date());
                  if(today.equals(vo.getDbday()))
                  {
               %>
                       <sup style="color: red;">new</sup>
               <%	  
                  }
               %>
               </td>
               <td width="15%" class="text-center"><%=vo.getName() %></td>
               <td width="20%" class="text-center"><%=vo.getDbday() %></td>
               <td width="10%" class="text-center"><%=vo.getHit() %></td>
             </tr>
        <%
           }
        %>
        <tr>
          <td colspan="5" class="text-center">
            <a href="#">이전</a>&nbsp;
            <%=curpage %> page / <%=totalpage %> pages&nbsp;
            <a href="#">다음</a>
        </tr>
     </table>
   </center>
</body>
</html>