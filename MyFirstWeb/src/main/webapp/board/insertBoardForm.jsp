<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="http://localhost:8181/MyFirstWeb/insertboard" method="post">
		<input type="text" name="title" placeholder="제목"/><br/>
		<input type="text" name="content" placeholder="내용"/><br/>
		<input type="text" name="writer" placeholder="글쓴이"/><br/>
		<input type="reset" value="다시쓰기"/>
		<input type="submit" value="제출"/>		
	
	</form>

</body>
</html>