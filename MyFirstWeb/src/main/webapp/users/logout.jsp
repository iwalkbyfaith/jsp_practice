<!-- 회원가입로직 6) 로그아웃 

	세션 파기 후 login_form.jsp로 보내주세요

	세션이 있건 없건 세션 삭제 후 form으로 보내주면 됨
	선생님은 나처럼 String으로 변수 안 받아오고 그냥 바로 invalidate쓰심

-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 나는 파기할 세션을 가져와야 하는 줄 알았는데 안가져와도 됨.
	//String uId = (String)session.getAttribute("session_id");
	//String uPw = (String)session.getAttribute("session_pw");
	//String uName = (String)session.getAttribute("session_nama");	
	
	session.invalidate();
	
	response.sendRedirect("login_form.jsp");
	
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