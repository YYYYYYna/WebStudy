package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import java.text.*;

//모든데이터는 모델이서 보낸다!!

public class ReserveModel {
	@RequestMapping("reserve/date.do")
	public String reserve_date(HttpServletRequest reqeust,HttpServletResponse response)
	{
		String today=new SimpleDateFormat("yyyy-M-d").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		int year=Integer.parseInt(st.nextToken());
		int month=Integer.parseInt(st.nextToken());
		int day=Integer.parseInt(st.nextToken());
		String[] strWeek= {"일","월","화","수","목","금","토"};
		
		//요일, 마지막날
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);		
		int week=cal.get(Calendar.DAY_OF_WEEK);
		week=week-1;
		
		int lastday=cal.getActualMaximum(Calendar.DATE);
		
		reqeust.setAttribute("week", week);
		reqeust.setAttribute("lastday", lastday);
		reqeust.setAttribute("year", year);
		reqeust.setAttribute("month", month);
		reqeust.setAttribute("day", day);		
		reqeust.setAttribute("strWeek", strWeek);		
		reqeust.setAttribute("main_jsp", "../reserve/date.jsp"); //이문장의뜻은 "main.jsp"안에 "../reserve/date.jsp"를 출력시키란말
		return "../main/main.jsp";
	}
}
