package com.sist.model;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.controller.*;
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response)
	{
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> aList=dao.foodBestListData("한식");
		List<FoodVO> bList=dao.foodBestListData("양식");
		List<FoodVO> cList=dao.foodBestListData("중식");
		List<FoodVO> dList=dao.foodBestListData("일식");
		
		request.setAttribute("aList", aList);
		request.setAttribute("bList", bList);
		request.setAttribute("cList", cList);
		request.setAttribute("dList", dList);
		
		Cookie[] cookies=request.getCookies();
		List<FoodVO> klist=new ArrayList<FoodVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith("food_"))
				{
					String fno=cookies[i].getValue();
					FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
					klist.add(vo);
				}
			}
		}
		request.setAttribute("klist", klist);
		request.setAttribute("size", klist.size());
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}

}
