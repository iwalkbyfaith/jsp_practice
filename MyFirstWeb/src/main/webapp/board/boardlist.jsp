<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 시도0 
		<table border="1">
		
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
					<td></td>
				</tr>
			</tbody>
		
		</table>
	
	-->
	
	<!-- 시도1 -->
	${allList }
	
  	<hr/>
  
  	<!-- 시도2 
		<c:forEach var="i" items="${allList}">
			${i}<br/>
		</c:forEach>
	-->
	<hr/>
	
	<%-- -- 시도3 
		<c:forEach var="i" items="${allList}">
			${i[0]}
		</c:forEach>
	--%>
	
	<!-- 내부 요소를 출력하는 방법 : 인덱싱이나 c:forEach를 이용해서 하나하나 꺼내준다음
		 .변수명을 적으면 출력됩니다.
	 -->
	 
	 전체 데이터 : ${allList[0] }
	 
	 <hr>
	 글 번호 : ${allList[0].boardNum }
	 글 제목 : ${allList[0].title}
	 
	 <hr>
	 0번째 요소 : ${allList[0]}<br/>
	 1번째 요소 : ${allList[1]}<br/>
	 2번째 요소 : ${allList[2]}<br/>
	 3번째 요소 : ${allList[3]}<br/>
	 
	 <hr>
	 
	 <!-- 시도4 구리지만 뭔가 되긴 됨.
	 	테이블 밖에 forEach문을 넣었을때 => 구림
	 	tbody 안에 넣었을때 => 예쁨
	 	
	 	Q) end 처리 allList 길이만큼 하는 방법
	 	length, length(), size, size() 다 넣어보고 난리쳤는데 안 됨 -> (해결) 향상된...포문..ㅎ..
	 	
		==> 이렇게 고정 index를 사용하는 것은 좋지 못한 방법.
	 
	 	
	 		<table class="table table-striped">
		
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
				<c:forEach begin="0" end="2" var="i">
				<tr>
					<td>${allList[i].boardNum }</td>
					<td>${allList[i].title }</td>
					<td>${allList[i].content }</td>
					<td>${allList[i].writer }</td>
					<td>${allList[i].bDate }</td>
					<td>${allList[i].mDate}</td>
					<td>${allList[i].hit }</td>
				</tr>
				</c:forEach>
			</tbody>
		
			</table>
			
			
		-->	
			
	<!-- 시도5) begin이랑 end 안쓰고 items랑 var를 사용해보라고 하심. 향상된 for문처럼 사용..? (안됨)
		
		 		<table class="table table-striped">
		
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
				<c:set var="arr" value='<@= new String[]{"${allList[i].boardNum }", "${allList[i].title }", "${allList[i].content }",
				  "${allList[i].writer }", "${allList[i].bDate }", "${allList[i].mDate}", "${allList[i].hit }"}%>'/>
				
				<tr>
					<c:forEach items="arr" var="i">
						<td>${i }</td>
						
					</c:forEach>
				</tr>
			
			</tbody>
		
			</table>
			
	-->
	
	
	<!-- 시도 6) 이거 맞는듯!? ㅠㅠ흑흑 
				몇개가 들어올지 모르는 경우에는 향상된 for문을 사용해야한다!
				실행한 페이지의 소스보기를 하면 저번에 서울도서관처럼 구멍뻥뻥 안 뚤려있음.
				
				+) 게시판에 글을 썼을때 제일 마지막에 쓴 글이 가장 위쪽에 있음.
				   근데 결과 페이지를 보면 먼저 쓴 글이 먼저와서 순서를 뒤집어줘야 함.
				   다오 내부의 쿼리문을 고쳐서 순서를 뒤집어야함.
				   다오로 가서 String sql = "SELECT * FROM boardinfo ORDER BY board_num DESC";
				   이렇게 오더바이절을 추가해주었다.
		
		
				03.08 추가) 제목을 a태그로 바꿔주고 게시판넘버에 따라 다른 페이지로 이동하도록 만들어줌 ★
	-->
	
		 		<table class="table table-striped">
		
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
						<c:forEach var="list" items="${allList}" >
							<tr>
								<td>${list.boardNum }</td>
								<td><a href="http://localhost:8181/MyFirstWeb/boarddetail?board_num=${list.boardNum}"> ${list.title }</a></td>
								<td>${list.content }</td>
								<td>${list.writer }</td>
								<td>${list.bDate }</td>
								<td>${list.mDate }</td>
								<td>${list.hit }</td>
							</tr>
						</c:forEach>
					</tbody>
		
				</table>
				
				
				<!-- 03.11 글쓰기 버튼 추가 (선생님은 a 태그 안에 버튼 태그 넣으심)
				     그리고 나는 바로 폼으로 보냈었는데, 선생님이 주소가 노출될 우려가 있으므로
				     서블릿을 통해서 이동해야한다고 하셨음.
				-->				
				<button><a href="http://localhost:8181/MyFirstWeb/boardInsertForm"> 글쓰기 </a></button>
	
	
	



</body>
</html>