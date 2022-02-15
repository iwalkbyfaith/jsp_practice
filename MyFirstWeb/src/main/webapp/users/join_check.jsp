<!-- 회원가입로직 2) 받은 데이터를 DB로 INSERT 하기

	폼에서 날려준 데이터를 받아서 변수에 저장해주세요.
	DB 내부에서 중복되는 아이디가 있는지를 체크하는 것은 나중에 한다고 하심.

 -->

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
	
	// 0. 접속 정보 (변수에 넣어 관리하는 것을 권장)
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
	
	
	try{
		
		// 1. DB 종류 지정 및 연결
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
		// 2. 쿼리문 작성 및 pstmt 생성
		String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 물음표에 넣는 순서는 DB에서의 순서대로 넣으면 됨.
		pstmt.setString(1, fName);
		pstmt.setString(2, fId);
		pstmt.setString(3, fPw);
		pstmt.setString(4, fEmail);
		
	
		// 3. pstmt 실행으로 사용자가 보낸 폼 데이터 DB에 저장
		pstmt.executeUpdate();
		
		// 4. 자원 회수
		con.close();
		pstmt.close();
	
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		// 5. out.println("회원가입이 완료되었습니다."); 띄워서 가입완료 알리기.
		out.println("회원가입이 완료되었습니다!");		
	}

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