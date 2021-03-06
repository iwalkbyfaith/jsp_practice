
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!-- 아니면 java.util.*로 전부 다 지정해도 됨. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	List<Integer> lotto = new ArrayList<>();
	while(true){
		// contains(): 리스트 내부에 해당 객체가 존재하면 true를 리턴
		int ranNum = (int)(Math.random() * 45) +1;
		
		if(!lotto.contains(ranNum)){
			lotto.add(ranNum);
		}
		if(lotto.size() == 6){
			break;
		}
	}
	
	// 리스트의 오름차 정렬 방법
	Collections.sort(lotto);
	%>


	
	<h1>로또 번호 생성 결과</h1>
	<p> 이번 주 로또는 이 번호다!! <br>
	
	<%
	for(Integer num : lotto){
		out.println(num + "&nbsp;");
		// cpu를 잠시 멈추는 메서드 (0.7초동안 기다렸다가 출력)(★기다리기)
		Thread.sleep(700); 
		// 브라우저의 출력 버퍼를 비우는 메서드 (★출력하기/ 시각적 이팩트를 위한.)
		out.flush(); 
	}
	%>
	
	<br/>
	List&lt; Integer &gt;를 사용했습니다.
	
	</p>

	
	
</body>
</html>