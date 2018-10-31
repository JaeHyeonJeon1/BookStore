<!-- 2018.10.30 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login page</title>
		
		<!-- jquery -->
		<script src="<c:url value="/resources/jquery/jquery.js" />"></script>
		
		<!-- bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" id="bootstrap-css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/login.css" id="bootstrap-css">
		
		<!-- bootstrap script -->
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
		
		<script src="<c:url value="/resources/bootstrap/js/login.js" />"></script>
		
		<script type="text/javascript">
		
			$(document).ready(function() {
				
				// 유효성 검사
				$('#login').click(function() {
					
					var memberId = $('#memberId').val();
					var memberPassword = $('input[name="memberPassword"]').val();
					
					// ID값 
					if (memberId == '') {
						
						$('#memberIdHellper').text('ID값을 입력하세요.');
						$('#memberId').focus();
						
						return false;
						
					// 비밀번호값 검사
					} else if (memberPassword == '' ) {
						
						$('#memberIdHellper').text('');
						$('#memberPasswordHellper').text('password값을 입력하세요.');
						$('input[name="memberPassword"]').focus();
						
						return false;
						
					} 
						
					$('#memberPasswordHellper').text('');
					
					document.loginInformation.action = '/individual/member/loginCheck';
					
					document.loginInformation.submit();
					
				});
				
				// 뒤로가기
				$('#remove').click(function() {
					
					window.history.back();
					
				});
			
			});
		
		</script>
		
	</head>
	<body>
	
		<jsp:include page="/WEB-INF/views/bookStoreModure/topPage.jsp" />
		
		<div id="formWrapper">
		
			<div id="form">
			
				<div class="logo">
					<h1 class="text-center head">로그인</h1>
				</div>
				
				<form name="loginInformation" method="post">
				
					<div class="form-item">
				
						<p class="formLabel">ID</p>
						<input type="text" name="memberId" id="memberId" class="form-style" autocomplete="off" value="admin" />
						<span id="memberIdHellper" class="badge badge-pill badge-danger" ></span>
					</div>
					
					<div class="form-item">
						<p class="formLabel">Password</p>
						<input type="password" name="memberPassword" id="password" class="form-style" maxlength="16"  value="bookStore"/>
						<span id="memberPasswordHellper" class="badge badge-pill badge-danger"  ></span>
						
						<c:choose>
							<c:when test="${modelAndView eq 'failure' }">
								<span id="memberPasswordHellper" class="badge badge-pill badge-danger"  >아이디 또는 비밀번호가 일치하지 않습니다.</span>
							</c:when>
						</c:choose>
						
						<div class="pw-view">
							<i class="fa fa-eye"></i>
						</div>
						<p>
							<a href="#" >
								<small>
									아이디 찾기
								</small>
							</a>
							/
							<a href="#" >
								<small>
									비밀번호 찾기
								</small>
							</a>
						</p>	
						
					</div>
					
				</form>
				
				
				<div class="form-item">
					<p class="pull-left">
						<a href="/individual/member/signUp">
							<small>
								회원가입 하기
							</small>
						</a>
					</p>
					<input type="submit" id="login" class="login pull-right" value="로그인">&nbsp;&nbsp;
					<input type="button" id="remove" class="login pull-right" value="취소">
					<div class="clear-fix"></div>
				</div>
			</div>
		</div>
	</body>
</html>