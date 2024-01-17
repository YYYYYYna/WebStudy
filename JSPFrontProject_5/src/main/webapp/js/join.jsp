<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
   margin: 0 auto;
   width: 600px;
}
</style>
<script type="text/javascript">
window.onload=function(){
	let btn=document.querySelector('#postBtn');
	btn.addEventListener('click',()=>{
		window.open('post.jsp','post','width=500, height=500, scrollbars=yes')
		           //여는파일명  임의이름설정         창크키                스크롤바
	})
}
</script>
</head>
<body>
   <div class="continer">
      <div class="jumbotron">
         <h3 class="text-center">회원가입</h3>
      </div>
   </div>
   <div class="row row1">
     <form name="frm">
      <table class="table">
         <tr>
            <th class="text-right" width="15%">ID</th>
            <td width="85%">
               <input type="text" size="15" class="input-sm">
               <input type="button" value="중복체크" class="btn-sm btn-danger">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">비밀번호</th>
            <td width="85%">
               <input type="password" size="15" class="input-sm">
               &nbsp;재입력:<input type="password" size="15" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">이름</th>
            <td width="85%">
               <input type="text" size="15" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">성별</th>
            <td width="85%">
               <input type="radio">남자
               <input type="radio">여자
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">생년월일</th>
            <td width="85%">
               <input type="date" size="15" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">이메일</th>
            <td width="85%">
               <input type="text" size="50" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">우편번호</th>
            <td width="85%">
               <input type="text" size="7" class="input-sm" name="post1">
               <input type="text" size="7" class="input-sm" name="post2">
               <input type="button" value="우편번호 검색" class="btn btn-sm btn-primary" id="postBtn">               
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">주소</th>
            <td width="85%">
               <input type="text" size="50" class="input-sm" name="addr1">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">상세 주소</th>
            <td width="85%">
               <input type="text" size="50" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">전화번호</th>
            <td width="85%">
               <select class="input-sm">
                  <option>010</option>
                  <option>011</option>                  
               </select>
               <input type="text" size="20" class="input-sm">
            </td>
         </tr>
         <tr>
            <th class="text-right" width="15%">자기소개</th>
            <td width="85%">
               <textarea rows="5" cols="50"></textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="text-center">
               <input type="submit" value="회원가입" class="btn-sm btn-info">
               <input type="button" value="취소" class="btn-sm btn-warning">
            </td>
         </tr>
      </table>
      </form>
   </div>
</body>
</html>