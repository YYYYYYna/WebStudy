package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;


/*
     XML 파싱
     Annotation => 클래스 찾기 => 메소드 찾기
     => MVC동작
        1. 요청을 한다 (jsp파일에서!) : 보통 <a>,<form> 에서 요청함
           => DispatcherServlet(Controller) => 이미 제작되어있음
           => @WebServlet("*.do")
                  |       ====== list.do, insert.do
                  |              ----     ------
                  |              우리는 이 구분문자를 잘라내서 사용함
                  |서버에서 받을수 있는 부분
                   URI, URL => 서버연결주소
                   => URI를 이용해서 모델을 찾음
        2. DispatcherServlet (Controller)
           역할
           ===요청을 받는다 (브라우저 => 요청을 받는 파일
                                  => JSP / Servlet)
                         JSP =====> View(화면출력)
                         Servlet ==> 연결(자바/HTML)
                                     ============
           ===분리된 Java를 찾는다 ===> 연결
                              request/session
        3. MVC 목적
           1) 보안 (JSP => 배포 (소스를 통으로 전송)) => 유지보수
           2) 여러명이 동시개발을 할수 있게 만들어주는게 백/프론트 구분
           3) JSP의 단점 : 확장성, 재사용, 변경 이 안됨
           4) 신규사원 확장
        4. 소프트웨어 => 회귀
        ================
        
        5. 동작
                     request
        JSP (링크,버튼) ======= DispatcherServlet
                             => Model(DAO와 연동)
                                =====
                                request에 결과값 담기
                                => setAttribute()
                   <===========
                     request 필요하다 => request를 JSP로 전송
                        JSP request를 전송 메소드
                        => forward(request,response)
                     request 필요없다 => 화면만 이동
                        화면만 전송하는 메소드
                        => sendRedirect(파일명)
                        => 회원가입, 로그인, 글쓰기...
                        => INSERT/UPDATE/DELETE
       => DispatcherServlet은 수정 => 고정한다 => .jar
       
       1. 설정 파일
          Spring : application-context.xml
                   application-datasource.xml
                   application-security.xml
                   => 태그나 속성은 Spring에서 제공하는 것만 사용이 가능
                   => 그러나 dtd라고 이것만 사용해야한다고 정해놓은것도 있음
                   
 */
import java.util.*;
import java.net.*;
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsList=
	            new ArrayList<String>(); // ArrayList 안에 class 저장
	public void init(ServletConfig config) throws ServletException {
		//1.xml안에 경로를 읽기 => xml안에 클래스 등록
		try {
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
			System.out.println(file.getPath());
			String path=file.getPath();
			//이부분 경로명 자르는 부분인데 맥/윈도우를 여기서 경로명 바꿀수 있음
			path=path.replace("\\", File.separator);
			//아래는 실행하면 주소에서 맨 마지막 classes를 자를수 있음
			path=path.substring(0,path.lastIndexOf(File.separator));
			//C:\webDev\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPFinalProject\WEB-INF\classes
			System.out.println(path);
			//이제 잘린게 확인되었으면 뒤에 xml 주소를 넣어주면됨
			path=path+File.separator+"application.xml";
			//아래는 이제 완성본!
			System.out.println(path);
			//C:\webDev\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPFinalProject\WEB-INF\application.xml
		    
			//이제 xml 파싱(xml안에서 필요한 데이터 추출)하는 차례~~~
			//1. 파서기 생성
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();//파서기생성
			DocumentBuilder db=dbf.newDocumentBuilder();//파서기등장
			
			//2. XML을 전송
			Document doc=db.parse(new File(path));
			
			//3. root태그 읽기 => 테이블
			Element root=doc.getDocumentElement(); //Beans(root)태그 아래에 bean태그를 가져오라는뜻
			
			//4. root태그 밑에 있는 태그를 모아서 사용
			NodeList list=root.getElementsByTagName("bean"); //NodeList가 태그들을 모아주는 역할을 함
			for(int i=0;i<list.getLength();i++)
			{
				// <bean id="board" class="com.sist.model.BoardModel"/>
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id"); //id="board" 이부분 읽음
			    String cls=bean.getAttribute("class"); //class="com.sist.model.BoardModel" 이부분 읽음
			    System.out.println(id+"=>"+cls); //확인차 한번 출력시켜봄
			    /*
			     그럼 이렇게 나옴~~!! 와 신난다~!~! ^0^
			     board=>com.sist.model.BoardModel
                 main=>com.sist.model.MainModel
                 notice=>com.sist.model.NoticeModel
                 member=>com.sist.model.MemverModel
			     */
			    clsList.add(cls);
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		uri=uri.substring(request.getContextPath().length()+1);
		try {
			for(String cls:clsList)
			{
				Class clsName=Class.forName(cls);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
				     RequestMapping rm=m.getAnnotation(RequestMapping.class);
				     //URI주소는 list.do 이부분을 말하는거임
				     if(rm.value().equals(uri))
				     {
				    	 String jsp=(String)m.invoke(obj,request,response);
				    	 if(jsp==null) //void로 넘어가면 리턴형이 없다는뜻
				    	 {
				    		 return;
				    	 }
				    	 else if(jsp.startsWith("redirect:"))
				    	 {
				    		 //retrun "redirect:list.do"
				    		 jsp=jsp.substring(jsp.indexOf(":")+1);
				    		 response.sendRedirect(jsp);
				    	 }
				    	 else
				    	 {
				    		 RequestDispatcher rd=
				    				 request.getRequestDispatcher(jsp);
				    		 rd.forward(request, response);
				    	 }
				    	 return;
				     }
				}
			}
		}catch(Exception ex) {}
	}

}
