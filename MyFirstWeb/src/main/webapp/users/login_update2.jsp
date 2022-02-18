<!-- 회원가입로직 8) 정보 수정 폼 (VO, UserDAO 사용)

	login_update.jsp를 DAO를 활용한 로직으로 전환


-->

<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! UserVO user = null;%>
	<% 
		// 0. 로그인한 상태로 이 페이지로 이동하는 것이니까 세션 아이디를 얻어옴
		String sId = (String)session.getAttribute("session_id");
	
			// 로그인 안 한 사람이 해당 주소를 얻어서 접속한 경우
				if(sId == null){
				response.sendRedirect("login_form.jsp");
				}
		
		// 1.DAO 객체 생성(생성자 메서드가 호출된다.) <= DB 연결
		UserDAO dao = new UserDAO();
		
		// 2. DAO 내부에서 회원 1명의 정보만 가져오는 getUserData 호출
		// DAO에 메서드로 관리한 SELECT 구문에 sId(아이디)를 보내고 값을 return 받아서 UserVO user(1명)에 넣음
		user = dao.getUserData(sId);
		
		// 3. 콘솔 확인
		//    UserVO.java에 toString 메서드가 있어서 주소가 아닌 '내용물'이 출력됨.
		System.out.println(user.getuEmail());
		System.out.println(user.getuId());
		System.out.println(user.getuName());
		System.out.println(user.getuPw());
		// 혹은 이렇게 한번에 얻어오기
		System.out.println(user);
	
	%>
	
	<h1><%=user.getuName() %>(<%=user.getuId() %>)님의 정보를 수정합니다.</h1>
	<form action="update_check.jsp" method="post">
		<input type="password" name="pw" placeholder="수정할 비밀번호" required/><br/>
		<input type="text" name="name" placeholder="수정할 이름" value=<%=user.getuName()%> required/><br/>
		<input type="email" name="email" placeholder="수정할 이메일" value=<%=user.getuEmail()%> required/><br/>
		<input type="reset" value="초기화"/>
		<input type="submit" value="수정하기"/>
	</form>
	

	
</body>
</html>