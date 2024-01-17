package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.sist.controller.RequestMapping;
import com.sist.dao.SeoulDAO;
import com.sist.vo.SeoulVO;

import java.util.*;
public class SeoulModel {
  @RequestMapping("seoul/weather.do")
  public String seoul_weather(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  Document doc=Jsoup.connect("https://korean.visitseoul.net/weather").get();
		  Element section=doc.selectFirst("section#content");
		  String html="<section id=\"content\">";
		  html+=section.html();
		  html+="</section>";
		  html=html.replace("src=\"", "src=\"https://korean.visitseoul.net");
		  html=html.replace("제공 : 케이웨더(Kweather)", "");
		  request.setAttribute("html", html);
	  }catch(Exception ex) {}
	  request.setAttribute("main_jsp", "../seoul/weather.jsp");
	  return "../main/main.jsp";
  }
  /* 어노테이션 => 제어하는곳은 항상 밑(옆)에 있는 메소드를 호출함
   * 어노테이션으로 제어할 수 있는 부분
   * (인덱스/구분자)를 사용한다고 볼수 있음
   * @ => class 찾을때 여기 위치 ==> 메모리 할당
   * class A
   * {
   *    @ => 멤버변수찾을때 여기 위치 ==> 초기값 설정(TYPE)
   *    B b;
   *    public A(@ => 매개변수 찾을때 위치 B b) ==> 호출 매개변수를 값을설정(PARAMETER)
   *    {        
   *    }
   *    @ => 메소드 찾을때 위치 ==>  invoke()를 이용해서 호출(METHOD)
   *    public void display()
   *    {
   *    }
   * }
   * 
   * ***나중에는 그냥 @()형태로 나오고 어떤 부분에 
   *    어떤값을 할당한건지 알아야함 실행은 스프링이 해줌
   */
  //어노테이션 => 제어하는곳은 항상 밑(옆)에 있는 메소드를 호출함
  @RequestMapping("seoul/location.do")
  public String seoul_location(HttpServletRequest request,HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
	  {
		  page="1";
	  }
	  int curpage=Integer.parseInt(page);
	  int rowSize=20;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=(rowSize*curpage);
	  Map map=new HashMap();
	  map.put("start", start);
	  map.put("ent", end);
	  
	  List<SeoulVO> list=SeoulDAO.seoulLocationListData(map);
	  int totalpage=SeoulDAO.seoulLocationTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)*BLOCK;
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  //location.jsp에서 필요한 데이터를 전송
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("list", list);
	  request.setAttribute("main_jsp", "../seoul/location.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("seoul/nature.do")
  public String seoul_natrue(HttpServletRequest request,HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
	  {
		  page="1";
	  }
	  int curpage=Integer.parseInt(page);
	  int rowSize=20;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=(rowSize*curpage);
	  Map map=new HashMap();
	  map.put("start", start);
	  map.put("ent", end);
	  
	  List<SeoulVO> list=SeoulDAO.seoulNatureListData(map);
	  int totalpage=SeoulDAO.seoulNatureTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)*BLOCK;
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  //location.jsp에서 필요한 데이터를 전송
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("list", list);
	  request.setAttribute("main_jsp", "../seoul/nature.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("seoul/shop.do")
  public String seoul_shop(HttpServletRequest request,HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
	  {
		  page="1";
	  }
	  int curpage=Integer.parseInt(page);
	  int rowSize=20;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=(rowSize*curpage);
	  Map map=new HashMap();
	  map.put("start", start);
	  map.put("ent", end);
	  
	  List<SeoulVO> list=SeoulDAO.seoulShopListData(map);
	  int totalpage=SeoulDAO.seoulShopTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)*BLOCK;
	  
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  //location.jsp에서 필요한 데이터를 전송
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("list", list);
	  request.setAttribute("main_jsp", "../seoul/shop.jsp");
	  return "../main/main.jsp";
  }
  
  //어라 이거 상세보기 자르기
  @RequestMapping("seoul/location_detail.do")
  public String location_detail(HttpServletRequest request,HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  SeoulVO vo=SeoulDAO.seoulLocationDetailData(Integer.parseInt(no));
	  request.setAttribute("vo", vo);
	  String addr=vo.getAddress().substring(8);
	  String addr1=addr.substring(addr.indexOf(" "));
	  String addr2=addr1.trim().substring(0,addr.trim().indexOf(" "));
	  System.out.println(addr.trim());
	  request.setAttribute("main_jsp", "../seoul/location_detail.jsp");
	  return "../main/main.jsp";
  }
  
  
}