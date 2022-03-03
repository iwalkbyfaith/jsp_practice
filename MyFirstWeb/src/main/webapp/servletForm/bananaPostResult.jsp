<!-- post 결과 페이지 

	bananaform.jsp -> ServletCustom.java -> bananaPostResult.jsp

 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> bananaform.jsp에서 post 방식으로 날려 ServletCustom.java를 통해 도착한 페이집니다</h3>
	<p> jsp 변수에 들어 있던 값 : ${jsp }</p>
	<p> boot 변수에 들어 있던 값 : ${boot } </p>
	<p> jpa 변수에 들어 있던 값 : ${jpa } </p>

</body>
</html>