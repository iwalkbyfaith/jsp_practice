<!-- response 기초 <미성년자 체크하기> (주는)

	
 
	form 태그를 하나 만들어주세요
	목적지는 res_check.jsp이고 method는 get 방식입니다.
	input 태그로 나이를 입력받고, 제출 버튼에는 "확인"이라고 적혀있습니다.


-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미성년자 체크</title>
</head>
<body>
	
	<form action="res_check.jsp" method="get">	
		<input type="number" name="age" placeholder="나이를 입력하세요"/>
		<input type="submit" value="확인"/>
	</form>



</body>
</html>