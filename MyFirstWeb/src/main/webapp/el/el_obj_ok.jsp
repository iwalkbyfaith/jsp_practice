<!-- EL 기초 실습 2) 폼 데이터 받기

	body 태그 내에 표현식을 이용해
	el_obj.jsp에서 보낸 자료를 표출해주세요.
	
	(새로운 내용) 파라미터값을 EL로 처리하기
		★ 스크립트릿 안에서 이제 파라미터를 받지 않아도 사용 가능하게 되는 것!

 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//request.setCharacterEncoding("utf-8");
	//String name = request.getParameter("name");
	//String nName = request.getParameter("nName");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%-- 
	이름 : <%=name %> <br/>
	별명 : <%=nName %>  --%>	
	
	<hr>
	● EL식으로 출력하기
	<!-- parameter로 들어오는 것을 이렇게 받을 수 있음! -->
	이름 : ${param.name}
	별명 : ${param.nName}

</body>
</html>