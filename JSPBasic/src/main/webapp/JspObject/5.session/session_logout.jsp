<!-- 세션을 활용한 로그인 처리 4 로그아웃 페이지 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 세션 안 가져오고 그냥 바로 삭제 가능.
	//String id = (String)session.getAttribute("session_id");
	//String pw = (String)session.getAttribute("session_pw");
	//String nick = (String)session.getAttribute("session_nick");	
	
	// 삭제
	session.invalidate();
	
	// 확인 (필수는 아님)
	//if(request.isRequestedSessionIdValid()){
	//	out.println("유효한 세션 존재");
	//}else{
	//	out.println("세션이 파기되어 조회할 수 없습니다.");
	//}
	//	out.println("<hr/>");
	
	// 리다이렉트
	response.sendRedirect("session_login.jsp");
	
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