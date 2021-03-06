<!-- 세션을 활용한 로그인 처리 1 폼

	session_login.jsp
		form을 만들어주세요.
		목적지 : session_login_check.jsp
		post 방식
		id, pw, nickname 3개 정보르ㄹ submit해서 전달
	
	session_login_check.jsp
		form에서 보낸 데이터를 받아서
			아이디 kkk1234, 비번 1111로 온 경우만 session.setAttribute()를 이용해
			session_id에는 전달 받은 아이디를,
			session_pw에는 전달 받은 비밀번호를
			session_nick에는 전달 받은 닉네임을 저장한 다음
			session_wlecome.jsp로 redirect 합니다.
			로그인 실패시 '로그인창으로 돌아가기' 링크만 보이게 해주세요

	session_welcome.jsp는 로그인 성공했을때 볼 창입니다.
		session_login_check.jsp에서 발급한 세션을 이용해 id, nickname 정보를 얻어와서
		닉네임(id)님 로그인을 환영합니다. 라는 문구가 보여지면 성공입니다.
		아래에 a태그로 로그아웃하기 버튼이 있어 session_logout.jsp로 보내줍니다.
		
	session_logout.jsp 로그아웃시 볼 창입니다.
	로그아웃시에 세션을 모두 파기하고나서 session_login.jsp로 리다이렉트 시켜주면 됩니다.
	
	다 만든 경우,
		session_login.jsp를 이미 로그인한 상태로 접근시 welcome으로 리다이렉트
		로그인 안하고 session_welcome.jsp로 갔을시, 로그인 창으로 보내주기


 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	// 로그인한 사용자가 해당 페이지에 접근했는지 안했는지 세션 조회로 체크 (방법 2가지)
		// (세션으로 해결하는 경우) 
		// 아래의 값 셋 중에 하나만!! 써도 됨
		// 무엇이 되었든 값이 null인 상태라면 '비로그인' 상태인 것임.
			String id = (String)session.getAttribute("session_id");
			String pw = (String)session.getAttribute("session_pw");
			String nick = (String)session.getAttribute("session_nick");	
			
			// 로그인 된 상태라면 저장된 값이, 아니면 null이 콘솔에 찍힐 것. (하나만 확인해도 됨)
			System.out.println(id);
			System.out.println(pw);
			System.out.println(nick);
			
			// 위의 값(id, pw, nick)이 null이 아닌 경우는 로그인이 이미 된 상태입니다.
			// 세션은 login_check.jsp에서 로그인 로직을 통과한 경우에만 발급되기 때문입니다.
			// 이를 이용해 세션에 값이 발급된 경우에는 welcome 페이지로 리다이렉트 되도록 아래에 로직을 짜 보세요.
			if(id != null){
				response.sendRedirect("session_welcome.jsp");
			}
			
			
			
	
		// (쿠키로 해결하는 경우)
		// 이미 로그인한 쿠키가 남아있는 경우 welcome 페이지로 보내기
		// (문제)근데 로그아웃해서 세션이 만료된 경우도 넣어줘야할 것 같은데... (welcome 페이지애서 null 이 뜨는 현상)
		//	Cookie[] cookies = request.getCookies();
		//	String autoLogin = null;
		//	// (해결) 세션 값을 가져와서 if 조건문에 !=null로 걸어주면 됨.
		//	String id = (String)session.getAttribute("session_id");
		//	
		//	if(cookies != null){
		//		for(Cookie cookie : cookies){
		//			autoLogin = cookie.getName();
		//			if(autoLogin.equals("auto_login") && id != null){
		//				response.sendRedirect("session_welcome.jsp");
		//			}
		//		}
		//	}


%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- ★ required를 추가해서 모든 데이터를 입력 받도록 해야함.
		 그렇지 않으면 하나를 입력 안해도 login_check.jsp로 이동하게 됨.
	 -->
	<h2>로그인 창</h2>
	<form action="session_login_check.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" required/><br/>
		<input type="password" name="pw" placeholder="비밀번호" required/><br/>
		<input type="text" name="nick" placeholder="닉네임" required/><br/>
		<input type="checkbox" name="auto" value="checked"/>자동로그인 &nbsp;
		<input type="submit" value="로그인"/>	
	</form>

</body>
</html>