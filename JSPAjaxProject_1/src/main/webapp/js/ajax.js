let httpRequest=null;
//브라우저 내장객체를 생성하는 함수
function getXMLHttpRequest()
{
	//window.ActiveObject => 인터넷익스플로어
	if(window.getXMLHttpRequest) // => 기타브라우저(크롬등등..)
	{
		return new XMLHttpRequest();
		//XMLHttpRequest()의 클래스가 서버로 요청하고 결과값 받기
	}
	else
	{
		return null;
	}
}
//서버에 요청 : 매개변수로 함수(=callback)을 받아서 사용함
function sendRequest(url,params,callback,method)
{
	//1. XMLHttpRequest 를 받기
	httpRequest=getXMLHttpRequest();
	
	//2. 전송방식처리 : method가 null이 아니면 GET방식 사용
	let httpMethod=method?method:'GET'
	if(httpMethod!='GET' && httpMethod!='POST')
	{
		httpMethod='GET'
	}
	let httpParams=(params==null||params=='')?null:params
	let httpUrl=url;
	
	//3. get방식일때
	if(httpMethod=='GET'&& httpParams!=null)
	{
		httpUrl=httpUrl+"?"+httpParams
	}
	
	//4. 연결시도
	httpRequest.open(httpMethod,httpUrl,true)
	httpRequest.setRequestHeader('Content-Type',"application/x-www-form-unlencoded")
	httpRequest.onreadystatechange=callback
	httpRequest.send(httpMethod=='POST'?httpParams:null)
	
}

