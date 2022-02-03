<!-- request 객체 관련 주요 메서드 
	
	사용자가 어떤 경로로 어떻게 접속 했는지의 정보를 알 수 있음
	당장 중요한 내용은 아님.
	
	내장 객체 = 내부에 이미 생성된 객체
	
-->


 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String protocol = request.getProtocol();
	String conPath = request.getContextPath();
	StringBuffer reqUrl = request.getRequestURL();
	String reqUri = request.getRequestURI();
	int serverPort = request.getServerPort();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	요청 프로토콜 : <%= protocol %><br/>
	요청 컨텍스트 경로 : <%= conPath %><br/> <!-- 프로젝트명 -->
	요청 URL : <%=reqUrl %> <br/>
	요청 URI : <%=reqUri %> <br/>
	서버 포트 : <%=serverPort %>
</body>
</html>