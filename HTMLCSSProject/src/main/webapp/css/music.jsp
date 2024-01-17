<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
    MusicDAO dao=new MusicDAO();
    List<MusicVO> list=dao.musicListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="table.css">
<!--
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $('input[type=text]').keyup(function(){
      // 속성 선택자
      let k=$(this).val();
      $('table.search > tbody > tr').hide();
      let temp=$('table.search > tbody > tr > td:nth-child(4n+2):contains("'+k+'")');
      $(temp).parent().show();
      
   })
});
</script>
-->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $('input[type=text]').keyup(function(){
      // 속성 선택자 
      let k=$(this).val();
      // console.log(k);
      $('table.search > tbody > tr').hide();
      let temp=$('table.search > tbody > tr > td:nth-child(4n+2):contains("'+k+'")');
      $(temp).parent().show();
      
   })
})
</script>
<style>
   *{
      margin: auto;
   }
   h1 {
	text-align: center;
}
   input {
	outline: none;
}
</style>
<title>GINIE MUSIC 50</title>
</head>
<body>
    <h1>Music TOP50</h1>
      <table class="table_content" width=850>
    <tr>
    <td>
    <span>노래 제목 검색창</span>
    <input type=text size=35>
    </td>
    </tr>
   </table>
   
   <table class="table_content search" width=850>
   <tr>
   <th></th>
      <th>곡명</th>
         <th>가수명</th>
            <th>앨범</th>
   </tr>
   <tbody>

       <%
          for(MusicVO vo:list)
          {
        %>
             <tr>
                <td align="center"><img src="<%=vo.getPoster() %>" width="30"></td>
                <td><%=vo.getTitle() %></td>
                <td><%=vo.getSinger() %></td>
                <td><%=vo.getAlbum() %></td>
             </tr>
        <%
          }
       %>
       </tbody>
    </table>
</body>
</html>