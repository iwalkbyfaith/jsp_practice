<!-- 회원가입 (주는)

	req_join_form.jsp를 만들어주세요
	req_join_result.jsp로 데이터를 전달해줍니다.
	
	form 태그 내에는 아이디, 비밀번호, 이름, 나이를 입력할 수 있는 폼태그가 있고
	
	submit 버튼의 이름은 회원 가입하기
	reset 버튼의 이름은 초기화하기 입니다.
	
	req_join_result.jsp는 전달 받는 4개 정보를 활용하되
	만약 아이디가 "abcd"인 경우는 "중복된 아이디로 가입할 수 없습니다."
	이외의 경우는 "아이디(이름)님 회원가입을 축하드립니다." 라고 결과 나오게
	
	
	지금은 DB가 없어서 그냥 껍데기만 만드는 거임



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

	<h2>회원 가입 페이지</h2>
	<form action="req_join_result.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"/><br/>
		<input type="password" name="pw" placeholder="비밀번호"/><br/>
		<input type="text" name="name" placeholder="이름"/><br/>
		<input type="number" name="age" placeholder="나이"/><br/>
		
		<input type="reset" value="초기화하기"/>
		<input type="submit" value="회원 가입하기"/>
	
	</form>

</body>
</html>