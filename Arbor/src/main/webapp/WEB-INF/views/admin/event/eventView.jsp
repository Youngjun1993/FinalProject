<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/arbor.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/event.css" type="text/css"/>
<script>
	$(function(){
		$("#j_eventListBtn").click(function(){
			location.href="eventList";
		});
		$("#j_eventEditBtn").click(function(){
			location.href="eventEdit?eventNo=${vo.eventNo}";
		});
		$("#j_eventDelBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="eventDel?eventNo=${vo.eventNo}";				
			}
		});
	});
</script>
</head>
<body>
<div class="w1400_container font_ng">
	<div class="j_sideMenu">사이드메뉴</div>
	<div class="j_centerFrm">
		<p class="j_adminMemu"><span>이벤트 상세보기</span></p>
		<div>
			<span class="j_category">제목</span> ${vo.eventSubject }<br/>
			<span class="j_category">이벤트 기간</span> ${vo.eventStart } ~ ${vo.eventEnd }<br/>
			<span class="j_category">타이틀 이미지</span> ${vo.eventImg1 }<br/>
			<br/><br/>
			<span id="j_contentImg">${vo.eventContent }</span>
			<hr/>
			<p class="j_eventSetBtn">
				<input type="button" class="adminMainBtn" id="j_eventEditBtn" value="수정"/> 
				<input type="button" class="adminSubBtn" id="j_eventDelBtn" value="삭제"/> 
				<input type="button" class="adminSubBtn" id="j_eventListBtn" value="목록"/>
			</p>
		</div>
	</div>
</div>
</body>
</html>