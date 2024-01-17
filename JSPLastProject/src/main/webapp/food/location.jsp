<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../food/food.css">
<style type="text/css">
.images:hover, .foodImg:hover {
	cursor: pointer;
}
</style>
<!--  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>-->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		//$("#dialog").dialog();

		$('.images').click(function() {
			let gu = $(this).attr('data-value')
			location.href = "../food/location.do?gu=" + gu
		});
		
		$('.foodImg').click(function () {
			let fno=$(this).attr("data-fno");
			$.ajax({
				type:'post',
				url:'../food/location_detail.do',
				data:{"fno":fno},
				success:function(res){
					let json=JSON.parse(res);
					
					$('#name').html(json.name+'<span style="color:orange">'+json.score+'</span>')
					$('#type').text(json.type)
					let temp=json.theme;
            let theme=temp.split(",")
            let html='<ul>'
            for(let t of theme)
               {
               html+='<li>'+t+'</li>'
               }
            html+='</ul>'
            $('#theme').html(html)
            $('#phone').text(json.phone)
					$('#theme').text(json.theme)
					$('#phone').text(json.phone)
					$('#address').text(json.address)
					$('#time').text(json.time)
					$('#seat').text(json.seat)
					$('#price').text(json.price)
					$('#content').text(json.content)
					$('#poster').attr("src",json.poster)
					
					$('#dialog').dialog({
				       autoOpen:false,
				       width:650,
				       height:630,
				       modal: true
				       }).dialog("open")
				}
			})
			
		})
	});
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">서울 지역별 맛집 찾기</h2>
			<div class="row">
				<div class="text-center">
					<!-- 출력부 -->
					<div id="a">
						<img id="seoul_1" src="../food/map/1111.png">
						<c:forEach var="i" begin="1" end="25">
							<img id="gu${i }" src="../food/map/gu_${i }_off.png"
								onmouseover="this.src='../food/map/gu_${i }_on.png'"
								onmouseout="this.src='../food/map/gu_${i }_off.png'"
								class="images" data-value="${i }">
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- main body -->
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">${address } 맛집</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list }" varStatus="s">
								<li class="one_quarter ${s.index%4==0?'first':''}"><img
									src="${vo.poster }" title="${vo.name }" class="foodImg"
									data-fno="${vo.fno }"></li>
							</c:forEach>
						</ul>
					</figure>
				</div>
				<nav class="pagination">
					<ul>
						<!-- class="current" -->

						<c:if test="${startpage>1 }">
							<li><a
								href="../food/location.do?page=${startpage-1 }&gu=${gu}">&laquo;
									Previous</a></li>
						</c:if>

						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<li ${i==curpage?"class=current":"" }><a
								href="../food/location.do?page=${i }&gu=${gu}">${i }</a></li>
						</c:forEach>

						<c:if test="${endpage<totalpage }">
							<li><a
								href="../food/location.do?page=${endpage+1 }&gu=${gu}">Next
									&raquo;</a></li>
						</c:if>

					</ul>
				</nav>
			</div>
			<!-- / main body -->

		</main>
		<div class="clear"></div>

		<!-- dialog 창 시작 -->
		<div id="dialog" title="맛집상세보기" style="display:;">
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="8"><img
						id="poster"></td>
					<td colspan="2">
						<h3 id="name"></h3>
					</td>
				</tr>
				<tr>
					<td width="20%" class="text-left">업종</td>
					<td width="50%" id="type"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">전화</td>
					<td width="50%" id="phone"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">주소</td>
					<td width="50%" id="address"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">테마</td>
					<td width="50%" id="theme"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">영업시간</td>
					<td width="50%" id="time"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">가격대</td>
					<td width="50%" id="price"></td>
				</tr>
				<tr>
					<td width="20%" class="text-left">좌석</td>
					<td width="50%" id="seat"></td>
				</tr>
				<tr>
					<td colspan="3" id="content"></td>
				</tr>
			</table>
		</div>
		<!-- dialog 창 종료 -->
	</div>
</body>
</html>