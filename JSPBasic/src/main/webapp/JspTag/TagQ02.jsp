<!-- 문제

	결과 페이지처럼 만들기
	
	페이지 누적 요청수 : 숫자
	10번째는 당첨됨.

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
	
	<%!
		// 방문자수
		int totalNum = 0;
		int num(){
			int num = 0;
			if(num > 10){
			return 1;
			}else{
			 return num+=1;
			}
		}
	%>
	
	
	 
	<p>페이지 누적 요청수 : <%=++totalNum %></p>
	<p>매 <%=num()%>번째 방문자에게는 기프티콘을 드립니다. <p>
	
	
	


	
	
	
</body>
</html>