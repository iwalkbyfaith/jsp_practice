<!-- 버스카드 판독기 (주는) -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부릉부릉 버스타기</title>
</head>
<body>
	<!-- 이미지 경로 이렇게 작성해도 됨
		<img src="./repository/4. driver.jpg"/>
		.(점) 은 현재 내가 위치해 있는 폴더을 의미(=4.objecttest)
	 -->
	<img src="repository/4. driver.jpg" width="500px" height="300px"/>
	<form action="bus_check.jsp">
		당신의 나이는? <input type="number" name="age" placeholder="나이를 입력하세요"/>
		<input type="submit" value="삐빅"/>	
	</form>

</body>
</html>