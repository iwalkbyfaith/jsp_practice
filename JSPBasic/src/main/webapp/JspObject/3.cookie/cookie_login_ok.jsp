<!-- 로그인 로직 2

	폼에서 날아온 데이터들을 저장해주세요.
	
	만약 자동 로그인이 되어 있다면 쿠키를 생성해주시고
	cookie name 값은 "auto_login", value 값은 전달받은 아이디로 해주세요.
	쿠키 유효 시간은 50초입니다.
	쿠키가 생성되었건 말건 cookie_welcome.jsp로 리다이렉트 시켜줍니다.
	
	만약 로그인에 실패했다면 body태그 내에
	"로그인에 실패했습니다." 라는 문구와 함께 a 태그를 이용해 로그인 화면으로 돌아가는 로직을
	대신 볼 수 있도록 처리해주세요.
	
	아이디는 "abc1234"이고, 비밀번호는 "aaa1111"인 경우 로그인을 허용합니다.
	
	선생님 책 추천 : doit 웹사이트 기획 입문 (기획자와 소통하려면)
	



 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	// 폼에서 날아온 데이터 저장
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	// ★★ 체크를 안하면 null이라고 뜨기 때문에, .equals말고 !=null을 쓴다. ★★
		// null은 데이터가 없음을 의미함. String이라는 타입에 null이 들어간 것임. 
		// .equals는 문자열과 문자열을 비교하는 것이기 때문에 null과 문자열을 비교할 수 없다.
	// 쿠키는 로그인 성공한 경우에 발급해야 함.
	
	if(id.equals("abc1234")&&pw.equals("aaa1111")){
		if(auto != null){
			Cookie user1 = new Cookie("auto_login", id); // 생성
			user1.setMaxAge(50);						 // 유지기간
			response.addCookie(user1);				  	 // 발급
		}
		
		// 쿠키 발급 여부와 상관없이 로그인에 성공했으므로 웰컴 페이지로 이동
			// 로그인에 성공하는 순간 바로 이동하기 때문에
			// 실패했을 경우는 그냥 바디 페이지에 적어주면 된다.(else문으로 처리해도 되긴 함)
		response.sendRedirect("cookie_welcome.jsp");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 로그인 실패했을 경우 -->
	<h1>로그인에 실패했습니다.</h1>
	<a href="cookie_login.jsp">다시 로그인하기</a>

	
</body>
</html>