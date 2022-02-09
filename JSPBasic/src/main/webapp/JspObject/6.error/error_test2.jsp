<!-- 에러 처리 2) 지시자를 사용해 에러 처리 페이지를 따로 지정하기

	디렉티브에 error_page.jsp를 지정했기 때문에
	try~catch 구문 없이도 예외 발생시 바로 예외 처리가 실행됩니다.
	
	에러가 발생해 예외 발생 페이지로 이동했기 때문에
	주소가 error_test2.jsp 인데도 실제 화면은 error_page.jsp가 보여질 것임


 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 에러 발생시 보낼 페이지 지정 -->
<%@ page errorPage="error_page.jsp" %>

<%
	int a = 3/0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>