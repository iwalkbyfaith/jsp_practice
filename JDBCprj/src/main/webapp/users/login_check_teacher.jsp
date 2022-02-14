<!-- 회원가입로직 4) 로그인 체크 ▶ 선생님 답! ◀

	폼에서 보낸 아이디 비밀번호를 받아서 변수에 저장해주시고 콘솔에 확인도 해주세요

	Q) 세션에 비밀번호를 저장할 필요가 있을까?
	A) 개인정보를 수정하거나 탈퇴하는 경우에 수정/탈퇴 버튼을 바로 눌리게 처리할 수도 있지만
		비밀번호를 한 번 더 입력해주세요 라고 묻는 경우가 있어서, 그럴때는 아무래도 세션에 저장해두는 편이 DB에서 다시 가져오는 것보다 훨씬 효율적이다.
	
	
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
	System.out.println("폼에서 날린 아이디 : " + fId);
	System.out.println("폼에서 날린 비밀번호 : "  + fPw);
	
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
		
		
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면, (id.equals(DB내에 저장된 ID)로 검사 가능) <- resultset에 들어온 데이터로 비교
		//    DB에 적재되어있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해 둘 다 일치하면 세션 발급
		//    그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		
		if(rs.next()){
			String uId = rs.getString("uid"); // "따옴표"안의 uid는 DB내의 userinfo 테이블의 컬럼 이름
			String uName = rs.getString("uname");
			String uPw = rs.getString("upw");
			System.out.println("DB내 유저 아이디 : " + uId);
			System.out.println("DB내 유저 비밀번호 : " + uPw);
				
				// 폼에서 받아온 데이터와 테이블 내부 데이터를 비교
				if(fId.equals(uId) && fPw.equals(uPw)){
					out.println("<h1>" + fId + "님 로그인에 성공하셨습니다.</h1>");
					// 로그인 세션 발급(로그인에 성공한 경우만 발급)
					session.setAttribute("teacher_session_id", uId);
					session.setAttribute("teacher_session_name", uName);
					session.setAttribute("teacher_session_pw", uPw);
					// 5. 만약 웰컴 페이지도 만들 여력이 되신다면, 가입 이후 리다이렉트로 넘겨서
					//    이름(아이디)님 로그인을 환영합니다 라는 문장이 뜨는 login_welcome.jsp까지 구현해주세요.
					response.sendRedirect("login_welcome.jsp");
				// 아이디는 맞는데 비밀번호가 틀리는 경우
				}else{
					out.println("<h1>비밀번호가 틀렸습니다. 다시 확인해주세요.</h1/>");
				}
		// 아이디를 잘못 친 경우
		}else{
			out.println("<h1>아이디가 없습니다. 입력 아이디를 확인해주세요.</h1>");
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