<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 03.17 수정 -->
	<c:if test="${sId eq null}">
		<% response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do"); %>
	</c:if>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 03.16 추가 (방법1. 근데 임시방편) 로그인 안한 사람이 접근했을때 게시판 목록으로 리다이렉트해서 보내기) -->
	<c:if test="${sessionScope.session_id eq null }">
		<script>
			location.href="http://localhost:8181/MyFirstWeb/boardList.do";
		</script>
	</c:if>
	
	
	
	<!-- 03.15) 커맨드 패턴화를 위해 action 목적지를
				
				http://localhost:8181/MyFirstWeb/insertboard 에서
				
				내 답) /MyFirstWeb/insertBoard.do 로 바꿈 -> 돌아가긴 하는데 그냥 선생님 따라 넣기
				선생님) http://localhost:8181/MyFirstWeb/insertBoard.do 이렇게 넣으심
	-->
	
	<form action="http://localhost:8181/MyFirstWeb/insertBoard.do" method="post">
		
		<input type="text" name="title" placeholder="제목" required/><br/>
		<input type="text" name="writer" value="${sessionScope.session_id}" readonly/><br/>
		<textarea row="30" cols="50" name="content" placeholder="본문" required></textarea><br/>
		
		<input type="reset" value="다시쓰기"/>
		<input type="submit" value="제출"/>		
	
	</form>

</body> 
</html>