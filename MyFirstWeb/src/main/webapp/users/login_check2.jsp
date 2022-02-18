<!-- 회원가입로직 4) 로그인 체크 (DAO로 고치기)

	1 ~ 3번까지의 로직을 DAO의 getUserData를 사용해 수행하도록 변경해주세요
	
	1. 가입이 되어있는지
	2. 비밀번호가 같은지
	
	★★★★ 중요 ★★★★
		fId와 fPw는 폼에서 날린 데이터에서 받은거고
		uId와 uPw는 DB에서 뽑아온 데이터에서 받은 것임.
		따라서 fId와 uId를 비교하는 것은 사용자가 입력한 폼 내용과 DB 내용을 비교하게 되는 것임.
	
 -->

<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
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
	

	
	
	
	try{// 선생님 코드에서 try~catch 삭제됨. 근데 별 에러 없으면 일단 내둬보자
		
		// DB연결
		UserDAO dao = new UserDAO();
		// SELECT 조건절 구문
		UserVO user = dao.getUserData(fId);
		System.out.println("DB에서 받아온 정보 : " + user);
		
		
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면, (id.equals(DB내에 저장된 ID)로 검사 가능) <- resultset에 들어온 데이터로 비교
		//    DB에 적재되어있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해 둘 다 일치하면 세션 발급
		//    그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		if(user != null){ 
			// 나는 그냥 아래쪽 if문 user.get~ 썼었는데 선생님은 새로운 변수에 다시 넣는 방법 사용하심(나도 고침)
			// 선생님이 getter로 써도 되는데 이해가 어려울가봐 좀 더 많은 코드 사용한거라고 하심(내맘대로하면 될듯)
			String uId = user.getuId();
			String uPw = user.getuPw();
			String uName = user.getuName();
			
			// 폼에서 받아온 데이터와 테이블 내부 데이터를 비교
			if(fId.equals(uId) && fPw.equals(uPw)){
				out.println("<h1>" + fId + "님 로그인에 성공하셨습니다.</h1>");
				// 로그인 세션 발급(로그인에 성공한 경우만 발급)
				session.setAttribute("session_id", uId);
				session.setAttribute("session_name", uName);
				session.setAttribute("session_pw", uPw);
				// 5. 만약 웰컴 페이지도 만들 여력이 되신다면, 가입 이후 리다이렉트로 넘겨서
				//    이름(아이디)님 로그인을 환영합니다 라는 문장이 뜨는 login_welcome.jsp까지 구현해주세요.
				response.sendRedirect("login_welcome.jsp");
			
			// 아이디는 맞는데 비밀번호가 틀리는 경우
			}else{
				out.println("<h1>비밀번호가 틀렸습니다. 다시 확인해주세요.</h1/>");
			}
		}else{
			response.sendRedirect("login_form.jsp");
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