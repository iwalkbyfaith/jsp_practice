<!-- 스크립트릿

	스크립트릿 내부에는 자바 코드를 작성할 수 있으며, 이 코드를 반영해 페이지가 구성됩니다.
	
	system.out.println()이 콘솔에 찍히게 해줬다면
	out.println()은 html 화면에 괄호 내 구문을 콘솔에 찍히게 해줍니다.
	(javascript의 document.write()와 같은 역할	


 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% for(int i =0; i <3; i++) {%>
		<h2>반복문 테스트1</h2>
		<p>반복이 잘 됩니다.</p>
	<% } %>
	
	
	<!-- 하단에 구구단 코드를 작성해주세요. -->
	
		<h2>구구단 2단 </h2>
		<% for(int i =2; i <3; i++) {
			for(int j=1; j<=9; j++){
				out.println(i + " X " + j + " = " + i*j + "<br/>");
			}
		 } %>
		 
		
		<!-- 내 답 -->
		<h2>구구단 3단 ~ 9단 </h2>
		<% for(int i =3; i <=9; i++) { %>
		<h2><% out.println(i + "단");%></h2>
		<!-- 선생님답 : 39번 코드를 out.println("<h1>" + i + "단</h1>"); 라고 작성하심 -->
			<% for(int j=1; j<=9; j++){
				out.println(i + " X " + j + " = " + i*j + "<br/>");
			    }
			out.println("=========<br/>");
		 } %>
		 
		 
		 <!--  선생님 답 -->
		<h2>구구단 3단 ~ 9단 (선생님 답) </h2>
		<% for(int i =3; i <=9; i++) {
			out.println("<h1>" + i + "단</h1>");
			for(int j=1; j<=9; j++){
				out.println(i + " X " + j + " = " + i*j + "<br/>");
			}
			out.println("=========<br/>");
		 } %>
	
	
</body>
</html>