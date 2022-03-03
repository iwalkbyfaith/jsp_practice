<!-- get 결과 페이지

	bananaform.jsp -> ServletCustom.java -> bananaResult.jsp

	1) bananaResult.jsp에서 서버를 켜서 주소(http://localhost:8181/MyFirstWeb/servletForm/bananaResult.jsp) 복붙
	2) ServletCustom의 sendRedirect 괄호 안에 주소를 넣어줌
		2-1) 리다이렉트의 특성 : (세션이랑 쿠키는 원래 전달이 되던거니까 차치하고) 페이지의 이동이 일어나면 메모리 공간이 비워진다.
							 그렇기 때문에 폼.jsp에서 커스텀.java로 보냈어도 바나나폼 내부에 있는 데이터가 사라진다.  
							 ==> 서블릿커스텀.java에서 받은 데이터를 바나나리절트.jsp로 리다이렉트시 전달해주지 않는다는 말임.
							 ==> 리다이렉트는 단지 '페이지만 이동'하는 기능일 뿐임.
	
	3) 따라서 해당 페이지 내에 선언 구문이 없는 자료 출력시는 EL을 사용한다. (EL 쓴다고 바로 자료 출력이 되는건 아님)
	4) 전송하기 위해서 사용하는게 fowarding(포워딩)★ <JSP 9회차> : 페이지가 이동하면서 동시에 선언되어 있던 변수들도 같이 넘어가는 형식.
	5) 
	
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

	<!-- 표현식 대신 EL 사용 -->
	<h1> ServletCustom을 통해 건너온 페이지입니다.</h1>
	<p> jsp 변수에 들어 있던 값 : ${jsp}</p>
	<p> boot 변수에 들어 있던 값 : ${boot}</p>
	<p> jpa 변수에 들어 있던 값 : ${jpa}</p>

</body>
</html>