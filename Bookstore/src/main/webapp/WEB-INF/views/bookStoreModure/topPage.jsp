<!-- 2018.10.30 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- jquery -->
		<script src="<c:url value="/resources/jquery/jquery.js" />"></script>
		
		<!-- bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
		
		<!-- bootstrap script -->
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
		
	</head>
	<body>
		<div class="navbar navbar-expand-lg navbar-fixed-top navbar-dark bg-primary ">
			
			<div class="navbar-header">
				<a class="navbar-brand" href="/individual">
					BookStore
				</a>
			</div>
			
			<div class="container">
				
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav">
				
						<li class="nav-item">
							<a class="nav-link" href="#">국내도서</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="#">외국도서</a>
						</li>

					</ul>
					
				</div>
				
				<ul class="navbar-nav navbar-right ">
				
					<c:choose>
					
						<c:when test="${sessionScope.memberId == null}">
								
							<li class="nav-item">
								<a class="nav-link" href="/individual/member/login">로그인</a>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="/individual/member/signUp">회원가입</a>
							</li>
							
						</c:when>
						
						<c:otherwise>
						
							<li class="nav-item">
								<span class="nav-link">${sessionScope.memberName }님</span>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="/individual/logout">로그아웃</a>
							</li>
								
						</c:otherwise>
						
					</c:choose>
					
					<li class="nav-item">
						<a class="nav-link" href="#">고객센터</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">주문배송</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="#">장바구니</a>
					</li>
				</ul>
			</div>
		</div><br>
		
	</body>
</html>