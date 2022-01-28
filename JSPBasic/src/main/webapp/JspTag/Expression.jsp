<!-- 표현식 Expression

	필수는 아니지만, 코드 가독성적인 측면에서 사용하는 기능.
	

	out.println 적기 귀찮을때 사용 ㅎ


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
	
	<!-- 하단에 선언부를 선언해주신 다음, double을 선언하는 areaCircle 메서드를 정의해주세요
	이 메서드는 r 변수에 double 타입으로 원주율을 입력 받고
	r의 제곱 * Math.PI(원주율)을 곱해 원 넓이를 리턴합니다.
	 -->
	 
	 
	<%!
		double areaCircle(double r){
			return r * r * Math.PI;
		}
	%>
	
	<!-- scriptlet은 main method처럼 동작합니다. -->
	
	<%
		String name = "김철수";
		int age = 44;
		out.println("이름 : " + name + "<br/>");
		out.println("나이 : " + age + "<br/>");
		out.println(areaCircle(5) + "<br/>");
	%>
	
	
	이름 : <%= name %><br/>
	나이 : <%= age %>세<br/>
	반지름 5인 원넓이 : <%= areaCircle(5) %>cm^2
	
</body>
</html>