package com.sist.change;

public class jspChange {
	private static String[] jsp= {
			"",                         //0
			"../main/home.jsp",         //1
			"../food/food_find.jsp"     //2
	};
	public static String change(int no)
	{
		return jsp[no];
	}
}
