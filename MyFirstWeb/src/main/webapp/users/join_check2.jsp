<!-- 회원가입로직 2) 받은 데이터를 DB로 INSERT 하기

	22.02.19 혼자 DAO로 바꿔보기 연습

 -->

<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// 한글이 깨지지 않도록
	request.setCharacterEncoding("utf-8");

	// 폼에서 날아온 데이터 받기
	String fId = request.getParameter("fid");
	String fPw = request.getParameter("fpw");
	String fName = request.getParameter("fname");
	String fEmail = request.getParameter("femail");
	
	// 제대로 받았는지 확인해주기. 둘 중 아무 방법으로 (sysout(콘솔에서) or out(웹페이지에서))
		out.println("<hr>");
		out.println("아래는 폼에서 입력 받은 정보입니다. <br/>");
		out.println("아이디 : " + fId + "<br/>");
		out.println("비밀번호 : " + fPw + "<br/>");
		out.println("이름 : " + fName + "<br/>");
		out.println("이메일 : " + fEmail + "<br/>");
		out.println("<hr>");
		
	
	
	
	// 위의 사용자가 입력한 데이터를 토대로 스크립트릿 내부에서 DB 연동을 한 다음 
	// INSDRT 구문을 실행하도록 만들면 회원가입 절차 구현 가능
	
	UserDAO dao = new UserDAO();
	dao.insertUserDate(fName, fId, fPw, fEmail);
	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="login_form.jsp">로그인 하기</a>
</body>
</html>