<!-- 여행지 선택 (주는)

	form 태그 만들어주시고 목적지는 travel_check.jsp, post방식
	라디오 버튼 최소 4개

 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가고싶은 여행지들</title>
</head>
<body>
	
	<h3>가고 싶은 여행지를 선택하세요</h3>
	<form action="travel_check.jsp" method="post">
		<input type="radio" name="travel" value="india"/>인도
		<input type="radio" name="travel" value="bali"/>발리
		<input type="radio" name="travel" value="yangyang"/>양양
		<input type="radio" name="travel" value="jeju"/>제주
		
		<input type="submit" value="고고싱"/>	
	</form>


</body>
</html>