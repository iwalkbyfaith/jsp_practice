<!-- 선언 Declaration
	
	문법 : <%! %>
	선언부는 아래와 같이 스크립트릿에 !을 하나 더 붙여서 작성합니다.
	선언부 내부에 변수나 메서드를 정의해뒀다 사용할 수 있습니다
	
	★ 스크립트릿은 일종의 메인메서드처럼 기능하기 때문에, 스크립트릿 안쪽에 메서드 선언할 수 없음
	(메서드 내부에 메서드를 선언할 수 없으니까)

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
		public int i=10;
	
		public String str = "안녕하세요";
		
		int add(int n1, int n2){
			return n1+ n2;
		}
	
	%>
	
	<%

		int result = add(10, 5);
		out.println("10 + 5 = " + result + "<br/>");
		out.println("16 + 14 = " + add(16,14) + "<br/>");
		out.println(result);
	
	%>
	
</body>
</html>