<!-- 보내는 입장

	아래에 form을 만들고 내부에 input 4개를 만들어주세요.
	input 태그의 type 속성은 하나는 text, password name 속성은 하나는 apple, 하나는 banana로 해주세요.
	reset 버튼과 submit 버튼도 각각 하나씩 만들어주세요.

	form의 action이 바로 목적지를 적는 부분.
	웹개발에서는 받을 페이지 화면의 주소를 적어줍니다.
	
	param = parameter 인듯?

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
	
	<!-- 보내는 입장 -->
	<!-- method를 아예 안 적으면 get방식으로 적용이 됨. -->
	<form action="req_param_getpost.jsp" method="get">
		<input type="text" name="apple" placeholder="apple"/><br/>
		<input type="password" name="banana" placeholder="banana"/><br/>
		
		취미 : 
		<input type="checkbox" name="hobby" value="요리">요리&nbsp;
		<input type="checkbox" name="hobby" value="독서">독서&nbsp;
		<input type="checkbox" name="hobby" value="요가">요가&nbsp;
		<input type="checkbox" name="hobby" value="조깅">조깅&nbsp;
		<input type="checkbox" name="hobby" value="복싱">복싱&nbsp;
		<br/>
		
		<!-- name, value 각각. radio 4개 -->
		전공 :
		<input type="radio" name="major" value="컴공">컴공&nbsp;
		<input type="radio" name="major" value="언론">언론&nbsp;
		<input type="radio" name="major" value="경제">경제&nbsp;
		<input type="radio" name="major" value="산디">산디&nbsp;
		<br/>
		
		
		<input type="reset" value="초기화"/>
		<input type="submit" value="전송"/>
	</form>
	
	



</body>
</html>