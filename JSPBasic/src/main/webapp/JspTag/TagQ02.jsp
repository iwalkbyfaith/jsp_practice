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
		
		int num = 0;
		int num(){
			if(num == 10){
			return num = 1;
			}else{
			 return ++num;
			}
		}
		
		// 랜덤 구구단
		int ranNum;
		int ranNum(){
			return ranNum = (int)(Math.random()*8)+2;
		}	
	%>
	
	
	 
	<p>페이지 누적 요청수 : <%=++totalNum %></p>
	<p>매 <%=num()%>번째 방문자에게는 기프티콘을 드립니다. <p>
	<% if(num==10){
		out.println("당첨되셨습니다!");	
	}
	%>
	
	<h2>랜덤 구구단 <%=ranNum() %>단</h2>
	<p>이번에 나올 구구단은 <%=ranNum%>단 입니다.</p>
	
	<% 
	 for(int i=1; i<10; i++){
		 out.println(ranNum + " * " + i + " = " + ranNum*i + "<br/>");
	 }	
	%>
	 
	
	
	
	


	
	
	
</body>
</html>