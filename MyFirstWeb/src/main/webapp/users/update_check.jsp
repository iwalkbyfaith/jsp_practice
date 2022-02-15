<!-- 회원가입로직 9) 정보 수정 페이지 

	1. form에서 보낸 비번, 이름, 이메일을 변수로 저장해주세요
	2. 세션에 저장된 아이디를 변수로 저장해주세요.
	3. DB 접속 정보 변수로 관리
	4. 연결
	5. pstmt 생성 및 ?에 값 세팅
	6. pstmt 실행 및 자원 회수 
	7. body 태그에  XX 회원의 정보가 수정되었습니다. 라고 안내해주기
	
	선생님이 update_check.jsp 내부에 저장된 요소들을 그림판으로 구성하셨음(캡쳐함) 설명 동영상 시간은 10:00 ~ 10:53
		영역 : 변수(자바 데이터), 세션/쿠키, form데이터(http데이터)
			  세션/쿠키 와 form 데이터는 엄밀히 말하면 웹 데이터임
		1. login_update.jsp => form에서 변경할 데이터(http데이터)를 'form 데이터'에 날려줌
		   그런데 http 데이터는 자바 내부에서 바로 사용할 수 없음!
		2. 그래서 http 데이터를 자바 내부에 String 타입의 변수로 저장함.
		3. 세션에 저장된 아이디를 얻어올때는
		   login_check.jsp에서 로그인을 할 때 발급(생성)된 세션을 가져와서 자바 내부에 String 타입의 변수로 저장함.
		4. DB 접속정보의 변수들이 변수 영역에 저장됨.
		5. 변수인 쿼리문 sql이 변수 영역에 저장됨
		6. DB에 쿼리문을 전달하는 역할을 하는 pstmt가 변수 영역에 저장됨.
		
	
	실제 필드에 나가서 코드를 짤때는 비밀번호를 지금처럼 '평서문'이 아니라 '암호화'시켜서 사용해야함.
	JSP에서는 암호화 하려면 복잡해서, 이 방법은 나중에 스프링시큐리티 할 때 가르쳐준다고 하심.
	
	지금까지 우리가 만든 방식은 model1 방식임.
	모델1 방식임을 알고 싶다면?  
	웹페이지에서 > 페이지 소스보기 : 코드 1 ~ n 까지 비어있다면 그 부분은 스크립트릿이 들어간 자리임

		
		
-->
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
	
	// 3. DB 접속 정보 변수로 관리
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	try{
	// 4. 연결
	Class.forName(dbType);
	Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
	// 5. pstmt 생성 및 ?에 값 세팅
	String sql = "UPDATE userinfo SET upw=?, uname=?, uemail=? WHERE uid=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, fPw);
	pstmt.setString(2, fName);
	pstmt.setString(3, fEmail);
	pstmt.setString(4, sId);
	
			
	// 6. pstmt 실행 및 자원 회수 
	pstmt.executeUpdate();
	
	con.close();
	pstmt.close();
	
	
	// 7. body 태그에  XX 회원의 정보가 수정되었습니다. 라고 안내해주기
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
	}

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