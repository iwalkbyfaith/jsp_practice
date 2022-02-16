<!-- 회원가입로직 5) 로그인 성공 페이지 

	세션에 저장된 정보를 확인해
	이름(id)님 접속을 환영합니다. 라고 안내해주는 화면을 만들어보겠습니다.
	추후 여기에는 탈퇴하기, 로그아웃, 정보 수정하기 버튼이 추가될 예정입니다.
	
	로그인 안 된 사용자가 여기로 접근하면 로그인페이지로 보내주세요.
	
	logout.jsp 페이지
		세션 파기 후 login_form.jsp로 보내주세요
		login_form.jsp도 만약 로그인한 사용자가 접근하면 welcome 페이지로 보내도록 로직을 살짝 수정해주세요.
		
	member_out.jsp 페이지
		회원탈퇴를 위한 페이지
		

-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sName = (String)session.getAttribute("session_name");
	String sId = (String)session.getAttribute("session_id");
	
	// 로그인에 실패했다면(혹은 안했다면), 세션 발급이 없을 것.
	if(sId==null){
		response.sendRedirect("login_form.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 완료 페이지</h2>
	<%=sName %>(<%=sId %>)님! 로그인을 환영합니다! <br/>
	
	<a href="logout.jsp">로그아웃</a><br/>
	<a href="login_update2.jsp">정보수정</a><br/>
	<a href="member_out.jsp">탈퇴하기</a><br/>
	
	<!-- user_list2.jsp 생성후 추가된 사항. -->
	<a href="user_list2-1.jsp">회원목록</a>
	
</body>
</html>