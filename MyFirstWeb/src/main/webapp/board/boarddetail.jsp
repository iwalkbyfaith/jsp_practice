<!-- 

	type="text"에 넣어줄지 말지는 취향
	
	textarea는 value 속성을 사용할 수 없음. 여닫는 부분 사이에 넣어줘야 함.

	a 태그에서는 목적지를 '서블릿 주소'로 줘야함 (습관적으로 .jsp로 이동하지 말 것) ★
		주소를 /MyFirstWeb/boardlist 이렇게 줘야하는데
		헷갈리면 페이지 주소창을 보면서 어떻게 뜨나 확인하면 된다.
		(수정) 이렇게 넣어주자! (왜냐면 다른 것들도 이렇게 하는게 편하기 때문에)
		<a href="http://localhost:8181/MyFirstWeb/boardlist">목록으로 돌아가기</a>
			포워딩이 아닐때는 풀주소 넣어주기
			포워딩일때는 /디테일 주소 (ex /board/boarddetail.jsp)
			
			
	지금까지 일일이 들어갈 때는 물음표? 뒤에 숫자를 넣어줬지만
	이제 뭘 할거냐면 제목을 넣었을때 디테일 페이지로 넘어갈 수 있게 고치자
	boardlist로 이동. td를 a태그로 바꿔주면 됨

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${detailBoard }
	
	<br/>
	<hr/>
	<br/>
	
	<h1> ${detailBoard.boardNum }번 글 상세 페이지</h1> <br/>
	
	
	타이틀 : <input type="text" value="${detailBoard.title }" readonly>
	글쓴이 : <input type="text" value="${detailBoard.writer }" readonly> &nbsp;&nbsp;
	조회수 : ${detailBoard.hit } <br/>
	작성일 : <input type="text" value="${detailBoard.bDate }" readonly> <br/>
	수정일 : <input type="text" value="${detailBoard.mDate }" readonly> <br/>	<br/>
	<textarea rows="15" cols="50" readonly>${detailBoard.content }</textarea> <br/>
	
	<a href="http://localhost:8181/MyFirstWeb/boardList.do">목록으로 돌아가기</a>
	
	
	<!-- 글 번호를 입력받아 해당 글을 삭제하기 위한 폼 생성(post만 보내야하니까) -->
	<!-- 게시판 번호가 보이지 않게 하기 위해서 type="hidden"을 사용한다 (퍼블리싱 복습해야 ㅠ) -->
	
	<!-- 03.15) (삭제)
			action을
			http://localhost:8181/MyFirstWeb/boardDelete 에서
			/MyFirstWeb/boardDelete.do
		 03.17) 본인이 쓴게 아니면 삭제, 수정이 안되게
		 	    히든으로 글쓴이도 같이 보냄
		  	 -->

	<!-- 글 번호를 입력받아 해당 글을 수정하기 위핸 폼 생성 
		 03.15) (수정) action 변경
		 
		
	-->
	<c:if test="${sId eq detailBoard.writer}">
		<form action="http://localhost:8181/MyFirstWeb/boardDelete.do" method="post">
			<input type="hidden" name="board_num" value="${detailBoard.boardNum}"/>
			<input type="hidden" name="writer" value="${detailBoard.writer}"/>
			<input type="submit" value="삭제하기"/>
		</form>
	
	
		<form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
			<input type="hidden" name="board_num" value="${detailBoard.boardNum}"/>
			<input type="hidden" name="writer" value="${detailBoard.writer}"/>
			<input type="submit" value="수정하기"/>
		</form>
	</c:if>
	
	
	
	
	
	
	<!--  
	<table class="table table-striped" >
	
		<thead>
			<th>글 번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>조회수</th>
		</thead>
		<tbody>
			<tr>
				<td>${detailBoard.boardNum }</td>
				<td>${detailBoard.title }</td>
				<td>${detailBoard.content }</td>
				<td>${detailBoard.writer }</td>
				<td>${detailBoard.bDate }</td>
				<td>${detailBoard.mDate }</td>
				<td>${detailBoard.hit }</td>
			</tr>
		</tbody>

	
	</table>
	-->
</body>
</html>