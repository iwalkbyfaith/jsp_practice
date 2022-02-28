<!-- 

	jstl_if를 목적지로하는 폼을 만들어서 입력한 요소를 전달하도록 폼 코드를 작성해주세요
	submit 버튼을 눌러 제출합니다.
	
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

	<form action="jstl_if.jsp" method="post">
		<input type="text" name="name" placeholder="이름 입력"/>
		<input type="submit" value ="제출"/>	
	</form>


</body>
</html>