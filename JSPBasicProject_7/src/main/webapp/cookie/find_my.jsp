<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.*, java.util.*,com.sist.dao.*"%>
    
<%-- 메모리할당 --%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"/>
<%--
    쿠키 => 상태의 지속
           === state : 데이터 관리 => react/vue => 변수
                                     |
                                  props/state
           === 저장공간 : 브라우저 (로컬)
               ===== 메소드 제공
                     ========
                     = 1. 저장
                          new Cookie(키,값)
                          ================
                                 : 단점 = 문자열만 중복이 가능
                                 : 키는 중복이 불가능하다
                          ***Cookie는 반드시 해당 사용자 브라우저로 전송
                             => response는 한개 일만 수행이 가능
                             => Cookie / HTML => 한개만 선택가능
                                => JSP파일에서 
                                => JSP는 두개가 필요하다
                     = 2. 읽기
                          request.getCookie() => Cookie
                     = 3. 삭제
                          = setMaxAge(0)
                     = 4. 저장기간
                          = setMaxAge(초단위)
                     = 5. 키읽기 => getName()
                          값읽기 => getValue()
                     = 6. 저장경로설정 => setPath()
                                  
 --%>
 
<%
//이거 안적으면 한글 깨진걸로 인식해서 검색 안됨
request.setCharacterEncoding("UTF-8");
String fd=request.getParameter("fd");
String ss=request.getParameter("ss");
//이렇게 request를 두번 받아도 되나??
		
if(fd==null)
	fd="address";
if(ss==null)
	ss="마포";

String strPage=request.getParameter("page");
if(strPage==null)
	strPage="1";
int curpage=Integer.parseInt(strPage);
List<FoodVO> list=dao.foodListData(curpage, fd, ss);
/*
for(FoodVO vo:list)
{
	String s=vo.getName();
	if(s.length()>13)
	{
		s.substring(0,13)+"...";
		vo.setName(s);
	}
}
*/
int totalpage=dao.foodTotalPage(fd, ss);
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
width: 960px;
}
.storetitle{
white-space: nowrap; 	/* 텍스트가 줄바꿈 되지 않도록 함 */
overflow: hidden; 		/* 초과된 텍스트를 감추기 위해 오버플로우를 숨김 */
text-overflow: ellipsis;  /*초과된 텍스트 뒤를 ...으로 표시함 */
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
        <form method="post" action="find.jsp">
         <select name="fd" class="input-sm">
            <option value="address">주소검색</option>
            <option value="name">업체명검색</option>            
         </select>
         <input type="text" name="ss" size="20" class="input-sm" value="<%=ss%>">
         <button class="btn btn-sm btn-danger">검색</button>
         </form>
      </div>
      <div style="height: 30px"></div>
      <div class="row">
         <%
             for(FoodVO vo:list)
             {
         %>
                  <div class="col-md-4">
                    <div class="thumbnail">
                      <a href="detail_before.jsp?fno=<%=vo.getFno() %>&fd=<%=fd %>&ss=<%=ss %>">
                        <img src="https://www.menupan.com/<%=vo.getPoster() %>" title="<%=vo.getAddress() %>" style="width:100%">
                        <div class="caption">
                          <p class="storetitle"><%=vo.getName() %></p>
                        </div>
                      </a>
                    </div>
                  </div>
         <%
             }
         %>
      </div>
      <div style="height: 20px"></div>
      <div class="row">
         <div class="text-center">
           <a href="find.jsp?fd=<%=fd %>&ss=<%=URLEncoder.encode(ss,"UTF-8")%>&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-success">이전</a>
      <%=curpage %> page / <%=totalpage %> pages
      <a href="find.jsp?fd=<%=fd %>&ss=<%=ss %>&page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-info">다음</a>
         </div>
      </div>
      <div style="height: 20px"></div>
      <div class="row">
         <h3>최신 방문 맛집</h3>
         <hr>
         
      </div>
   </div>
</body>
</html>