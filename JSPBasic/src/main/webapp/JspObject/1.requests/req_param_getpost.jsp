<!-- 받는 입장

	req_param_send의 내용을 받아서 처리하도록 만든다.
	처음에는 null이라고 나오지만 주소창 맨 뒤에 ?apple="가나다라" 를 입력해주면 '전송 받은 아이디 : 가나다라' 라고 화면에 출력된다.
	
	원래는 아이디 비밀번호를 get방식으로 오픈하면 안되지만 지금은 공부하는 단계이니까
	
	checkbox로 전송하면 그냥 'on'이라고만 나온다.
	value="해당항목"으로 제대로 넘어갈 수 있도록 만들어줌. 근데 문제는 하나만 넘어감 ㅠ
	
	

 -->


<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// name "apple"에 딸려온 데이터 조회
	// get 방식으로 전달 받은 아이디를 확인할 수 있음.
		String id = request.getParameter("apple");

	// name "banana"에 딸려온 데이터를 변수 pw에 저장 후, body에 출력해보세요.
		String pw = request.getParameter("banana");
	
	// checkbox에 딸려온 데이터를 변수 hobby에 저장 후 body에 출력해보세요.
		String[] hobby = request.getParameterValues("hobby");
	
	// 전공
		String major = request.getParameter("major");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	전송 받은 아이디 : <%=id %><br/>
	전송 받은 패스워드: <%=pw %><br/>
	
	<hr/>
	전송 받은 취미(방법1): <%= Arrays.toString(hobby) %>
	<br/>
	전송 받은 취미(방법2) : 
	<% for(String name : hobby){ %>
		<%=name %>&nbsp;
	<%} %>
	<hr/>	
	
	전송 받은 전공 : <%=major %>

</body>
</html>