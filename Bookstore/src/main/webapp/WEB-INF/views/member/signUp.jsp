<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign up</title>
		
		<!-- jquery -->
		<script src="<c:url value="/resources/jquery/jquery.js" />"></script>
		
		<!-- bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" id="bootstrap-css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/signup.css" id="bootstrap-css">
		
		<!-- bootstrap script -->
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
		
		<script src="<c:url value="/resources/bootstrap/js/login.js" />"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
					
				var check = RegExp(/^[a-zA-Z0-9]{8,16}$/)	// 아이디와 패스워드가 적합한지 검사할 정규식
				var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				
			/* 	var memberId = $('#memberId').val();
				var memberPassword = $('#memberPassword').val();
				var memberName = $('#memberName').val();
				var memberGender = $('#memberGender').val();
				var memberDateOfBirth = $('#memberDateOfBirth').val();
				var memberPhone = $('#memberPhone').val();
				var memberEmail = $('#memberEmail').val(); */
				
				// 아이디 확인
				$('input[name="memberPassword"]').focus(function() {
					
					// 아이디 공백
					if($('#memberId').val() == '') {
						
						$('#memberIdSuccess').text('');
						$('#memberIdHellper').text('필수 정보입니다.');
						
					// 아이디 검사
					} else if(!check.test($('#memberId').val())) {
						
						$('#memberIdSuccess').text('');
						$('#memberIdHellper').text('8~16자의 영문 대소문자와 숫자로만 입력하셔야합니다.');
					
					// 사용가능한 아이디 검사
					} else {
						
						$('#memberIdHellper').html('');
						
						$.ajax({
							url : '/individual/member/memberIdCheck'
							, type:'POST'
							, data:{memberId : $('#memberId').val()}
							, success:function(data) {
								
								if(data == 'true') {
									
									
									$('#memberIdSuccess').html('사용가능한 아이디 입니다.');
									
								} else {
									
									$('#memberIdSuccess').html('');
									$('#memberIdHellper').html('이미 사용중인 아이디 입니다.');
									
								}
							}
							
						});
						
					}
					
				});
				
				// 비밀번호 검사
				$('input[name="memberPasswordCheck"]').focus(function() {
					
					// 비밀번호 공백 확인
					if($('#memberPassword').val() == '' ) {
					
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('필수 정보입니다.');
						
					// 비밀번호 유효성 검사
					} else if(!check.test($('#memberPassword').val())) {
						
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('8~16자의 영문 대소문자와 숫자로만 입력하셔야합니다.');
					
					// 아이디와 일치여부
					} else if($('#memberId').val() == ($('#memberPassword').val())){
					
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('아이디와 패스워드가 일치합니다.');
						
					// 검사 완료
					} else {
						
						$('#memberPasswordHellper').text('');
						$('#memberPasswordSuccess').text('사용가능한 비밀번호 입니다.');
					}
					
				});
				
				// 비밀번호확인 검사
				$('input[name="memberName"]').focus(function() {
					
					// 비밀번호확인 공백
					if($('#memberPasswordCheck').val() == '') {
						
						$('#memberPasswordCheckSuccess').text('');
						$('#memberPasswordCheckHellper').text('필수 정보입니다.');
						
					// 비밀번호확인 유효성 검사
					} else if($('#memberPassword').val() != ($('#memberPasswordCheck').val())) {
						
						$('#memberPasswordCheck').val('');
						$('#memberPasswordCheckSuccess').text('');
						$('#memberPasswordCheckHellper').text('비밀번호가 일치하지 않습니다.');
						
					} else {
						
						$('#memberPasswordCheckHellper').text('');
						$('#memberPasswordCheckSuccess').text('비밀번호가 일치합니다.');
					}
					
				});
				
				// 성명 검사
				$('#input[name="memberGender"]').focus(function() {
					
					// 성명공백 검사
					if($('#memberName').val() == '') {
						
						$('#memberNameHellper').text('필수 정보입니다.');
						
					
					} else {
						
						$('#memberNameHellper').text('');
						
					}
					
					
				});
				
				// 뒤로가기
				$('#remove').click(function() {
					
					window.history.back();
					
				});
				
				
			});
		</script>
		
	</head>
	<body>
 
 		<jsp:include page="/WEB-INF/views/bookStoreModure/topPage.jsp"/>
 		
		<div id="formWrapper">
		
			<div id="form">
			
				<div class="logo">
					<h1 class="text-center head">회원 가입하기</h1>
				</div>
				
				<form name="loginInformation" method="post">
				
					<div class="form-item">
						<p class="formLabel">아이디</p>
						<input type="text" name="memberId" id="memberId" class="form-style" autocomplete="off" maxlength="16"  />
						<span id="memberIdHellper" class="badge badge-pill badge-danger" ></span>
						<span id="memberIdSuccess" class="badge badge-pill badge-success" ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">비밀번호</p>
						<input type="password" name="memberPassword" id="memberPassword" class="form-style" maxlength="16"  />
						<span id="memberPasswordHellper" class="badge badge-pill badge-danger"  ></span>
						<span id="memberPasswordSuccess" class="badge badge-pill badge-success" ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">비밀번호 확인</p>
						<input type="password" name="memberPasswordCheck" id="memberPasswordCheck" class="form-style" maxlength="16"  />
						<span id="memberPasswordCheckHellper" class="badge badge-pill badge-danger"  ></span>
						<span id="memberPasswordCheckSuccess" class="badge badge-pill badge-success" ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">성명</p>
						<input type="text" name="memberName" id="memberName" class="form-style"  />
						<span id="memberNameHellper" class="badge badge-pill badge-danger"  ></span>
					</div>
					
					<p class="formLabel">성별</p>
						<div class="input-group form-style">
							<select class="custom-select" id="memberGender" name="memberGender">
								<option selected>성별</option>
								<option value="남">남성</option>
								<option value="여">여성</option>
							</select>
						</div>
					<span id="memberGenderHellper" class="badge badge-pill badge-danger"  ></span>
					
					<div class="form-item">
						<p class="formLabel">생년월일<small>8자리 숫자로 입력(ex.19920101)</small></p>
						<input type="text" name="memberDateOfBirth" id="memberDateOfBirth" class="form-style" maxlength="8"  />
						<span id="memberDateOfBirthHellper" class="badge badge-pill badge-danger"  ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">휴대전화<small>(-없이 입력)</small></p>
						<input type="text" name="memberPhone" id="memberPhone" class="form-style" maxlength="16"  />
						<span id="mmemberPhoneHellper" class="badge badge-pill badge-danger"  ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">이메일</p>
						<input type="email" name="memberEmail" id="memberEmail" class="form-style" />
						<span id="memberEmailHellper" class="badge badge-pill badge-danger"  ></span>
					</div>
					
				</form>
				
				
				<div class="form-item">
					
					<input type="submit" id="login" class="login pull-right" value="가입하기">&nbsp;&nbsp;
					<input type="button" id="remove" class="login pull-right" value="가입취소">
					<div class="clear-fix"></div>
					
				</div>
			</div>
		</div>
        
	</body>
</html>