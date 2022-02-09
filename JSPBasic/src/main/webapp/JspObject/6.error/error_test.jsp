<!-- 에러 처리 1) try~catch

	try 시작 : 12번줄
	try 끝  : 31번줄 (따라서 25번도 코드의 일부분)


 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
		int a = 3/0;
	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나눗셈의 결과는 <%=a %>입니다.
</body>
</html>

<% 

	}catch (Exception e){
		out.println("로직에 문제가 생겼습니다.");
	}

%>

<!-- 

	3/1 => 문제 없음
	3/0 => 원래는 페이지 화면에 500 에러가 떠야함.
		   그런데 지금은 try~catch 구문을 써서 "로직에 문제~" 가 뜨는 것임.
		   int a = 3/0;을 try 구문 밖으로 보내면 500에러가 뜬다.
 -->