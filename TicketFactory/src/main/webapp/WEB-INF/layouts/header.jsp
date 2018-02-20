<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function searchIt() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/searchData.action";
		f.submit();
	}
	
	
	function idCheck(){
		

		if(${empty sessionScope.loginDto }){
			alert("로그인이 필요한 페이지입니다.\n로그인 후 이용해주세요^^");
			return;
		} 
		
		location.href='<%=cp%>/eqList.action';

	<%-- $("#myModal").show(); --%>

	}

</script>

<%@ include file="modal.jsp" %>
<link rel="stylesheet" href="/ticketfactory/resources/css/sign.css" type="text/css"/>
<link rel="stylesheet" href="/ticketfactory/resources/css/start.css" type="text/css"/>
<script src="/ticketfactory/resources/js/modal.js"></script>

<!-- <script src="/ticketfactory/resources/js/jquery-1.7.2.min.js"></script> -->
<script src="/ticketfactory/resources/js/jquery.ulslide.js"></script>
<script type="text/javascript" src="/ticketfactory/resources/js/sign_checker.js"></script>

</head>
<body>

<!-- 상단 레이아웃  -->
<div id="top_wrap">
<c:if test="${loginDto==null}">
<!-- 비로그인시 탭바메뉴 -->
	<div id="top_gnb_wrap">
		<div id="top_gnb_area">
			<div id="top_gnb_box">

<ul id="top_gnb">
        <li><a id="login" style="text-decoration: none; cursor:pointer;">로그인</a></li>
        <li><a href="<%=cp%>/sign.action" style="text-decoration: none;">회원가입</a></li>
		<li  class="top_gnb_pri" onmouseover="change(tab,1);" 
		onmouseout="change(tab,2)"><a href="<%=cp %>/notiList.action" style="text-decoration: none;">고객센터
			<span class="top_gnb_arrow">▼</span></a>
                <ul class="top_gnb_sub" id="tab">
                        <li><a href="<%=cp %>/notiList.action" style="text-decoration: none;">공지사항</a></li>
                        <li><a href="<%=cp %>/faqList.action" style="text-decoration: none;">FAQ</a></li>
                        <li><a style="cursor:pointer; text-decoration: none;" onclick="idCheck();" >1:1문의</a></li>
                </ul>
        </li>
</ul>

			</div>
		</div>
	</div>
	</c:if><!-- 비로그인시 탭바메뉴 끝 -->
<c:if test="${loginDto!=null}">
<!-- 로그인시 탭바메뉴 -->
	<div id="top_gnb_wrap">
		<div id="top_gnb_area">
			<div id="top_gnb_box">
<ul id="top_gnb">
        <li><a href="<%=cp%>/login_out.action" >로그아웃</a></li>
        <li class="top_gnb_pri" onmouseover="change(myticket,1);" 
		onmouseout="change(myticket,2)">
        	<a href="<%=cp%>/mypage.action?mypageNum=01&pageNum=1">마이티켓
			<span class="top_gnb_arrow">▼</span></a>
                <ul class="top_gnb_sub" id="myticket">
                        <li><a href="<%=cp%>/mypage.action?mypageNum=01&pageNum=1">구매내역</a></li>
                        <li><a href="<%=cp%>/mypage.action?mypageNum=02&pageNum=1">포인트내역</a></li>
                        <li><a href="<%=cp%>/mypage.action?mypageNum=03&pageNum=1">회원정보</a></li>
                </ul>
        </li>
		<li  class="top_gnb_pri" onmouseover="change(tab,1);" 
		onmouseout="change(tab,2)"><a href="<%=cp %>/notiList.action" style="text-decoration: none;">고객센터
			<span class="top_gnb_arrow">▼</span></a>
                <ul class="top_gnb_sub" id="tab">
                        <li><a href="<%=cp %>/notiList.action" style="text-decoration: none;">공지사항</a></li>
                        <li><a href="<%=cp %>/faqList.action" style="text-decoration: none;">FAQ</a></li>
                        <li><a href="<%=cp %>/eqList.action" style="text-decoration: none;">1:1문의</a></li>
                        <li><a href="<%=cp %>/yangdoList.action" style="text-decoration: none;">티켓양도</a></li>
                </ul>
        </li>
</ul>

			</div>
		</div>
	</div><!-- 로그인시 탭바메뉴끝 -->
</c:if>	
	
	<!-- 검색상단메뉴 -->
	<form action="" name="searchForm" method="post">
	<div id="top_logo_wrap">
		<!-- <a href="main.action"><img src="http://placehold.it/300x80" class="top_gnb_logoImage"></a> -->
		<a href="main.action"><img src="/ticketfactory/resources/image/logo6.png" class="top_gnb_logoImage"></a>
	
		<div style="float:left; padding:20px 0 0 20px;">
			<table cellspacing="0" style="position:relative; margin-top: 15px;">
			<tr>
				<td style="vertical-align:top;padding:8px 0 8px 10px;">
					<img src="/ticketfactory/resources/image/search_left.png" class="search_image">
					<input type=text name="search_word" id="search_word" value='' class="search_box" 
					onfocus="myFunction(this);">
					<input name="image" type="image" src='/ticketfactory/resources/image/search_btn.png' 
					alt='검색하기'  border=0 onfocus="this.blur();" onclick="searchIt();">
				</td>
				<td  style="vertical-align:top; padding-left: 20px; ">
				<a href="oneplus.action">
					<img src="/ticketfactory/resources/image/bnr_web_top.png">
				</a>
				</td>
			</tr>
			</table>	
		</div>
	</div><!-- 검색상단메뉴 끝 --></form>
</div><!-- 상단레이아웃 끝  -->	

	<!-- 상단 메인메뉴 -->
	<nav>
	<ul id="top_menu">
		<li><a class="menu_link_pink" href="today.action?genre=1">오늘티켓</a></li>
		<li><a class="menu_link" href="tomorrow.action?genre=1">내일티켓</a></li>
		<li><a class="menu_link" href="reserve_ticket.action">공연예매&nbsp;&nbsp;
			<img src="/ticketfactory/resource/image/nav_arrow.png" style="width: 7px; height: 16px;"></a>
			<ul>
				<li><a href="reserve_ticket.action?genre=1">연극</a></li>
				<li><a href="reserve_ticket.action?genre=2">뮤지컬</a></li>
				<li><a href="reserve_ticket.action?genre=3">클래식</a></li>
				<li><a href="reserve_ticket.action?genre=4">국악</a></li>
				<li><a href="reserve_ticket.action?genre=5">오페라</a></li>
			</ul></li>
		<li><a class="menu_link" href="eventList.action">이벤트</a></li>
		<li><a class="menu_link" href="yangdoList.action">티켓톡
			<img src="/ticketfactory/resource/image/nav_arrow.png" style="width: 7px; height: 16px;"></a>
			<ul class="realtime_star">
				<li><a href="<%=cp%>/reviewBoard.action">★실시간 별점★</a></li>
				<li><a href="yangdoList.action">티켓양도</a></li>
			</ul></li>
	</ul>
	</nav>

</body>
</html>