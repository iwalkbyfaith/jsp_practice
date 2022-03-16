<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% // 03.16 추가 (스크립트릿을 활용한 로그인 확인)

	String sId = (String)session.getAttribute("session_id");

	// 로그인이 안됐을때 확인하기 위한 sysout. 로그인 안하면 null로 나옴.
	System.out.println("메인 페이지로 들어온 세션아이디 -> " + sId);
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>안녕하세요 메인 페이지입니다</h1>
	<h2> web.xml 내부 welcomepage 설정에 index.jsp라고 적혀 있어서</h2>
	<h2>이 페이지가 메인으로 자동 설정 됩니다. </h2>
	<h2>여러분이 welcomepage 설정을 고쳐서 index.jsp가 아닌 </h2>
	<h2>다른 임의의 명칭을 메인 페이지로 만들어 줄 수도 있습니다.</h2>
	
	
	<!-- 03.16 주소 변경 (이전 : http://localhost:8181/MyFirstWeb/boardlist ) -->
	<a href="http://localhost:8181/MyFirstWeb/boardList.do">게시판 입장하기</a><br/><br/>
	
	<!-- 03.16 추가 (로그인 폼 자체를 메인 페이지에 만드는 방법도) 
		발급된 세션 아이디가 없으면(로그인을 안했으면) 로그인, 회원가입창을 보여준다.
		스크립트릿을 안쓰고 포워딩으로 보내면 c:set안해도 되지만 지금은 해야함
	-->
	<hr/>
	방법1) 스크립트릿 내부에 있는 변수를 EL 변수로 선언해줌
	<c:set var="sId" value="<%=sId%>"/>
	세션값 -> ${sId}<br/>
	
	디버깅 -> (태그 없이 EL을 이용해서 바깥쪽으로 표시할 수 있음)
		${sId eq 'null'} (eq 'null')<br/>
		${sId eq null}(eq null)<br/>
		${empty sId} (empty sId)<br/>
	<hr/>
	
	<!--  방법2) 세션에 있는 것을 출력.
	${sessionScope.session_id}
	c:if test="${sessionScope.session_id eq null}"> 이런식으로 아래 코드 채우면 되겠지 -->
	<hr/>
	
	<c:if test="${sId eq null}"> 
		<a href="http://localhost:8181/MyFirstWeb/users/login_form.jsp">로그인</a>
		<a href="http://localhost:8181/MyFirstWeb/users/join_form.jsp">회원가입</a>
	</c:if>
	
	<!-- sId가 있으면(로그인 완) 로그아웃 버튼 보여주는 코드 -->
	<c:if test="${sId ne null}">
		<a href="http://localhost:8181/MyFirstWeb/users/logout.jsp">로그아웃</a>
	</c:if>
	
	
	
</body>
</html>