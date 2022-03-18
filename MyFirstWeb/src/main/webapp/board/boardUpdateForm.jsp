<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 03.17 추가) 세션아이디와 글쓴이가 일치하지 않으면 보드리스트로 보냄 -->
<c:if test="${sessionScope.session_id ne board.writer}">
	<% response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do"); %>
</c:if>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${board }

	<hr>

	<!-- 필기시 : 보낼 것만 name을 붙인다는 것 꼭 추가-->

	<!-- 폼은 디테일 페이지 양식을 가져오면 됩니다. -->
	
	<!-- 03.15) action .do로 변경 -->
	
	<h1> ${board.boardNum }번 글 수정 페이지</h1> <br/>
	
	<form action="http://localhost:8181/MyFirstWeb/boardUpdate.do" method="post">
		타이틀 : <input type="text" name="title" value="${board.title }">
		글쓴이 : <input type="text" value="${board.writer }" readonly> &nbsp;&nbsp;
		조회수 : ${detailBoard.hit } <br/>
		작성일 : <input type="text" value="${board.bDate }" readonly> <br/>
		수정일 : <input type="text" value="${board.mDate }" readonly> <br/>	<br/>
		<textarea rows="15" cols="50" name="content">${board.content }</textarea> <br/>
		<input type="hidden" name="board_num" value="${board.boardNum}"/>
		<input type="reset" value="다시 수정"/>
		<input type="submit" value="수정 완료"/>	
	</form>





	<hr/><br/><br/><br/><br/>

	<form action="http://localhost:8181/MyFirstWeb/boardUpdate" method="post">
		<input type ="text" name="title" value="${board.title}"/>
		<textarea rows="15" cols="50" name="content">${board.content}</textarea>
		<input type="hidden" name="board_num" value="${board.boardNum}"/>
		<input type="submit" value="수정하기"/>	
	</form>
	
</body>
</html>