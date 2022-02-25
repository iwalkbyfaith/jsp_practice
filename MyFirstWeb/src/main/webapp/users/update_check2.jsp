<!-- 회원가입로직 9) 정보 수정 페이지 (DAO로 바꾸기)

	
		
-->
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	
	// 0. 한글깨짐 방지 인코딩
	request.setCharacterEncoding("utf-8");

	// 1. form에서 보낸 비번, 이름, 이메일을 변수로 저장해주세요

	String fPw = request.getParameter("pw");
	String fName = request.getParameter("name");
	String fEmail = request.getParameter("email");
		// 확인
		System.out.println("수정 폼에서 받은 변경할 데이터들");
		System.out.println("수정할 비밀번호 : " + fPw);
		System.out.println("수정할 이름 : " + fName);
		System.out.println("수정할 이메일 : " + fEmail);
	
	// 2. 세션에 저장된 아이디를 변수로 저장해주세요.
	String sId = (String)session.getAttribute("session_id");
		// 확인
		System.out.println("세션으로 얻어온 아이디 : " + sId);
	
	
	// update_check2 여기부터 DAO로 수정됨
	
	// UserDAO dao = new UserDAO();
	// 02.25
	UserDAO dao = UserDAO.getInstance();
	dao.userUpdate(fName, fPw, fEmail, sId);
		
			

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=fName %>(<%=sId %>) 회원의 정보가 수정되었습니다</h1>
	<a href="login_welcome.jsp">돌아가기</a>
</body>
</html>