<!-- 회원가입 (받는) 

	★ 폼에서 날라오는 데이터들은 숫자로 기입했더라도 무조건 문자열로 오게됨.
	계산이 필요한 경우는 int나 double로 변환하는 parseInt이런거 써야겠지 
	
	(문제) 이름에 '한글'을 넣으면 깨져나온다 (get 방식은 안 깨짐)
	(해결) JSP 3회차 파일에 있는
	request.setCharacterEncoding("utf-8");
	이 코드를 스크립틀릿 안에 넣어주면 된다.
	

-->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// post 방식으로 전송된 한글이 깨지는 경우 한 줄 아래 코드로 인코딩한다.
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%if(id.equals("abcd")){ %>
	<h1><i>중복된 아이디로 가입할 수 없습니다.</i></h1>
	<a href="req_join_form.jsp">뒤로가기</a>
	<%}else{ %>
	<h2><%=id %>(<%=name %>)님 회원가입을 축하드립니다.</h2>
		<hr>
		<h3>입력 정보를 확인하세요</h3>
		아이디 : <%=id %><br/>
		비밀번호 : <%=pw %><br/>
		이름 : <%=name %><br/>
		나이 : <%=age %><br/>
		<hr>
	<%} %>
		

</body>
</html>