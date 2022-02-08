<!-- application

	application은 application 객체를 사용해서 저장하거나 데이터 값을 받아올 수 있습니다.
	
	getAttribute() 메서드와 setAttribute() 메서드를 사용할 수 있고
	application에 한 번 저장된 객체는 서버 종료 전까지 계속 유지됩니다.

	아래의 코드를 크롬, 네이버웨일 등 서로 다른 브라우저로 켜도 방문자수가 유지됨.

 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// 새로고침하면 visitCnt는 계속 초기화됨
	int visitCnt = 0;

	// 아직 .setAttribute로 visit을 만든적이 없기때문에 temp에는 처음에 null이 들어간다.
	Integer temp = (Integer)application.getAttribute("visit");
		if(temp != null){
			visitCnt = temp;
		}
	visitCnt++;
	
	application.setAttribute("visit", visitCnt);


%>

<hr>
	<h3> 방문자수 : <%=visitCnt%></h3>
<hr>