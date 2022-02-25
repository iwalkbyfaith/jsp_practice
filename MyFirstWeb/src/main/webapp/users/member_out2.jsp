<!-- 회원가입로직 7) 회원탈퇴 

	DB 연결 후, 세션에서 받아온 아이디를 이용해 회원탈퇴 후
	body 태그 내에는 "아이디 회원의 탈퇴가 완료되었습니다."를 출력하고
	실제로 DB에 DELETE 구문을 날려서 삭제까지 처리해주세요.
	
	로그인 안한 사용자가 접근시 login_form.jsp로 보내주세요
	
	* 폼에서 데이터를 가져오는 경우와 세션에서 가져오는 경우를 잘 구분하자
		폼  : request.getParameter("값");
		세션 : (String)session.getAttribute("값");

-->


<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	
	// 0. 세션에서 아이디 받아오기
	String sId = (String)session.getAttribute("session_id");

		// 로그인 안했는데 페이지로 들어온 경우
		// 나는 여기에 코드를 작성했는데 선생님은 finally에서 처리하셨음.
		if(sId == null){
			response.sendRedirect("login_form.jsp");
		}
	
	// member_out2.jsp DAO 추가
		// UserDAO dao = new UserDAO();
	// 02.25
	UserDAO dao = UserDAO.getInstance();
		dao.deleteUser(sId);
		
		// 세션 삭제
		session.invalidate();
	
		
	
		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> <%=sId %> 회원의 탈퇴가 완료되었습니다. </h1> 
	<a href="login_form.jsp">메인 화면으로 돌아가기</a>
</body>
</html>