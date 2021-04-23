<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberJoin.css" type="text/css" />
</head>
<body>

<div class="w1400_container">
	<div class="h_formcontainer">
<div class="h_jointop"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
			<!-- 아이디 <input type="text" id="userid" class="" maxlength="20"/>
			비밀번호 <input type="password" id="userpwd" class=""/>
			비밀번호 확인 <input type="password" id="pwdconfirm" class=""/>
			이름 <input type="text" id="username" class=""/>
			주소 <input type="text" id="useraddr1" class=""/>
			<input type="text" id="useraddr2" class=""/> 기본주소
			<input type="text" id="useraddr3" class=""/> 나머지주소
			연락처 
			SMS수신동의 
			이메일
			인증번호
			이메일 수신동의 -->
	<div class ="h_formbox">
	<form method="post" name="inputForm" action = "">
		<table class="h_formtable">
		<tr><!-- 공백 --></tr>
		<!-- 아이디 -->
		<tr>
		<td>
		<label for="userid">아이디*</label>
		</td>
		<td>
		<input type="text" name="userid" id="userid" size="20px" class="h_ipt">
		<input type="button" id="idcheck" value="중복확인" class="h_check_btn">
		</td>
		</tr>
		<!-- 비밀번호 -->
		<tr>
		<td>
		<label for="pwd">비밀번호*</label>
		</td>
		<td>
		<input type="password" name="userpwd" id="userpwd" size="20px" class="h_ipt">(영문/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="pwdCheck">비밀번호 확인*</label>
		</td>
		<td>
		<input type="password" name="pwdCheck" id="pwdCheck" size="20px" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="username">이름*</label>
		</td>
		<td>
		<input type="text" name="username" id="username" size="20px" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="addr">주 소</label>
		</td>
		<td>
		<input type="text" name="zipcode" id="zipcode" size="5" class="h_ipt">
		<input type="button" id="zipcode" value="우편번호 찾기" class="h_check_btn">
		
	  	<input type="text" name="addr" id="addr" size="60" class="h_ipt"> 기본주소
		
		<input type="text" name="detailaddr" id="detailaddr" size="60" class="h_ipt"> 나머지 주소
		</td>
		</tr>
		
		<tr>
		<td>
		연락처
		</td>
		<td>
		<select id="tel" name="tel" class="h_select">
		<option value="010">010</option>
	  	<option value="011">011</option>
		<option value="02">02</option>
		</select>
		-<input type="text" name="tel1" size="5" class="h_ipt">
		-<input type="text" name="tel2" size="5" class="h_ipt">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="smsok">SMS수신 동의</label>
		</td>
	 	<td>
		<input type="radio" name="smsok" checked>예
		<input type="radio" name="smsno">아니오
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="email">이메일</label>
		</td>
		<td>
		<input type="text" name="email" id="email" size="10px" class="h_ipt"> @ 
		<select id="emaildomain" class="h_select">
		<option value=""></option>
		<option value="1">http://www.google.com</option>
		<option value="2">http://www.naver.com</option>
		<option value="3">http://www.daum.com</option>
		</select>
		
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="emailvalid">인증번호</label>
		</td>
	 	<td>
	 	<input type="text" name="emailvalid" id="emailvalid" size="20px" class="h_ipt">
		<input type="button" id="emailcheck" value="인증 요청" class="h_check_btn">
		</td>
		</tr>
		
		<tr>
		<td>
		<label for="emailok">이메일 수신동의</label>
		</td>
	 	<td>
		<input type="radio" name="emailok" checked>예
		<input type="radio" name="emailno">아니오
		</td>
		</tr>
		
		</table>
		
		<ul class="h_2box">
			<li class="h_terms">ewwwajax로 시도해보기ㄷㄷㄷㄷ<div class="h_title">동의하겠읍니까</div></li>
			<li class="h_privacy"><div class="h_title">동의하겠읍니까</div><div class ="h_termcontent">■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식

■ 개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
ο 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</div></li>
		</ul>
		<div>wefwefkmwlefmkwlmefklwemfklwemfkl</div>
		<input type="submit" id="memberjoin" value="Join NOW" class="h_check_btn join">
	</form>
    
	</div>
	</div>
</div>
</body>
</html>