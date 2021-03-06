<!-- 문제 


	행운의 숫자 : 1 ~ 10
	색은 1/3 확률 (빨 노 파)

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
		// Declaration 내부에 1부터 10 범위의 난수를 리턴하는 메서드 int randomNumber를 선언
		int randomNumber(){
			// 정수 1~10까지 발생시켜서 리턴하도록 로직 작성
			int num = (int)(Math.random()*10)+1;
			return num;
		}
	
		String randomColor(){
			int num = (int)(Math.random()*3)+1;
			if(num==1){
				return "빨강";
			}else if(num==2){
				return "노랑";
			}else{
				return "파랑";
			}
		}
	
		// ★ declaration에 선언한 변수는 '서버를 끄기 전까지'(빨간 네모 버튼 누르기 전까지는)는 값이 누적됩니다.
		// 서버가 켜지면 딱 한번 실행.
		// 스크립틀릿 외부에 있기 때문에 새로고침해도 초기화 될 일이 없음.
			// 스크립틀릿은 일종의 메인메서드처럼 기능하기 때문에, 
			// 스클립틀릿 밖에 있는 변수 total는 일종의 static 변수처럼 처리되는 것.
		public int total = 0;
		
		
	%>

	
	<!-- 표현식. 행운의 숫자 -->
	<h3>오늘의 행운의 숫자와 행운의 색깔</h3>
	<p>행운의 숫자는 1~10 범위입니다.</p>
	<p>행운의 숫자 : <b><%=randomNumber()%></b></p>
	
	<p>색깔은 1/3확률로 바뀝니다(빨강, 노랑, 파랑) </p>
	<p>행운의 색깔 : <b><%=randomColor()%></b></p>
	
	<h3> 오늘의 방문자수</h3>
	
	<%
		// 변수 total은 declaration에 선언되었기 때문에 새로고침할때마다 값이 누적된다.
		out.println("선언자에서 선언한 변수 total : " + ++total);
		
		// 스크립틀릿 내부에 선언한 변수는 '접속시'마다 초기화된다.
		// 즉 새로고침할때마다 변수 currntNum이 사라졌다가, 생성 + 초기화되고 전위수식으로 +1되는 구조.
		int currentNum =0;
		out.println("<br/>");
		out.println("스크립틀릿에서 선언한 변수 crruntNum : " + ++currentNum);
	%>
	
	
</body>
</html>