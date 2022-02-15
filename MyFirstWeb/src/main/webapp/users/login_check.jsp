<!-- 회원가입로직 4) 로그인 체크 ▶ 내 답! ◀

	폼에서 보낸 아이디 비밀번호를 받아서 변수에 저장해주시고 콘솔에 확인도 해주세요


 -->

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 폼에서 날라온 데이터 저장
	String fId = request.getParameter("loginId");
	String fPw = request.getParameter("loginPw");
	
	// 잘 받아졌나 콘솔로 확인
	System.out.println(fId);
	System.out.println(fPw);
	
	// 0. DB 연결을 위한 변수 선언
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
	
	try{

		// 1. DB 종류 선택 및 연결
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		
		// 2. 쿼리문(사용자가 입력해준 id 조회select하기) 선언 및 PreparedStatement 객체 생성
		String sql = "SELECT * FROM userinfo WHERE uid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, fId);
		
		
		// 3. 쿼리문 실행 결과 ResultSet에 받기 (가입 안된 아이디가 있다면 아무것도 안 들어올 것.)
		//    rs.next()를 이용해서 들어온 것을 확인 가능
		ResultSet rs = pstmt.executeQuery();
		
		// 포인터를 -1에서 0으로 이동
		rs.next();
		
		// 받아온 데이터를 변수로 저장해줌
		String dName = rs.getString(1);
		String dId = rs.getString(2);
		String dPw = rs.getString(3);
		String dEmail = rs.getString(4);
		
		// 잘 들어왔는지 확인
		System.out.println("==============");
		System.out.println(dName);
		System.out.println(dId);
		System.out.println(dPw);
		System.out.println(dEmail);
		System.out.println("==============");
		
		// 자원 회수
		con.close();
		pstmt.close();
		
		
		
		
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면, (id.equals(DB내에 저장된 ID)로 검사 가능) <- resultset에 들어온 데이터로 비교
		//    DB에 적재되어있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해 둘 다 일치하면 세션 발급
		//    그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		
		if(fId != null){
		
			if(fId.equals(dId) && fPw.equals(dPw)){
				// 확인용
				//System.out.println(fId.equals(dId)==true);
				//System.out.println(fPw.equals(dPw)==true);
				session.setAttribute("session_name", dName);
				session.setAttribute("session_id", dId);
				session.setAttribute("session_pw", dPw);
				
				// 5. 만약 웰컴 페이지도 만들 여력이 되신다면, 가입 이후 리다이렉트로 넘겨서
				//    이름(아이디)님 로그인을 환영합니다 라는 문장이 뜨는 login_welcome.jsp까지 구현해주세요.
				response.sendRedirect("login_welcome.jsp");
			}
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인에 실패하셨습니다</h1>
	<a href="login_form.jsp">다시 로그인하기</a>
</body>
</html>