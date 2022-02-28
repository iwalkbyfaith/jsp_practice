<!-- JSTL 기본 

	페이지 내부에서 JSTL 태그를 쓰고 싶다면 디렉팁브를 통해 taglib 선언을 해야합니다.
	
	body 태그 내에서 <c 만 입력해도 이제 자동 완성이 됨 (코어 태그 라이브러리)
	c = core의 약자
	
	
-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 여기에 지시자 태그로 입력 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 인코딩 처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 자바에서는 중괄호로 여닫았는데, 이제는 태그 여닫는 것으로 표현 -->
		<c:if test="${param.name == '홍길동' }">
			<p> name 파라미터로 들어온 값은 ${param.name }입니다 </p>
			
			<%-- c태그라이브러리의 out을 사용하면 value="출력할값"형태로 out.println()등을 대체합니다. --%>
			<c:out value="name 파라미터로 들어온 값은 ${param.name }입니다"></c:out>
			<% out.println("name 파라미터로 들어온 값은 ${param.name }입니다"); %> <!-- 와 같음 -->
			
		</c:if>
	
	
	<!--  name 파라미터에 이순신이 들어오면 name 파라미터로 들어온 값은 이순신입니다.
	      라고 출력하도록 아래쪽에 직접 한 번 작성해서 저한테 보내주세요. 
	      
	      ★ 문자같은 경우는 eq 를 사용해서 비교 가능.
	      -->
	
		<c:if test="${param.name eq '이순신' }">
			<p> name 파라미터로 들어온 값은 ${param.name }입니다. </p>
		</c:if>	
		
		<hr/>
		
	<!-- 두 경우가 아니라면 변수로 받아줌 -->
		
		<%
			// 스크립트릿 내부에서는 el이 인식되지 않습니다.	
			// String fname = request.getParameter("name");
			// 아래의 변수 선언한 것과 같은 효과를 낸다.
		%>
		
		<!-- 변수 선언 : 변수를 선언하는데 스크립트 대신 c:set을 사용 -->
		<c:set var="fName" value="${param.name }"/>
		
		당신이 입력한 값은 ${fName}입니다. <br/>
		
		<!-- 위의 코드를 c:out을 써서 출력하도록 작성해서 보내주세요 -->
		<c:out value="re 당신이 입력한 값은 ${fName}입니다."/>
		
		
	




</body>
</html>