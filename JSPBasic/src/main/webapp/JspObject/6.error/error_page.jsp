<!-- 에러 처리 2) 지시자를 사용해 에러 처리 페이지를 따로 지정하기

	에러 발생시 이 페이지로 이동.
	
-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 여기에 코드로 처리해주기 -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지를 처리하던 중 에러가 발생했습니다</h2>
	<h3>관리자에게 문의해주세요.</h3>
</body>
</html>