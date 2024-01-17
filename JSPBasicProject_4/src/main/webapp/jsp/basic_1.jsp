<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
211page=> 자바빈즈 => VO : 데이터를 모아서 브라우저 한번에 전송
          =====
           JSP:Bean, MyBatis:DTO, Spring:VO
           
           
           
           
           
        <jsp:useBean> : 객체생성
        => BoardVO vo=new BoardVO();
        
        <jsp:setProperty>
           get메소드 호출
           <jsp:getProperty name="vo" property="name">
           => <=%vo.getName() %>
        
        <jsp:include>****
           pageContext.include()
           <jsp:include page>

213page : 자바빈즈 만들기
          1) 데이터 저장할 변수 설정 => 캡슐화 => private설정
             private으로 설정이 되면 다른 클래스에서 사용이 불가능
             => 변수의 기능을 부여하는 메소드를 만든다
                ========메모리저장/메모리읽기
                        ------- -------
                        setter  getter
          2) getter/setter
             => set변수명():첫자는대문자
             => get변수명():첫자는대문자
             => private boolean이라면?
                => setter : is변수명()
                => getter : get변수명()
             => 여기서 사용하는 모든 getter/setter는 다른 클래스와 호환 => public
             => 데이터를 보호함과 동시에 메소드를 이용해서 처리
             => JSP => MemberBean, BoardBean
                
                
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>