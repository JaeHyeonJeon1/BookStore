<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				
				
				var regexId =/^[a-z0-9_-]{8,16}$/; // 아이디 유효성 검사 8~16자 사이
				var regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; // 이메일 요휴성검사
				var regexTel = /^[0-9]{8,11}$/; // 전화번호 유효성 검사
				var regexName = /[0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;	// 이름 유효성검사
				var regexPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;;	// 비밀번호 유효성 검사
				var regxp = /[^0-9]/gi; // 숫자 유효성 검사
				
				// 아이디 확인
				$('input[name="memberId"]').focusout(function() {
					
					// 아이디 공백
					if($('#memberId').val() == '') {
						
						$('#memberIdSuccess').text('');
						$('#memberIdHellper').text('필수 정보입니다.');
						
					// 아이디 검사
					} else if(!regexId.test($('#memberId').val())) {
						
						$('#memberIdSuccess').text('');
						$('#memberIdHellper').text('8~16자의 영문 대소문자와 숫자로만 입력하셔야합니다.');
					
					// 사용가능한 아이디 검사
					} else {
						
						$('#memberIdHellper').html('');
						
						$.ajax({
							url : '/individual/member/memberIdCheck'
							, type:'GET'
							, dataType: "json"
							, data:{memberId : $('#memberId').val()}
							, success:function(data) {
								
								if(data.memberIdCheck == false) {
									
									$('#memberIdHellper').html('');
									$('#memberIdSuccess').html('사용가능한 아이디 입니다.');
									
								} else {
									
									$('#memberIdSuccess').html('');
									$('#memberIdHellper').html('이미 사용중인 아이디 입니다.');
									
								}
							}
							
						});
						
					}
					
				});
				
				// 비밀번호 유효성 검사
				$('input[name="memberPassword"]').focusout(function() {
					
					// 비밀번호 공백 확인
					if($('#memberPassword').val() == '' ) {
					
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('필수 정보입니다.');
						
					// 동일한 문자/숫자 3자이상, 연속된 문자
					} else if(/(\w)\1\1/.test($('#memberPassword').val())) {
					
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('비밀번호에 3자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다.');
					
					// 비밀번호 검사
					} else if(!regexPassword.test($('#memberPassword').val())) {
						
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('영문(대소문자구분),숫자,특수문자를 혼용하여 8~16자를 입력해주세요.');
						
					// 아이디와 일치여부
					} else if($('#memberPassword').val().search($('#memberId').val())>-1){
					
						$('#memberPasswordSuccess').text('');
						$('#memberPasswordHellper').text('아이디와 패스워드가 일치합니다.');
						
					// 검사 완료
					} else {
						
						$('#memberPasswordHellper').text('');
						$('#memberPasswordSuccess').text('사용가능한 비밀번호 입니다.');
						
					}
					
				});
				
				// 비밀번호확인 유효성 검사
				$('input[name="memberPasswordCheck"]').focusout(function() {
					
					// 비밀번호확인 공백
					if($('#memberPasswordCheck').val() == '') {
						
						$('#memberPasswordCheckSuccess').text('');
						$('#memberPasswordCheckHellper').text('필수 정보입니다.');
						
					// 비밀번호확인 검사
					} else if($('#memberPassword').val() != ($('#memberPasswordCheck').val())) {
						
						$('#memberPasswordCheck').val('');
						$('#memberPasswordCheckSuccess').text('');
						$('#memberPasswordCheckHellper').text('비밀번호가 일치하지 않습니다.');
					
					} else {
						
						$('#memberPasswordCheckHellper').text('');
						$('#memberPasswordCheckSuccess').text('비밀번호가 일치합니다.');
						
					}
					
				});
				
				// 성명 유효성 검사
				$('input[name="memberName"]').focusout(function() {
					
					// 성명공백 검사
					if($('#memberName').val() == '') {
						
						$('#memberNameHellper').text('필수 정보입니다.');
					
					// 성명 길이 검사
					} else if($('#memberName').val().length < 2) {
						
						$('#memberNameHellper').text('2자 이상 입력하셔야합니다.');
					
					// 성명 검사
					} else if(regexName.test($('#memberName').val())) {
					
						$('#memberNameHellper').text('한글,영문으로 2자이상 입력하셔야합니다.');
						
					} else {
						
						$('#memberNameHellper').text('');
						
					}
					
				});
				
				// 생년월일 유효성 검사
				$('input[name="memberDateOfBirth"]').focusout(function() {
					
					// 생년월일 공백 검사
					if($('#memberDateOfBirth').val() == '') {
						
						$('#memberDateOfBirthHellper').text('필수 정보입니다.');
						
					// 생년월일 길이 검사
					} else if($('#memberDateOfBirth').val().length != 8) {
						
						$('#memberDateOfBirthHellper').text('잘못 기입 하셨습니다.');
						
					// 생년월일 숫자 입력 검사
					} else if(regxp.test($('#memberDateOfBirth').val())) {
						
						$('#memberDateOfBirthHellper').text('숫자만 입력 가능합니다.');
						
					} else {
						
						$('#memberDateOfBirthHellper').text('');
						
					}
					
				});
				
				// 휴대전화 유효성 검사
				$('input[name="memberPhone"]').focusout(function() {
					
					// 공백 검사
					if($('#memberPhone').val() == '') {
						
						$('#memberPhoneHellper').text('필수 정보입니다');
						
					// 길이 검사
					} else if($('#memberPhone').val().length < 10 ) {
						
						$('#memberPhoneHellper').text('잘못 입력하셨습니다.');
					
					// 숫자 입력 검사
					} else if(regxp.test($('#memberPhone').val())) {
						
						$('#memberPhoneHellper').text('숫자만 입력 가능합니다.');
						
					} else {
						
						$('#memberPhoneHellper').text('');
						
					}
				
				});
				
				// 이메일 유효성 검사
				$('input[name="memberEmail"]').keyup(function() {
					
					if($('#memberEmail').val() == '') {
						
						$('#memberEmailHellper').text('필수 정보입니다.');
						
						
					} else if(!regexEmail.test($('#memberEmail').val())) {
						
						$('#memberEmailHellper').text('올바르지 않은 이메일입니다.');
						
					} else {
						
						$('#memberEmailHellper').text('');
						
					}
					
				});
				
				// 가입 취소
				$('#signUpRemove').click(function() {
					
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
				
				<form:form modelAttribute="memberVo" action="/individual/member/signUpAction" method="post">
				
					<div class="form-item">
						<p class="formLabel">아이디</p>
						<form:input type="text" name="memberId" id="memberId" class="form-style" autocomplete="off" maxlength="16"  path="memberId" />
						<span id="memberIdHellper" class="badge badge-pill badge-danger" ></span>
						<span id="memberIdSuccess" class="badge badge-pill badge-success" ></span>
						<form:errors path="memberId" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">비밀번호 <small>특수문자(~!@#$%^&*()-_? 만 허용)</small></p>
						<form:password type="password" name="memberPassword" id="memberPassword" class="form-style" maxlength="16"  path="memberPassword" />
						<span id="memberPasswordHellper" class="badge badge-pill badge-danger"  ></span>
						<span id="memberPasswordSuccess" class="badge badge-pill badge-success" ></span>
						<form:errors path="memberPassword" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">비밀번호 확인</p>
						<form:password type="password" name="memberPasswordCheck" id="memberPasswordCheck" class="form-style" maxlength="16"  path="memberPasswordCheck" />
						<span id="memberPasswordCheckHellper" class="badge badge-pill badge-danger"  ></span>
						<span id="memberPasswordCheckSuccess" class="badge badge-pill badge-success" ></span>
						<form:errors path="memberPasswordCheck" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">성명</p>
						<form:input type="text" name="memberName" id="memberName" class="form-style"  path="memberName" />
						<span id="memberNameHellper" class="badge badge-pill badge-danger"  ></span>
						<form:errors path="memberName" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">생년월일 <small>8자리 숫자로 입력(ex.19920101)</small></p>
						<form:input type="text" name="memberDateOfBirth" id="memberDateOfBirth" class="form-style" maxlength="8" path="memberDateOfBirth"  />
						<span id="memberDateOfBirthHellper" class="badge badge-pill badge-danger"  ></span>
						<form:errors path="memberDateOfBirth" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">휴대전화 <small>(-없이 입력)</small></p>
						<form:input type="text" name="memberPhone" id="memberPhone" class="form-style" maxlength="11"  path="memberPhone" />
						<span id="memberPhoneHellper" class="badge badge-pill badge-danger"  ></span>
						<form:errors path="memberPhone" />
					</div>
					
					<div class="form-item">
						<p class="formLabel">이메일 <small>(ex. zzz123@naver.com)</small></p>
						<form:input type="text" name="memberEmail" id="memberEmail" class="form-style" path="memberEmail" />
						<span id="memberEmailHellper" class="badge badge-pill badge-danger"  ></span>
						<form:errors path="memberEmail" />
					</div>
					<input type="hidden" id="memberLevel" name="memberLevel" value="사용자">
					
					<div class="form-item">
					
						<button type="submit" id="login" class="login pull-right" value="가입하기"></button>
						<button type="button" id="signUpRemove" class="login pull-right" value="가입취소"></button>
						<div class="clear-fix"></div>
					
					</div>
				</form:form>
				
			</div>
		</div>
        
	</body>
</html>