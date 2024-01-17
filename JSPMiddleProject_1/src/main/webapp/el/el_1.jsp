<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
SawonVO vo=new SawonVO();
vo.setName("홍길동");
vo.setDept("개발부");
request.setAttribute("vo", vo);
session.setAttribute("vo", vo);
SawonVO svo=(SawonVO)request.getAttribute("vo");

%>
<%--
     EL => Expression Language : 표현식
           => 데이터를 화면에 출력 (대체 <%= %>)
           => ${출력할 데이터}
     목적 : JSP페이지에서 자바코드를 최소화하는 정책
     
     1. EL
        연산자 / 내장 객체
        => Spring, Spring-Boot까지 이어짐
        
        1) 산술연산자
           + - * / % => 증감연산자는 없음
           + : 순수하게 산술만 가능함
               12 = ${5+7} = ${"5"+7} = ${null+12} : 자바와다름
               ${"A"+7} => 문자열결합안됨오류발생
               문자열 결합 연산자(+=)가 따로 있음 : 가7=${"가"+=7}
           / : div로 대신 표현 가능
               ${7/2} = ${7 div 2}
               
        2) 비교연산자 : boolean 조건문 처리할때 가장 많이 나옴
           == : eq로 대신 표현 가능
           != : ne로 대신 표현 가능
           < : lt로 대신 표현 가능
           > : gt로 대신 표현 가능
           <= : le로 대신 표현 가능
           >= : ge로 대신 표현 가능
           if(조건문) => 숫자/문자/날짜
                       <c:if test="${vo.getId==sessionScope.id}">
           
        3) 논리연산자
           && => and => 조건 두개가 true일때 true
           || => or => 조건 한개 이상 true일때 true
           ! => not => 부정연산자
           !(조건) => not(조건)
           
        4) 삼항연산자
           조건?값:값
               | |조건이 false일때
               |조건이 true일때
           : 페이지의 경우
             ${curpage>1?curpage-1:curpage}
             ${curpage<totalpage?curpage+1:curpage}
           
        5) 기타연산자
           => 배열출력 [] , 우선순위 () , 객체 접근 .
           => empty : 값이 null이거나 없을경우
      
      
      [12/12/화]
      => getParameter() => ?...GET/POST
      => setAttribute() => request에 기존에 있는 데이터 이외에 다른 데이터를 추가해서 사용
      
      => ${requestScope.name} => request.getAttribute("name")
                        ====키
      => ${sessionScope.id} => session.getAttribute("id")
                        ==키
      => request, session 저장시 map형식으로 저장
                               ======키+값
      
      => param에서 ${param.name}은 getParameter("name")와 같다
         이걸 응용해서 ${empty param.name }로 사용할수도 있음
      
      => requestScope는 생략이 가능
         ${requestScope.id} = ${id} 가 같음
      
      => request.setAttribute는 getParameter로 받을수 없다
      
      => 예를 들어 ?id=admin&pwd=1234 의 경우
         방법1) request.getParameter("id") => admin
               request.getParameter("pwd") => 1234
         방법2) ${param.id} => admin
               ${param.pwd} => 1234
         방법1, 방법2 둘다 같은 결과를 가져옴
         방법1 : 강제로 추가한 정보가 아니면 이걸사용
         방법2 : 그러나 방법1은 자바가 추가된 경우임으로 방법2가 default
         
      => Sawon vo=new Sawan();
         vo.setSabun(1);
         : 등등...
         request.setAttribute("vo",vo) => 이제 이게 나오면 JSP로 이동한다고 생각하면됨
         이젠 request값을 데이터 단위가 아닌 클래스 단위로 보냄...짱임
         Sawon vo=(Sawon)request.getAttribute("vo");
                  =================================
                  근데? 이걸 JSTL로 줄이면? ${vo.name}으로 줄이기 가능 
                                      -----------
                                      name=getName()메소드의 역할을 함
      => Model => DAO/VO/..자바로 코딩하는 모든 파일
                  ======이걸한개로 만들수 있음     
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_2_연산자</title>
</head>
<body>

<%--
   \${7+2 }=${7+2 } 
   <!-- 결과값) ${7+2}=9 -->
 --%>
 
<%--
 \${7/3 }=${7/3 } <br>
 \${7 div 3 }=${7 div 3 }<br>
 \${5%2 }=${5%2 }<br>
 \${5 mod 2 }=${5 mod 2 }
--%>

<%--
\${"Hello"=="Hello" }=${"Hello"=="Hello" }
<!-- 문자열도 비교연산자를 사용한다 -->

\${8==7 && 8<9 }=${8==7 && 8<9 } <br>
\${8==7 and 8<9 }=${8==7 and 8<9 }<br>
\${8==7 || 8<9 }=${8==7 || 8<9 }<br>
\${8==7 or 8<9 }=${8==7 or 8<9 }<br>

\${8==8?"OK":"NO" }=${8==8?"OK":"NO" }
--%>
JAVA<br>
이름 : <%=svo.getName() %><br>
부서 : <%=svo.getDept() %><br>

EL:request<br>
이름 : ${vo.name }<br>
부서 : ${vo.dept }<br>

EL:session<br>
이름 : ${sessionScope.vo.name }<br>
부서 : ${sessionScope.vo.dept }<br>

</body>
</html>