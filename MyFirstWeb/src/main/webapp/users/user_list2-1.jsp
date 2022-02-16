<!-- 전체 유저 목록 가져오기3 (VO 사용) 
		
	user_list2.jsp를 DAO로
	UserDAO.java 를 활용해서 수십줄의 코드를 두줄로 사용하게 되는 것
	(유지/보수 측면에서 편함)

-->

<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 향상된 for문을 이용해서 userList 내부의 데이터를 Table 형태로 user_list1과 동일한 양식으로 화면에 출력해주세요. 
		 힌트 : 표현식 내에 getter를 씁니다.
		 
		 userList(ArrayList)에는 인덱스 하나하나에 UserVO가 하나씩 들어있으므로 향상된 for문에서 UserVO로 받아주어야한다.
		 
	-->
	
		<%
		// 모든 접속 정보는 UserDAO 클래스 내에 있습니다.
		// 따라서 UserDAO를 생성하는 것으로 접속정보 설정이 끝납니다.
		// 여기서 DB종류 지정까지 완료가 됨.
			UserDAO dao = new UserDAO();
		
		// dao 내부에 userinfo 테이블 전체의 데이터를 가져오는
		// getAllUserList()를 호출하는 것으로 필요 데이터 적재가 끝납니다.
		// DB 내 전체 데이터(userList)를 우측에 배달받아 좌변에 저장
			List<UserVO> userList = dao.getAllUserList();
		
		
		%>
	
		<table border="1">
		<thead> <!-- 헤드 영역 -->
			<tr>
				<th>유저 이름</th>
				<th>유저 아이디</th>
				<th>유저 비밀번호</th>
				<th>유저 이메일</th>
			</tr>
		</thead>
		<tbody>
			<% for(UserVO user : userList){%>
				<tr>
					<td><%=user.getuName()%></td>
					<td><%=user.getuId()%></td>
					<td><%=user.getuPw()%></td>
					<td><%=user.getuEmail()%></td>
				<tr>
			<% }%>
		</tbody>
	
	
	
</body>
</html>







