<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="http://localhost:8181/PracticeProject/servlet1" method="post">
		<input type="date" value=now() name="returndate"/> <br/>
		<input type="date" value=now() name="returnschedule"/> 
		<input type="submit"/>
	</form>

</body>
</html>