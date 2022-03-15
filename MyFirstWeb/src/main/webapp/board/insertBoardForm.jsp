<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 03.15) 커맨드 패턴화를 위해 action 목적지를
				
				http://localhost:8181/MyFirstWeb/insertboard 에서
				
				내 답) /MyFirstWeb/insertBoard.do 로 바꿈 -> 돌아가긴 하는데 그냥 선생님 따라 넣기
				선생님) http://localhost:8181/MyFirstWeb/insertBoard.do 이렇게 넣으심
	-->
	
	<form action="http://localhost:8181/MyFirstWeb/insertBoard.do" method="post">
		
		<input type="text" name="title" placeholder="제목" required/><br/>
		<input type="text" name="writer" placeholder="글쓴이" required/><br/>
		<textarea row="30" cols="50" name="content" placeholder="본문" required></textarea><br/>
		
		<input type="reset" value="다시쓰기"/>
		<input type="submit" value="제출"/>		
	
	</form>

</body> 
</html>