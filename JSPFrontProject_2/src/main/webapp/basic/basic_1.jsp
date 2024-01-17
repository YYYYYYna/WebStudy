<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--
     자바와 자바스크립트 연동
     ~VO === {} => Object
             == 자바스크립트 객체 표현법 => JSON
     ~List === [{},{},{}] => Array
     => 브라우저 안에서 자바에서 연동된 데이터를 받아서 동적으로 변환
     
     => 자바스크립트 사용법
        1) 내부 스크립트 (파일한개제어)
        2) 외부 스크립트 (여러개 파일을 동시에 제어, 재사용)
           원격 : http://~
           내부 : 경로명
        3) 인라인 스크립트 : 태그한개 제어
           ex: onclick="javascript:history.back()"
     => 버전
        ES5 ==> ES6
        변수 ==> 자동지정변수
                var 에서 let,const로 바뀜
                또한 화살표함수가 많이 등장함
                let a=10 => a:Int
                let a=[] => a:Array
                let a={} => a:Object
            ==> 같다 : ===
                같지않다 : !==
     => 자바스크립트 출력(결과값)
        1. alert()
        2. console.log()
        3. document.write()
        4. innerHTML => AJAX, Vue, React
        
 --%>
<title>Insert title here</title>
<script type="text/javascript">
/*
     => 변수
        1) 변수선언 (데이터형이 없다) => 값에 따라서 자동으로 데이터형이 변경됨
           var에서 변수:let,상수:const로 바뀜
           var의 단점은 지역변수의 스코프가 명확하지 않다
                     : 지역변수의 사용범위가 넘어서도 메모리해제가 안되서 
                       static처럼 계속 사용됨 let은 이 부분을 보완함.
        2) 식별자
           키워드는 사용할 수 없다.
           특수문자 사용이 가능하다.
           숫자로 시작할 수 없다
           공백이 있ㅇ면 안된다
           대소문을 구분한다
           문자길이는 상관없다
        
        3) 규칙
           생성자는 대문자 -> 객체지향 -> React
           변수, 함수 => 소문자
           단어가 여러개인 경우에는 시작 대문자
           => 변수는 한개의 데이터를 저장하는 메모리 공간
        
        4) 데이터형 (자바스크립트에서 지원)
           let i=10 ==> int
           let i=10.0 ==> double
           let i='A' ==> char
           let i="A" ==> String
           let i=true ==> boolean
                          Boolean(0) => false
                          Boolean(1~9) => true
           let i={키1:값1, 키2:값2, ...} ==>
                  --      --
                  |키=멤버변수|
                   값을 부를때는? i.키1 => 값1
           
           let i=[] ==> i:array(배열)
           ========>데이터형이 달라도 배열 가능          
           
           let i=function(){} ==> 변수형도 가능
                 ============> Number(정수,실수), String(문장열,문자), Boolean, 
                               Object, Array, Function 다 가능
        5) 데이터형 확인 : typeof
        6) 메인함수
           자바에서는? main()
           js에서는? window.onload=function(){}
           VueJs? mounted()
           React? componentDidMount()
           JQuery? $(function(){})
                   ex) $(document).ready(function(){})
                       ==================
                    	   이부분생략된거임                   	   
 */
 
 //main함수실습
 window.onload=function(){
               /*sysout같은 출력방법
                 출력물 => console.log(출력물)
                 브라우저출력 => document.write()
                 팝업 => alert()
                 태그안에 출력 : innerHTML
               */
          //1. 변수선언
          let a=10;
          let b=10.5;
          let c='ABC';
          let d="ABC";
          let e=[1,2,3,4,5,"홍길동"]; //Array가 Object형이라 데이터형이 달라도 가능
          let f={name:'홍길동', sex:"남자", age:20};
          let g=true;
          
          console.log("a="+a);
          console.log("b="+b);
          console.log("c="+c);
          console.log("d="+d);
          console.log("e="+e);
          console.log("f="+f);
          console.log("g="+g);
          
          /*
          document.write("a="+a+"<br>");
          document.write("b="+b+"<br>");
          document.write("c="+c+"<br>");
          document.write("d="+d+"<br>");
          document.write("e="+e+"<br>");
          document.write("f="+f+"<br>");
          document.write("g="+g+"<br>");
          */
          
          let i="a="+a+"<br>"
             +"b="+b+"<br>"
             +"c="+c+"<br>"
             +"d="+d+"<br>"
             +"e="+e+"<br>"
             +"f="+f+"<br>"
             +"g="+g+"<br>"
             +"<hr>"
          let k=document.querySelector("span");
          k.innerHTML=i;
          
          document.write("a="+typeof a+"<br>");
          document.write("b="+typeof b+"<br>");
          document.write("c="+typeof c+"<br>");
          document.write("d="+typeof d+"<br>");
          document.write("e="+typeof e+"<br>");
          document.write("f="+typeof f+"<br>");
          document.write("g="+typeof g+"<br>");
          //let i; //이미 i로 존재하기 때문에 오류남
          //document.write("i="+typeof i+"<br>");
          let h;          
          document.write("h="+typeof h+"<br>");
          document.write("j="+typeof j+"<br>");
          //정의되지않음+값이없음 ==> undefined
          
          let o=10;
          document.write("o="+typeof o+"<br>");
          o="Hello";
          document.write("o="+typeof o+"<br>");
}
</script>
</head>
<body>
   <span></span>
</body>
</html>