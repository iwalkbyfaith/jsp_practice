<!-- 회원가입로직 7) 회원탈퇴 

	DB 연결 후, 세션에서 받아온 아이디를 이용해 회원탈퇴 후
	body 태그 내에는 "아이디 회원의 탈퇴가 완료되었습니다."를 출력하고
	실제로 DB에 DELETE 구문을 날려서 삭제까지 처리해주세요.
	
	로그인 안한 사용자가 접근시 login_form.jsp로 보내주세요
	
	* 폼에서 데이터를 가져오는 경우와 세션에서 가져오는 경우를 잘 구분하자
		폼  : request.getParameter("값");
		세션 : (String)session.getAttribute("값");

-->


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
	
	// 1. DB 연결을 위한 변수 선언
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
				
	try{
		
		// 2. DB 종류 선택 및 연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 3. 쿼리문
			String sql = "DELETE FROM userinfo WHERE uid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			// 현재 로그인된 유저를 삭제하는 것이므로, 로그인 유저의 아이디를 넘겨야 함.
			pstmt.setString(1, sId);
		
		// 4. 실행
			pstmt.executeUpdate();
		
		// 5. 자원 회수 (안 작성해도 로직은 돌아가지만, 해주는 것을 권장)
			con.close();
			pstmt.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// 6. 세션 삭제 (DB에서는 삭제 되었지만 세션은 남아있는 상태이니까)
			// 삭제가 성공했건 실패했건 회원 탈퇴 페이지에 접근한 자체로 세션 파기
			session.invalidate();
			// 로그인 창으로 돌려보내기 (이렇게 하든지, 바디 태그에 다른 방법으로 추가하든지.)
			//response.sendRedirect("login_form.jsp");
			
		}
	
		
	
		

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