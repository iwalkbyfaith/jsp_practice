<!-- 버스카드 판독기 (받는)

	조건문을 이용해 나이를 판독해 리다이렉트를 통해 보내줌
	
	미성년자에 a 태그 안에 이미지 파일을 넣어서 나이입력창으로 되돌아가게 하는 태그를 만들었음.

-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge);
	
	if(age<20){
		response.sendRedirect("bus_junior.jsp");
	}else if(age<60){
		response.sendRedirect("bus_adult.jsp");
	}else if(age>=60){
		response.sendRedirect("bus_senior.jsp");
	}
	


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>