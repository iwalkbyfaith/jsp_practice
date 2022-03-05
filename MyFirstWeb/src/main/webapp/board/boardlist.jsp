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
	 글 번호 : ${allList[0].boardNum }
	 글 제목 : ${allList[0].title}
	 
	 <hr>
	 
	 <!-- 시도4 구리지만 뭔가 되긴 됨.
	 	테이블 밖에 forEach문을 넣었을때 => 구림
	 	tbody 안에 넣었을때 => 예쁨
	 	
	 	Q) end 처리 allList 길이만큼 하는 방법
	 -->
	 
	 	
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
		
	
	
	
	
	
	



</body>
</html>