<!-- response 기초 <미성년자 체크하기> (받는) 



	.sendRedirect() : URL 넘겨주기
		호출되면 거기 적힌 사이트로 강제로 이동시킨다.



-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	// 1. 보낸 age를 받아서 정수로 바꿔서 저장해주세요.
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	// .sendRedirect() : 사이트 강제 이동
	//	response.sendRedirect("https://www.naver.com");
	
	// 2. age가 20 이상이면 res_adult.jsp(성인 확인 결과창)
	//    age가 20 미만이면 res_child.jsp(미성년자 확인 결과창)
	//    으로 강제 이동하도록 조건문을 작성해주세요.
	
		if(age>=20){
			response.sendRedirect("res_adult.jsp");
		}else{
			response.sendRedirect("res_child.jsp");
		}
	
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	나이 : <%= age %>

</body>
</html>