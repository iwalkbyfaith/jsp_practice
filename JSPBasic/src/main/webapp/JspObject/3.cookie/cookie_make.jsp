<!-- 쿠키 만들기 (생성하기)

	쿠키 생성 방법 순서
		1. 쿠키 객체를 생성 - 생성자의 매개값으로 쿠키의 이름과 저장할 데이터를 입력
		2. 쿠키 클래스의 setter 메서드로 쿠키의 속성들을 설정하기
	    3. 사용자에게 http 응답시 response 객체에 생성된 쿠키를 탑재하여서 발급까지 마치기

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	// 1. 쿠키 객체 생성 ("쿠키네임", "쿠키밸류")
	Cookie apple = new Cookie("apple_cookie", "사과맛");
	Cookie peanut = new Cookie("peanut_cookie", "땅콩맛");
	
	// 2. 메서드로 속성 설정
	apple.setMaxAge(60 * 60);  // 단위:초 => 60초 * 60 = 1시간
	peanut.setMaxAge(20); 	   // 단위:초 => 20초
	
	// 3. 발급
	response.addCookie(apple);
	response.addCookie(peanut);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 4. 쿠키를 확인할 수 있는 사이트로 넘어가기 -->
	<a href="cookie_check.jsp">쿠키 확인</a>

</body>
</html>