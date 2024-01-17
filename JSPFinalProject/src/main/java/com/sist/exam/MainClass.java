package com.sist.exam;
import java.lang.reflect.Method;
import java.util.*;
class Model
{
	@RequestMapping("a") //이 "밑에" 있는 메소드가 호출됨
	public void aaa()
	{
		System.out.println("Model:aaa()");
	}
	@RequestMapping("b")
	public void bbb()
	{
		System.out.println("Model:bbb()");
	}
	@RequestMapping("c")
	public void ccc()
	{
		System.out.println("Model:ccc()");
	}
}
public class MainClass {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		System.out.print("검색어 입력 : ");
		String fd=scan.next();
		
		/*	
		//기존에 if문으로 사용햇던 방법
		Model model=new Model();	
		if(fd.equals("a"))
			model.aaa();
		else if(fd.equals("b"))
			model.bbb();
		else if(fd.equals("c"))
			model.ccc();
		*/
		
		//if문 없이 어노테이션으로 최적화된 방법
		try {
			//1. 클래스 정보를 가져오기
			Class clsName=Class.forName("com.sist.exam.Model");
			//2. 메모리 할당
			Object obj=clsName.getDeclaredConstructor().newInstance();
			
			//3. 메소드 읽기
			Method[] methods=clsName.getDeclaredMethods();
			for(Method m:methods)
			{
				RequestMapping rm=m.getAnnotation(RequestMapping.class);
				if(rm.value().equals(fd))
				{
					m.invoke(obj, null);
					break;
				}
			}
		}catch(Exception ex) {}
	}
}
