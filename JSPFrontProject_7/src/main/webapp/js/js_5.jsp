<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let sawons=[
	{sabun:1, name:"홍길동", dept:"개발부", job:"대리", pay:4500},
	{sabun:2, name:"심청이", dept:"자재부", job:"사원", pay:3500},
	{sabun:3, name:"성춘향", dept:"기획부", job:"과장", pay:5500},
	{sabun:4, name:"박문수", dept:"총무부", job:"부장", pay:6500},
	{sabun:5, name:"이순신", dept:"영업부", job:"대리", pay:4500}
]
window.onload=function(){
	sawonList()
	sawonDetail(3)
	sawonInsert()
	sawonDelete()
	sawonSlice()
}
const sawonList=function(){
	console.log(sawons)
}
const sawonDetail=(sabun)=>{
	                   //find가가져온객체와 sabun이 같으면? 이란뜻
	let sawon=sawons.find(sa=>sa.sabun==sabun)
	console.log(sawon)
}
function sawonInsert() {
	sawons.push({sabun:6, name:"이몽룡", dept:"영업부", job:"대리", pay:4500})
}
//상수에 함수도 저장될수 잇구나....
const sawonDelete=()=>{
	sawons.pop()
	console.log(sawons)
}
const sawonSlice=()=>{
	let sa=sawons.slice(1,3)
	console.log(sa)
}
</script>
</head>
<body>

</body>
</html>
























