<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>search</title>

		<!-- jquery -->
		<script src="<c:url value="/resources/jquery/jquery.js" />"></script>
		
		<!-- bootstrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/search.css">
		
		<!-- bootstrap script -->
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>

	</head>
	<body>
		<div id="search" class="row" align="center">
			<div class="col-lg-6">
			
				<div class="input-group">
				
					<a class="navbar-brand" href="/individual">
						BookStore	
					</a>
					
					<select>
						<option>전체</option>
						<option>국내도서</option>
						<option>외국도서</option>
					</select>
					
					<input type="text" class="form-control"  placeholder="Search...">
					
					<span class="input-group-btn">
						<button type="button" class="btn btn-outline-primary">검색</button>
					</span>
					
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div>
	</body>
</html>