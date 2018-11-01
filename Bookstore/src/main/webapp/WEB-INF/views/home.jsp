<!-- 2018.10.30 -->
<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>bookStore</title>
		
		<!-- jquery -->
		<script src="<c:url value="/resources/jquery/jquery.js" />"></script>
		
		<script type="text/javascript">
		
			var logout = '${logout}';
			
			if(logout == '로그아웃') {
				
				alert(logout+'되었습니다.');
				
			}
			
		</script>
	</head>
	<body>
	
		<jsp:include page="/WEB-INF/views/bookStoreModure/topPage.jsp"/>
		
		<jsp:include page="/WEB-INF/views/bookStoreModure/search.jsp"/>
		
	</body>
</html>
