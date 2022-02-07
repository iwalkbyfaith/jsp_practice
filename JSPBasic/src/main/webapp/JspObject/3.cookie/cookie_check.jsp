<!-- 쿠키 만들기 (가져오기)
	



 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	// 저장된 쿠키 가져오기
	Cookie[] cookies = request.getCookies();

	String str = null;
	
	boolean flag = false;
	
	// 향상된 for문을 이용하는 것이 더 좋았을 것.
	for(int i=0; i< cookies.length; i++){
		// 쿠키 이름을 얻어오는 메서드
		str = cookies[i].getName();
		System.out.println(str);
		
		if(str.equals("peanut_cookie")){
			out.println("땅콩 쿠키가 존재합니다. <br/>");
			String value = cookies[i].getValue();
			out.println("저장된 자료는 " + value + " 입니다.");
			flag = true;
			break;
		}
	}
	if(!flag){
		out.println("땅콩 쿠키가 사라졌습니다. <br/>");
	}


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