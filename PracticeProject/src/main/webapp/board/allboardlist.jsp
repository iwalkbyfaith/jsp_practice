<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${allBoardList}
	
	<table border="1">
		<theader>
			<th>글 번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
		</theader>
		<tbody>
			<c:forEach var="board" items="${allBoardList}">
				<tr>
					<td>${board.boardNum}</td>
					<td><a href="http://localhost:8181/PracticeProject/boarddetail?board_num=${board.boardNum}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.bDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>