<!-- 화씨 문제

	선언부를 이용해서 함수 및 변수를 만들어보세요.
	변수는  celsius(섭씨)라는 이름의 double인 변수로 만들어주세요
	함수는 CtoF라는 이름의 double형 자료를 하나 입력 받고
	double형 자료를 리턴해주게 만들어주세요.
	celsius라는 함수는 오늘의 섭씨 온도로 초기화시켜주세요
	스크립트릿을 이용해서  celsius를 파라미터로 넘겨서 CtoF 함수를 호출해주세요
	함수를 호출한 결과를 out.println()으로 화면에 표출시켜주시면 됩니다.
	화씨 - > 섭씨 공식
	(화씨 온도 - 32) / 1.8 = 섭씨 온도

 -->



<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%-- JSP 주석은 이렇게 작성합니다 --%>
	<%-- JSP 주석은 소스보기에 나타나지 않습니다.--%>
	<!--  html 주석은 소스보기에 나타납니다. (소스보기는 웹페이지 우클릭으로) -->


	<%!
	
	double celsius;
	
	double CtoF(double d){
		return (d * 1.8) + 32;
	}
	
	%>

	<%
	
	celsius = 3.0;
	double fahrenheit = CtoF(celsius);	
	
	%>
	
	
	<h3>오늘 현재 제주 온도</h3>
	섭씨 온도 : <%=celsius %> <br/>
	화씨 온도 : <%=fahrenheit %>
	
	

</body>
</html>