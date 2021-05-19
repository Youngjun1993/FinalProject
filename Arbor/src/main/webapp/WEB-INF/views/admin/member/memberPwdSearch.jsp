<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/arbor.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/memberJoin.css" type="text/css" />
</head>
<body>
<div class="w1400_container">
	<div class="h_formcontainer">
	<div class="h_jointop"><img src="<%=request.getContextPath() %>/img/logo.png"/></div>
	<div class="h_pwdsearchhead">비밀번호찾기</div>
	<div id="before_submit">
	<div class="h_pwdtapbox">
		<span class="h_tab emailsearch active"><a href="#">이메일로 찾기</a></span>
		<span class="h_tab phonesearch"><a href="#">휴대폰번호로 찾기</a></span>
	</div>
	<!-- 이메일 비번찾기  -->
	<form class="h_emailtab" action="memberPwdSearchOk">
		<ul class="h_pwdformtable now"> 
		<li><label for="userid">아이디</label></li>
		<li><input type="text" name="mail_userid" id="mail_userid" size="35px" class="h_pwdchangeipt"></li>
		
		<li><label for="email">이메일</label></li>
		<li>
		<input type="text" name="mail_email" id="mail_email" size="35px" class="h_pwdchangeipt">
		</li>
		<li><input type="button" id="email_chk_btn" value="확인" class="h_check_btn search"></li>
		</ul>
	</form>
	<!-- 2번째 휴대폰 -->
	<form class="h_smstab">
		<ul class="h_pwd2formtable now"> 
		<li><label for="userid">아이디</label></li>
		<li><input type="text" name="sms_userid" id="sms_userid" size="35px" class="h_pwdchangeipt"></li>
		
		<li>연락처</li>
		<li><select id="sms_tel" name="sms_tel" class="h_select">
			<option value="010">010</option>
		  	<option value="011">011</option>
			<option value="02">02</option>
			</select>
			-<input type="text" name="tel1" size="7" class="h_pwdchangeipt">
			-<input type="text" name="tel2" size="7" class="h_pwdchangeipt"></li>
		<li><input type="button" id="sms_chk_btn" value="확인" class="h_check_btn search"></li>
		</ul>
	</form>
	</div>
	<!-- 이메일 발송 알림창 -->
		<div id = "after_submit" style ="display:none;">
			<b>인증번호 확인</b><br/>
			등록하신 주소로 임시비밀번호가 전송되었습니다. 임시비밀번호로 로그인해주세요.<br/>
			<br/>로그인 후 반드시 비밀번호를 변경해 주시기 바랍니다.
			<div class="h_homeBtn">
			<form action="login">
				<input type="submit" value="로그인" class="clientMainBtn"/>
			</form>
			</div>
		</div>
	</div>
</div>

<script>

	$('.h_pwdtapbox .h_tab').click(function(){
	    if ($(this).hasClass('emailsearch')) {
	        $('.h_pwdtapbox .h_tab').removeClass('active');
	        $(this).addClass('active');
	        $('.now').hide();
	        $('.h_pwdformtable').show();
	    } 
	    if ($(this).hasClass('phonesearch')) {
	        $('.h_pwdtapbox .h_tab').removeClass('active');
	        $(this).addClass('active');
	        $('.now').hide();
	        $('.h_pwd2formtable').show();
	    }
	});
	
	//이메일 이벤트
	//이메일 전송이벤트
	$('#email_chk_btn').on('click',function() {
		var userid = $('#mail_userid').val();
		var email = $('#mail_email').val();
		
		var idArr = new Array();
		
		idArr.push(userid);//배열에 이름값
		idArr.push(email);//배열에 이메일값
		
		console.log(idArr[0]);
		console.log(idArr[1]);
		
		
		if(userid != "" && email != "") {
			alert("if문 통과");
			$.ajax({
				url:'memberPwdSearchOk',
				type:'POST',
				data: { idCheck : idArr },
				success : function(result) {
						alert("임시비밀번호가 전송되었습니다.");
					
					if(result == 1) {
						$('#before_submit').attr("style","display:none");//현재 입력창 모두 none
						$('#after_submit').attr("style","display:block");//임시비밀번호 메일전송 div보여주기
						//임시비밀번호를 메일로 보내는 이벤트
						
						alert("임시비밀번호가 전송되었습니다.");
						
					}else{//비밀번호 일치하지않을경우 java에서 1이외의 값
						alert('아이디와 이메일이 일치하지않습니다. 다시 입력해주세요');
					}
				}, error:function() {
					alert("가입한 아이디와 이메일을 입력해주세요");
				}
			});
			
		}else{
			alert("아이디와 이메일을 입력해주세요");
		}
	});


</script>

</body>
</html>