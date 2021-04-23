<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/qna.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>
	$(function(){
		//페이징 li만큼 갯수
		var liCnt = $("#qnaPaging>li").length;
		$("#qnaPaging").css({
			"width" : liCnt*30+"px",
			"margin" : "0 auto"
		});
		//문의유형 선택시 이벤트
		$("#qnaSearchKey").change(function(){
			if($("#qnaSearchKey option:selected").text() == "문의유형"){
				$("#qnaSearchWord").val("ex) 교환/반품, 결제관련, 기타");
			}else{
				$("#qnaSearchWord").val("");
			}
		});
	
		//검색어 포커스 인 값 초기화
		$("#qnaSearchWord").focusin(function(){
			$(this).val("");
		});
		
		//검색폼 제약조건
		$("#y_qnaSearchFrm").submit(function(){
			if($("#qnaSearchKey").val()==""){
				alert("카테고리를 선택하세요.")
				return false;
			}
			if($("#qnaSearchWord").val()==""){
				alert("검색어를 입력하세요.")
				return false;
			}
			return true;
		});
	});
</script>
<body>
    <div id="y_adminQnaList_Wrap" class="w1400_container clearfix">
        <div id="leftcon">
            공통메뉴
        </div>
        <div id="y_adminQnaList_rightcon" class="y_rightcon">
            <p class="y_title_fs25">1:1문의(Q&#38;A) 목록</p>
            <div>
                <form id="y_qnaSearchFrm" action="qnaAdList" method="get">
                    <select name="qnaSearchKey" id="qnaSearchKey">
                    	<option value="">카테고리</option>
                        <option value="qnacate">문의유형</option>
                        <option value="qnasubject">제목</option>
                    	<option value="userid">작성자</option>
                    </select>
                    <input type="text" name="qnaSearchWord" id="qnaSearchWord" />
                    <input type="submit" id="qnaSearchBtn" value="검색">
                </form>
                <p>미답변 질문(${countAns}건)</p>
            </div>
            <ul class="clearfix">
                <li>문의유형</li>
                <li>제목</li>
                <li>작성자</li>
                <li>등록일</li>
                <li>처리상태</li>
                <c:forEach var="data" items="${list }">
	                <li>${data.qnacate }</li>
	                <li><a href="qnaAdView?qnano=${data.qnano }&pageNum=${pageVO.pageNum}<c:if test="${pageVO.qnaSearchWord != null && pageVO.qnaSearchWord != ''}">&qnaSearchKey=${pageVO.qnaSearchKey }&qnaSearchWord=${pageVO.qnaSearchWord }</c:if>" class="wordcut">${data.qnasubject }</a></li>
	                <li>${data.userid }</li>
	                <li>${data.qnadate }</li>
	                <li>
	                	<c:if test="${data.answercontent == null }">
	                		<span class="y_anserWait">답변대기</span>
	                	</c:if>
	                	<c:if test="${data.answercontent != null }">
	                		<span class="y_anserComp">답변완료</span>
	                	</c:if>
	                </li>
	             </c:forEach>   
            </ul>
            <ul id="qnaPaging" class="clearfix">
            	<c:if test="${pageVO.pageNum>1 }">
                	<li><a href="qnaAdList?pageNum=${pageVO.pageNum-1}">이전</a></li>
                </c:if>
                <c:forEach var="p" begin="${pageVO.startPageNum }" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1 }">
                	<c:if test="${p<=pageVO.totalPage }">
	                	<c:if test="${p==pageVO.pageNum }">
	                		<li><a href="qnaAdList?pageNum=${p}<c:if test="${pageVO.qnaSearchWord != null && pageVO.qnaSearchWord != ''}">&qnaSearchKey=${pageVO.qnaSearchKey }&qnaSearchWord=${pageVO.qnaSearchWord }</c:if>">${p }</a></li>
	                	</c:if>
	                	<c:if test="${p!=pageVO.pageNum }">
	                		<li><a href="qnaAdList?pageNum=${p}">${p }</a></li>
	                	</c:if>
                	</c:if>
                </c:forEach>
                <c:if test="${pageVO.pageNum<pageVO.totalPage }">
                	<li><a href="qnaAdList?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.qnaSearchWord != null && pageVO.qnaSearchWord != ''}">&qnaSearchKey=${pageVO.qnaSearchKey }&qnaSearchWord=${pageVO.qnaSearchWord }</c:if>">다음</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</body>
</html>