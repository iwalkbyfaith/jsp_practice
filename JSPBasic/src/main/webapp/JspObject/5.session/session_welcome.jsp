<!-- 세션을 활용한 로그인 처리 3 로그인 성공시 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// ★ session은 폼을 안 쓰고도 다른 페이지로 데이터를 전송해줄 수 있는 하나의 수단입니다.
	String id = (String)session.getAttribute("session_id");
	String pw = (String)session.getAttribute("session_pw");
	String nick = (String)session.getAttribute("session_nick");
	
	// 여기도 로그인 안한 사람이 들어올 수 없도록 처리해주어야 한다.
	if(id == null){
		response.sendRedirect("session_login.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=nick%>(<%=id%>)님 로그인을 환영합니다.</h2><br/>
	<a href="session_logout.jsp">로그아웃 하기</a>
</body>
</html>