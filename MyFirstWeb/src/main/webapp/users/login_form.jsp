<!-- 회원가입로직 3) 로그인 폼 

	아이디와 비밀번호를 적어넣을 수 있는 폼을 만들어주세요.
	목적지는 login_check.jsp입니다.

-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인한 사용자가 폼으로 넘어오면 웰컴 페이지로 리다이렉트시키기 (나중에 추가된 내용. 세션발급 이후 추가할 수 있음.)
	String sId = (String)session.getAttribute("session_id");

	if(sId != null){
		response.sendRedirect("login_welcome.jsp");
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>로그인 창</h1>
	<form action="login_check.jsp" method="post">
		<input type="text" name="loginId" placeholder="아이디" required/><br/>
		<input type="password" name="loginPw" placeholder="비밀번호" required><br/>
		<input type="reset" value="초기화"/>
		<input type="submit" value="로그인하기"/>
	</form>
	
	<a href="join_form.jsp">회원 가입하기</a>

</body>
</html>