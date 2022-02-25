<!-- EL(Expression Language) 표현언어

	바디태그 내부에 스크립트릿 없이 생성하면 된다.
	
	문법 : ${value}
	
	중괄호 내에 있는 값만 출력됨
	오류 저항성이 강함 ( 없으면 없는대로 출력 )
	스프링에서도 많이 사용함.


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

	<!-- 정수/실수 -->
	${10}<br/>
	${3.14 }<br/>

	<!-- 문자 -->
	${"hello" }<br/>
	
	<!-- bool 자료형까지 출력 가능 -->
	${true }<br/>
	
	<!-- a를 따옴표 없이 쓰면 변수명으로 쓰는 것. 근데 지금은 변수 a가 없음
		 a가 없으면 에러가 나는 것이 아니라, 그냥 0으로 간주함. 출력값 = 20  -->
	${a + 20 }<br/>
	
	<!-- 내용 없으면 출력 안함 -->
	${a }<br/>
	
	<!-- 아무것도 안 넣으면 0으로 간주하기 때문에 0 < 10 => 근데 왜 false 출력?!?! -->
	${a < 10 }<br/>

	<!-- 삼항 연산자 -->
	${(a == 15)? "a는 15와 같다" : "a는 15와 다르다" }<br/>
	
	<!-- or도 됨 -->
	${(a > 10) || (a != 15) }<br/>
	


</body>
</html>