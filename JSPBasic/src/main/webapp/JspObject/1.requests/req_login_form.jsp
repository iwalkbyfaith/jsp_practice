<!-- 로그인 구현(주는) -->




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>로그인 창</h2>
	<form action="req_login_result.jsp" method="post">
		<input type="text" name="id" placeholder="id" size="15px"/><br/>
		<input type="password" name="pw" placeholder="password" size="15px"/><br/><br/>
		<input type="reset" value="다시 입력"/>
		<input type="submit" value="로그인"/>
	</form>
	<br/>
	<a href="req_join_form.jsp">회원가입</a>

</body>
</html>