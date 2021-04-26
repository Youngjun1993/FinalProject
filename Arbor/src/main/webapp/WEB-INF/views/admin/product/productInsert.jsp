<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/product.css" type="text/css"/>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/javaScript/product.js"></script>
<script>
	
</script>
</head>
<body>
	<div class="w1400_container font_ng">
		<div id="sidefrm">사이드메뉴</div>
		<div id="centerfrm">
			<h1>상품 등록</h1>
			<form method="post" action="productInsertOk" enctype="multipart/form-data" autocomplete="off">
			<div id="insertInfo">
				<p><span class=pTitle>상품 정보</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<span class="pContent">카테고리</span>
					<select name="mainno" id="maincate">
						<c:forEach var="mainCate" items="${mainCate }">
							<c:if test="${mainCate.mainno!=null && mainCate.mainno!='' }">
								<option value=${mainCate.mainno }>${mainCate.mainname }</option>
							</c:if>
						</c:forEach>
					</select>
					<select name="subno" id="subcate">
						<c:forEach var="subCate" items="${subCate }">
							<option value=${subCate.subno }>${subCate.subname }</option>
						</c:forEach>
					</select>
					<br/>
					<span class="pContent">상품명</span> <input type="text" name="pname" id="pname" />
					<span class="pContent">재고량</span> <input type="text" name="stock" id="stock" /><br/>
					<span class="pContent">상품가격</span> <input type="text" name="pprice" id="pprice" />
					<span class="pContent">할인가격</span> <input type="text" name="saleprice" id="saleprice" />
				</div>
			</div>
			<br/><br/>
			<div id="insertImg">
				<p><span class=pTitle>이미지 및 상세설명</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					<h3>이미지</h3><br/>
					<input type="file" name="imgName1" id="img1" /><br/>
					<input type="file" name="imgName2" id="img2" /><br/>
					<p>* 이미지 크기는 10MB, 1200PX이하로 등록</p>
					<div id="imgPrint"><img src="<%=request.getContextPath() %>/img/noimg.png"/></div>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h3>상세설명</h3><br/>
					<textarea name="description" id="description"></textarea>
				</div>
				<br/>
			</div>
			<br/><br/>
			<div id="insertOption">
				<p><span class=pTitle>옵션선택 입력</span>
					<img src="<%=request.getContextPath() %>/img/downpage.png"/>
					<img src="<%=request.getContextPath() %>/img/uppage.png"/>
				</p><br/>
				<div>
					
				</div>
			</div>
			<p id="lastP"><input type="submit" value="저장"/><input type="reset" value="다시쓰기" /></p>
			</form>
		</div>
	</div>
</body>
</html>