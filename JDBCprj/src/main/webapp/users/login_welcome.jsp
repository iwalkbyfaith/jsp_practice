<!-- 회원가입로직 5) 로그인 성공 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = (String)session.getAttribute("session_name");
	String id = (String)session.getAttribute("session_id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 완료 페이지</h2>
	<%=name %>(<%=id %>)님! 로그인을 환영합니다!


</body>
</html>