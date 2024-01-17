<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('#updateBtn').click(function () {
		let name=$('#name').val()
		if(name.trim()==="")
		{
		    $('#name').focus();
		    return;
		}
		let subject=$('#subject').val()
		if(subject.trim()==="")
		{
		    $('#subject').focus();
		    return;
		}
		
		let no=$('#no').val()
		$.ajax({
			type:'post',
			url:'../board/update_ok.do',
			data:{"no":no,"name":name,"subject":subject,
				"content":content,"pwd":pwd}
			success:function(result)
			{
				if (result==="yes") {
					location.href="../board/detail.do?no="+no;
				}
				else {
					alert("비밀번호가 틀립니다")
					$('#pwd').val()
					$('#pwd').focus()
				}
			},
			error:funtion(err)
			{
				alert(err)
			}
		})
	})
	
})
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
   margin: 0px auto;
}
</style>
</head>
<body>
   <div class="wrapper row3">
     <main class="container clear"> 
     <h2 class="sectiontitle">글쓰기</h2>
     <div class="row row1" style="height: 500px">
       <form method="post" id="borad_frm">
        <table class="table">
          <tr>
            <th width=15% class="text-right">이름</th>
            <td width="85%">
              <input type=text name=name size=15 class="input-sm" value="${vo.name }"
               >
               <input type="hidden" name="no" value="${vo.no }" id="name">
            </td>
          </tr>
          <tr>
            <th width=15% class="text-right">제목</th>
            <td width="85%">
              <input type=text name=subject size=55 class="input-sm" value="${vo.subject }" id="subject">
            </td>
          </tr>
          <tr>
            <th width=15% class="text-right">내용</th>
            <td width="85%">
             <textarea rows="10" cols="57" name="content" id="content"></textarea>
            </td>
          </tr>
          <tr>
            <th width=15% class="text-right">비밀번호</th>
            <td width="85%">
              <input type=password name=pwd size=10 class="input-sm"
               id="pwd">
            </td>
          </tr>
          <tr>
             <td colspan="2" class="text-center inline">
               <input type="submit" value="글쓰기" class="btn-primary">
               <input type="button" value="취소" class="btn-primary"
                    onclick="javascript:history.back()">
             
             </td>
          </tr>
        </table>
        </form>
     </div>
     </main>
   </div>
</body>
</html>