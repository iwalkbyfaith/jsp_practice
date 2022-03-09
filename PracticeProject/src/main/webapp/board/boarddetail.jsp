<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> ${detailBoard.boardNum }번 글 상세 페이지</h1> <br/>
	
	
	타이틀 : <input type="text" value="${detailBoard.title }" readonly>
	글쓴이 : <input type="text" value="${detailBoard.writer }" readonly> &nbsp;&nbsp;
	조회수 : ${detailBoard.hit } <br/>
	작성일 : <input type="text" value="${detailBoard.bDate }" readonly> <br/>
	수정일 : <input type="text" value="${detailBoard.mDate }" readonly> <br/>	<br/>
	<textarea rows="15" cols="50" readonly>${detailBoard.content }</textarea> <br/>
	
	<a href="http://localhost:8181/MyFirstWeb/boardlist">목록으로 돌아가기</a>
	
	


</body>
</html>