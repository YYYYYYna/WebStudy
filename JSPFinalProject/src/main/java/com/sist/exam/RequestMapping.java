package com.sist.exam;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
/*
 *   구분자
 *   => 찾기 => 인덱스
 *   => if문과 동일
 *   => 어노테이션 => 위에 존재
 *   @          @
 *   class A    class B
 *   
 *   //이렇게 해서 if문 대신 더 편하게 사용할 수 있음
 *   class A
 *   {
 *      @RequestMapping("a") => 요청값 a라면 => aaa()
 *      aaa()
 *      @RequestMapping("b") => 요청값 b라면 => bbb()
 *      bbb()
 *      @RequestMapping("c") => 요청값 c라면 => ccc()
 *      ccc()
 *      
 *   }
 */

//저장기간
@Retention(RUNTIME)
/*
 * RUNTIME
 * ======= 프로그램 종료시까지 유지
 * SOURCE
 * CLASS
 * ======= 컴파일후에 자동으로 메모리 해제
 */

//찾기 => 구분자
@Target(METHOD)
/*
 * TYPE ==> class
 * METHOD ==> method
 * FIELD ==> 멤버변수
 * PARAMETER ==> 매개변수
 * CONSTRUCTOR ==> 생성자
 * 
 * @ -> 이부분이 type
 * class A
 * {
 *    @ -> 이부분이 field
 *    B b=new B();
 *    
 *    @ -> 이부분이 method
 *    public void display(){}
 *    
 *    @ -> 이부분이 constructor
 *    A()
 *    
 *    public void aaa(@ => PARAMETER B b)
 * }
 * 
 * @RequestMapping("경로")
 * 
 */
public @interface RequestMapping {
	public String value();
}
