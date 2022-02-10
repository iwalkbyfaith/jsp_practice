<!-- 세션을 활용한 로그인 처리 2 로그인 조건문 & 로그인 실패시 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// POST로 받은 한글이 깨지는 경우 사용하는 코드
	request.setCharacterEncoding("utf-8");
	
	// 폼에서 넘어온 데이터를 String 변수에 넣어줌
	String formId = request.getParameter("id");
	String formPw = request.getParameter("pw");
	String formNick = request.getParameter("nick");
	String formAuto = request.getParameter("auto");

	
	// 로그인 성공 로직
	if(formId.equals("kkk1234") && formPw.equals("1111")){
		
		// 이건 쿠키로 하는 경우
		//if(formAuto != null){
		//	Cookie auto = new Cookie("auto_login", formId);
		//	auto.setMaxAge(20);
		//	response.addCookie(auto);
		//}
		
		
		// String 변수에 있는 값들을 session 형태로 만들어줌.
		session.setAttribute("session_id", formId);
		session.setAttribute("session_pw", formPw);
		session.setAttribute("session_nick", formNick);
		
		response.sendRedirect("session_welcome.jsp");
	}
	
	// 로그인 안한 사용자(null)를 로그인 페이지로 이동시키기 (혹시 문제가 이게 아니었나?)
		// 내 답
		//String id = (String)session.getAttribute("session_id");
		//if(id == null){
		//	response.sendRedirect("session_login.jsp");
		//}
	
		// 선생님 답 (이거는 로그인한 사용자가 들어왔을때인듯)
		//if(id != null){
		//	response.sendRedirect("session_welcome.jsp");
		//}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>로그인에 실패했습니다.</h2>
	<a href="session_login.jsp">로그인창으로 돌아가기</a>

</body>
</html>