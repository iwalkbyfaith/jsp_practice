<!-- 세션 생성(연결)

	세션에 저장된 데이터는 브라우저 창이 종료될 때까지, 혹은 세션의 유효시간이 만료되기 전까지
	웹 어플리케이션의 모든 JSP페이지에서 사용할 수 있습니다.
	
	세션에 저장된 데이터를 가져오려면 session 객체의 getAttribute() 메서드를 사용하며,
	매개 값으로 가져올 데이터의 세션 이름을 적어줍니다.
	(request.getParameter와 유사함)	
	
	
	session_insert.jsp / session_check.jsp
		1. 사용자 브라우저에서 session.insert 페이지에 접속하면 순서대로 코드를 실행하여
		2. 서버의 세션 영역(세션 스토리지)에 .setAttribute로 입력된 데이터들을 저장한다.
		3. .setMaxInactiveInterval을 사용해서 세션 시간을 설정한다.
		4. 화면에 표출		
		
	세션은 쿠키와 달리 서버에 저장되는 것이기 때문에 우리가 쿠키설정에서 컨트롤 할 수 없다.
		
		


 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	
	// 유저 아이디에 "id_session"의 값을 저장하기 => ("abc1234")
		// String userId = session.getAttribute("id_session"); => 오류
		// ★우항을 String으로 바꿔주는 작업이 필요.
		// out.println을 했을때 이름이 아니라 값이 나온다는 것이 핵심
	String userId = (String)session.getAttribute("id_session");
	out.println(userId + "<br/>");
	
	// 나머지 세션도 화면에 표시해보세요.
		String userId2 = (String)session.getAttribute("name_session");
		String userId3 = (String)session.getAttribute("JSP");
		out.println(userId2 + "<br/>");
		out.println(userId3);
		out.println("<hr/>");
		
	// 세션의 유효시간은 아래의 메서드를 사용합니다.
	// 기본 시간은 30분으로 세팅되어 있고(디폴트) 바꾼다면 초단위로 바꿀 수 있습니다.
		session.setMaxInactiveInterval(1800);
		//10초로 세팅하고 페이지를 새로고침하면 위의 3개의 값들이 null로 변함.
		
		// getMaxInactiveInterval()로 남은 시간 조회 가능
			int sTime = session.getMaxInactiveInterval();
			out.println("세션의 유효시간 : " + sTime + "초<br/>");
			out.println("<hr/>");
	
			
			
			
	// 특정 세션 데이터만 삭제하기 =>  .removeAttribute
		userId2 = (String)session.getAttribute("name_session");
		out.println("name_session 삭제 전 : " + userId2 + "<br/>");
		
		// 특정한 세션만 삭제시는 removeAttribute("세션이름");을 이용해 삭제합니다.
		// name_session 삭제 후 삭제가 잘 되었는지 화면에 찍어서 확인까지 해보세요
			session.removeAttribute("name_session");
		
			userId2 = (String)session.getAttribute("name_session");
			out.println("name_session 삭제 후 : " + userId2 + "<br/>");
		
			
			
			
	// 세션 일괄적으로 삭제하기 (localhost:8181에서 발급한 세션만 삭제됨. 네이버X다음X)
		userId = (String)session.getAttribute("id_session");
		out.println("id_session 삭제 전 : " + userId + "<br/>");
		
		userId3 = (String)session.getAttribute("JSP");
		out.println("JSP 삭제 전 : " + userId3 + "<br/>");
		
		// 모두 삭제하기
		session.invalidate();
		
		// 유효 세션 존재 여부 조회하기 => request.isRequestedSessionIdValid()
		if(request.isRequestedSessionIdValid()){
			out.println("유효한 세션 존재");
		}else{
			out.println("세션이 파기되어 조회할 수 없습니다.");
		}
		out.println("<hr/>");
		
		
		// 삭제 되었는지 확인하기 (이렇게 하니까 500에러 떠서 위처럼 if문 사용)
		//userId = (String)session.getAttribute("id_session");
		//out.println("id_session 삭제 후 : " + userId + "<br/>");
		//userId3 = (String)session.getAttribute("JSP");
		//out.println("JSP 삭제 후 : " + userId3 + "<br/>");
	


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>