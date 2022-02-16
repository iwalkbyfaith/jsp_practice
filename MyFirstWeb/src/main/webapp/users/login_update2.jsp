<!-- 회원가입로직 8) 정보 수정 폼

	Update의 경우는 update_check.jsp로 자료를 보내야 하는데
	보통 정보 수정을 하는 경우는, 미리 회원 정보가 form에 기입되어 있는 경우가 많습니다.
	먼저 폼 양식은, 아이디 없이 비밀번호는 비어 있고, 
	name, email은 DB에 있던 정보가 채워진 상태로 창이 열리게 만들겠습니다.
	폼만 완성시켜 보내주세요
	
	→ value="값"을 이용해서 값이 미리 들어올 수 있도록 처리할 수 있다.
	  DB에서 데이터를 얻어와서 넣어주면 되겠지.
	  
	★input 태그에서 value 속성을 이용하면 기본으로 채워질 값을 지정할 수 있습니다.
	밑의 문제는 로그인할때 만든 세션으로 발급하면 더 편하겠지만, 보통 셀렉트 구문으로 구현함. (데이터를 땡겨서 폼에 넣어놔야하기 때문에)
	
	★★도대체 value안에 변수가 안들어가서 구글링하고 난리쳤지만 어떻게 하는지 나오지 않았는데 답은 표현식에 있었음.
	만든 변수는 자바코드이기 때문에 바디 태그 안에서는 표현식 안에 사용해줘야 하는 것이었음..! (기억기억!) 
	
	4번 조건. 혹시나 데이터가 안들어왔을 상황을 대비해 rs.next()는 if문에 조건절에 넣어서 실행하는 것을 권장한다고.
	if 블럭 안에서 변수가 사라질까봐 걱정이 되면 상위 지역에서 선언해주면 됨.
	
	Q) 데이터를 미리 들어오게 하는 경우가 뭐가 있을까?
		A) 예를들면 이메일, 게시판에 썼던 글을 수정할 때 본문의 내용이 그대로 들어와있는 경우.(아무것도 없으면 대략난감?)
		   ★ 이것이 SELECT문을 가져와서 UPDATE를 사용해야하는 이유(사용자 편의)

-->

<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! UserVO user = null;%>
	<% 
		String sessionId = (String)session.getAttribute("session_id");
	
		// 로그인 안 한 사람이 해당 주소를 얻어서 접속한 경우
		//if(sessionId == null){
		//	response.sendRedirect("login_form.jsp");
			
		UserDAO dao = new UserDAO();
		user = dao.getUserData(sessionId);
	
		
	
	%>
	
	<h1><%=user.getuName() %>(<%=user.getuId() %>)님의 정보를 수정합니다.</h1>
	<form action="update_check.jsp" method="post">
		<input type="password" name="pw" placeholder="수정할 비밀번호" required/><br/>
		<input type="text" name="name" placeholder="수정할 이름" value=<%=user.getuName()%> required/><br/>
		<input type="email" name="email" placeholder="수정할 이메일" value=<%=user.getuEmail()%> required/><br/>
		<input type="reset" value="초기화"/>
		<input type="submit" value="수정하기"/>
	</form>
	

	
</body>
</html>