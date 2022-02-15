<!-- 지시자

	자바에서 import 구문을 이용해 사용하던 클래스들은 JSP 파일에서도 역시 import 구문을 써야 합니다.
	지시자(Directive)의 경우 @를 사용하여 기술하여 문서 자체에서 사용할 설정이나 옵션을 지정합니다.


 -->


<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    // 날짜 얻어오기
    Date date = new Date();
    
    // 리스트 만들기
    List<String> names = new ArrayList<>();
    
    // 이름 4개를 추가해보세요.
    names.add("가가");
    names.add("나나");
    names.add("다다");
    names.add("라라");
    
    
    out.println(names.toString() + "<br/>");
    out.println(names.get(0) + "<br/>");
    
    out.println(date.getDate() + "<br/>");
    
    
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