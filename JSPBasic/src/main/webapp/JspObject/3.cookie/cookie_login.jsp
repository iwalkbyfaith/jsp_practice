<!-- 로그인 로직 1


	
	로그인 창은 form으로 구성해주시면 됩니다.
	input text 1개 : 유저 아이디
	input password 1개 : 유저 비밀번호
	input checkbox : 자동 로그인\
	목적지 : cookie_login_ok_jsp

	auto login 관련해서 발급된 쿠키가 있는지 체크해서 쿠키가 있다면
	로그인 창을 보여주는 대신 바로 welcome 페이지로 보내주세요(cookie_check.jsp 참조)


	(500에러) JSESSIONID (제이 세션 아이디)가 쿠키 처리가 안 된 이유?
		다른 웹페이지로 켜보면 JSESSIONID의 값이 다름을 알 수 있다.
		즉 PC별로가 아닌, 어느 PC의 어느 브라우저인지 식별하기 위해 값이 다 다름
		
		★ 제이세션 아이디는 코드가 다 돌고 나서 !!!! 마지막에 발급을 받아줌.
		그래서 새로고침하면 정상적으로 뜨는 것.
		
		★ 따라서 != null 처리를 반드시 해주어야 할 듯.
		
		

 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% // 맨 마지막에

	Cookie[] cookies = request.getCookies();
	String str;	
	
	// (문제) 바깥쪽 if문을 쓰지 않으면 http500 에러가 발생했음
	// 선생님은 그래서 향상된 for문을 쓰는 것을 추천한다고 하심.
	//if(cookies != null){
	//	for(int i=0; i <cookies.length; i++){
	//		str = cookies[i].getName();
	//		if(str.equals("auto_login")){
	//			response.sendRedirect("cookie_welcome.jsp");
	//		}
	//	}
	//}
	
	
	// (선생님 답) 향상된 for문으로 처리하기 
	String autoLogin=null;
	String userId = null;
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			autoLogin = cookie.getName();
			// 쿠키 이름 확인하기(콘솔 확인용)
			System.out.println(autoLogin);
			// 쿠키 값 확인하기(콘솔 확인용)
			System.out.println(cookie.getValue());
			
			// null값이 들어왔을때 바로 equals를 쓰면 500에러 발생
			// ★ short circuit을 이용해서 null이 아닌 경우만 .equals를 실행하도록 조건식 작성
			// 근데 바깥쪽에 !=null 추가해줬으니 65번에는 !=null 부분 없어도 됨(삭제함)
			if(autoLogin.equals("auto_login")){
				// cookie_welcome 페이지로 리다이렉트
				response.sendRedirect("cookie_welcome.jsp");		
			}
		}
	}



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="cookie_login_ok.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"/><br/>
		<input type="password" name="pw" placeholder="비밀번호"/><br/>
		<input type="checkbox" name="auto" value="checked"/> 자동 로그인&nbsp;
		<input type="reset" value="초기화"/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>