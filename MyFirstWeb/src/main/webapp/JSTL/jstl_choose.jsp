<!-- 조건문(choose) 태그

	c:choose
	
	오늘 오답노트 적을 것 !
	
		(문제) param.lang eq '자바'} "> => 이렇게 된 상태에서 자꾸 php만 나옴
		
		잘못 넘어갔나 싶어서 페이로드 확인-> 제대로 되었음
		
		(원인) 중괄호를 닫고 큰 따옴표를 적는 과정에서 띄어쓰기가 하나 들어가서 발생한 일! 주의주의!
			  이건 lang = "true " <- 이렇게 한 것과 비슷한 느낌. 
		(해결) param.lang eq '자바'}">  => 이렇게 바꾸었더니 정상적으로 나옴
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- c태그 라이브러리 쓸 수 있도록 지시자(디렉티브)를 작성해주세요. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 인코딩 -->
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${param.lang eq '자바'}">
			자바로 개발합니다
		</c:when>
		<c:when test="${param.lang eq '파이썬'}">
			파이썬으로 개발합니다.
		</c:when>
		<c:otherwise>
			php로 개발합니다.
		</c:otherwise>	
	</c:choose>



</body>
</html>