package com.sist.model;
import javax.servlet.http.HttpServletRequest;
/*
 *   MVC
 *   Model => java => 요청처리
 *   jsp => <% %>
 *   View => jsp => 요청 처리 결과만 받아섷 화면에 출력
 *           --------------------------------
 *           자바를 사용하지 않는다 => ${} , JSTL
 *           ======== <% %>
 *   Controller => servlet
 *           jsp에서 요청을 받아서 
 *           => 처리에 해당되는 모델을 찾아주는 역할수행
 *           => 모델을 찾은 후 메소드를 호출하면 request가 jsp로 연결해줌 : controller의 역할
 *   =========================================================================
 *      Controller를 Dispatcher(배달부)라고 부르기도 함
 *                  ---------------- 이미 제작됨
 *      => DispatcherServlet
 *      => FilterDispatchar
 *      => Controller => 서빙
 *         1) 주문을 받는다 => JSP 요청
 *         2) 주방을 거친다 => Model를 찾는다
 *         3) 음식 배달 => request를 한번에 전송
 *              
 *                   ip=주문내역                    ip=주문내역
 *     사용자(JSP) ==요청(request)==> Controller ==요청(request)==> 주방(Package):다양한요리진행
 *     => <a>, <form>                                           종류별요리(Model)
 *            JSP <====== Controller <==request.setAttribute()===  :주문(요리)처리
 *                                       결과물을 주문서와 동시에 보내줌
 *                                               
 *           
 */
//요청을 받아서 처리한 결과값 전송
public class ListModel {
	public String execute(HttpServletRequest request)
	{
		request.setAttribute("msg", "게시판 목록");
		return "list.jsp"; 
		//해당내용을 list.jsp로 보내라는 뜻
		//list.jsp는 request를 받아서 출력하는 장소
	}
}
