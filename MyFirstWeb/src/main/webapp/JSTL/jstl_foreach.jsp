<!-- 반복문 forEach 

	begin 시작값
	end   끝값(이 값이 포함됨)
	step  증가숫자 (안주면 자동으로 1 들어감)
	var   태그 내에서 쓸 변수명 ( 밑의 number는 i의 경우라고 생각 )
	
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 태그 라이브러리 지정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1부터 100까지 총합을 구하기 -->
	
		<!-- 1) 스크립트릿으로 작성했다면? -->
		<%-- <%
				int total =0;
				for(int i=1; i<101; i++){
					total += i;
				}
				out.print("<h1>1부터 100까지 총 합은 : " + total + "</h1>");
			%>
		--%>	
		
		
		<!-- 2) 반복문 forEach로 사용하기 -->
			<c:forEach begin="1" end="100" step="1" var="number"> 
				<c:set var="total" value="${total + number}"/>
			</c:forEach>
			
			<h1>1~100까지의 누적합 : ${total}</h1>
			
			<hr>
			
		<!-- 2-1) forEach를 사용해서 구구단 4단을 출력해보세요 -->
			
			<c:forEach begin="1" end="9" step="1" var="number">
				4 * ${number } = ${4*number} </br>
			</c:forEach>
			
			
		<br/><hr/>	
		<!-- 2-2) forEach도 중첩이 되어서 2단부터 9단까지 가능하다고 하셔서 해봄 -->
			
			<c:forEach begin="2" end="9" step="1" var="outnumber">
				<h1><c:out value=" ${outnumber}단 "></c:out></h1>
				
				<c:forEach begin="1" end="9" step="1" var="number">
					${outnumber } * ${number } = ${outnumber *number} </br>
				</c:forEach>
				<c:out value="---------------"></c:out><br/> 
				
			</c:forEach>
	


</body>
</html>