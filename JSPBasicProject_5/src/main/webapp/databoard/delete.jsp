<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.io.*"%>
    
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"/>
<%
    //1. 요청값을 받는다
    String no=request.getParameter("no");
    
    //2. 데이터 베이스 처리
    DataBoardBean vo=dao.boardFileInfoData(Integer.parseInt(no));
    //2-1.데이터삭제처리
    dao.boardDelete(Integer.parseInt(no));
    //2-2.파일삭제처리
    try{
    	if(vo.getFilesize()>0)
    	{
    		File file=new File("c:\\download\\"+vo.getFilename());
    		file.delete();
    	}
    }catch(Exception ex){}
    
    //3. 화면이동 => 기존의 화면으로 이동
    response.sendRedirect("list.jsp");
%>