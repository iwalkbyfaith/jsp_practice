<!-- GET 방식 / POST 방식
	
	<GET 방식>
	사용하는 URL에 ?(물음표)를 붙여서 입력한 내용이 전달되었음을 주소에 안내해줌

	id = idisid
	password = qwer 
	
	입력하고 제출 버튼을 누르면 주소창에 아래와 같이 붙는다.
	http://localhost:8181/JSPBasic/Formstudy/Formtest.jsp?id=idisid&password=qwer#

	(문제) get 방식은 방문기록에서 확인해보면 주소 히스토리에서 계속 볼 수 있어서 보안에 취약하다. (아디,비번이 다 뜨니까)
	중요한 개인 정보는 get 방식을 사용하면 안되지만, 검색 기록같은 것은 사용해도 됨.
	
	기록이 남기 때문에 다음에 검색할때 더 빨리 됨
	주소창에다가 입력을해도 잘 실행됨. (ex 네이버 검색창 말고 주소창에 입력해도 잘 실행됨)
	
	
	<POST 방식>
	아이디 비밀번호처럼 민감한 정보를 전송할 때 주로 사용한다.
	URL 뒤에 추가되지 않는다.
	ex) 아디 / 비번 / 카드번호 / 주민번호 등등
	주소창을 이용할 수 없고 반드시 form 태그 내에서 사용해야함.

 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 테스트</title>
</head>
<body>
	<h1>회원 가입 양식</h1>
	<form action="#" method="get">
		<input type="text" name="id" placeholder="아이디"/><br/>
		<input type="password" name="pw" placeholder="비밀번호"/><br/>
		<input type="submit" value="제출"/>
	</form>
	
		<h1>회원 가입 양식2</h1>
	<form action="#" method="post">
		<input type="text" name="id" placeholder="아이디"/><br/>
		<input type="text" name="pw" placeholder="비밀번호"/><br/>
		<input type="submit" value="제출"/>
	</form>

</body>
</html>