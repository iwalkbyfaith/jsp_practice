<!-- 로그인 구현 (받는)

	아이디 : love
	비밀번호 : qwer1234
	
	해당 아이디와 비밀번호를 모두 맞게 폼에서 날려준 경우는 "xx 님 환영합니다"
	하나라도 틀렸다면 "로그인에 실패했습니다" 가 나오도록


 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	String realId = "love";
	String realPw = "cat1234";
	// 선생님은 새로운 변수 안 만들고 (괄호)안에 "abcd" 이런식으로만 하심.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%if(realId.equals(id) && realPw.equals(pw)){ %>
	<b><%=id %>님 환영합니다!</b>
	<%}else{ %>
	<b>로그인에 실패했습니다.</b>
	<a href="req_login_form.jsp"><b>로그인창으로 돌아가기</b></a>
	<%} %>

</body>
</html>