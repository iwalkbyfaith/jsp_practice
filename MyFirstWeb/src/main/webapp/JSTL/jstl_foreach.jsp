<!-- 반복문 forEach 

	begin 시작값
	end   끝값(이 값이 포함됨)
	step  증가숫자 (안주면 자동으로 1 들어감)
	var   태그 내에서 쓸 변수명 ( 밑의 number는 i의 경우라고 생각 )
	
	
	- 변수에 문자열 저장하기
	    	 
	- s:set과 c:forEach를 사용해서 향상된 for문처럼 이용하기
	
		forEach  : began, end, step => 일반 for문으로 사용
	    		 : var, items       => 향상된 for문으로 사용
	
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
		
		<!--  선생님은 forEach의 안쪽을
			
			<c:out value="${dan} x ${hang} = ${dan * hang}"/> <br/>
			c:out을 써서 처리하심.
		
		 -->
		 
		 <hr>
		 
		 
		 <h1>숫자가 아닌 요소를 반복하는 JSTL</h1>
		 
		 <%-- arr변수 내에 과일 다섯개의 이름을 배열로 저장하는 구문 --%>
		 <c:set var="arr" value='<%= new String[] {"사과", "딸기", "망고", "바나나", "포도"}%>'/>
		 
		 <%-- c:forEach는 향상된 for문처럼 쓸 수도 있다 --%>
		 <c:forEach var="i" items="${arr }">
		 	${i } &nbsp;
		 </c:forEach>
		 
		 	<%-- 위의 코드는 아래의 구문과 같다
		 		String[] arr = {"사과", "딸기", "망고", "바나나", "포도"};
		 		for(String i : arr){
		 		out.println(i + "&nbsp;");
		 		}
		 	 --%>
		 
		 	<%-- forEach : began, end, step => 일반 for문
		 				 : var, items       => 향상된 for문 --%>
		 				 
		 <hr>	
		 <!-- (문제) int 배열에 10, 20, 30, 40, 50을 넣어주시고
		 			forEach문을 이용해 화면에 출력해주세요 -->
		 			
		 	<c:set var="arr" value='<%= new int[]{10, 20, 30, 40, 50} %>'/>
		 	<c:forEach var="num" items="${arr }">
		 		${num } &nbsp;
		 	</c:forEach>
	


</body>
</html>