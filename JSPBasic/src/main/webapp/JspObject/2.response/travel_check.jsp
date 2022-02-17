<!-- 여행지 선택 (받는) 

	travel_check.jsp에서
	
	form을 통해 전달된 데이터가 뭔지 감지해서
	if~else if문을 이용해
		travel_도시명.jsp로 리다이렉트 시켜줍니다.
	
	travel_도시명.jsp 내부에는 유튜브 등에서 얻어온 해당 도시 관련 동영상이 보이게 만들어주세요


	radio는 여러 대상 중 하나만 선택할 수 있기 때문에, 데이터가 무조건 하나만 넘어오는 것이 담보됩니다.
	따라서 String[]이 아닌 그냥 String으로 받으면 됩니다.
	
	데이터가 제대로 들어왔는지 확인하기 위한 방법들
		방법 1. 콘솔에 찍는다.
			System.out.println(travel);

		방법 2. payload 확인
			개발자도구 > network > Name탭에서 travel_check.jsp클릭 > 페이로드 > travel: india 라고 적혀있음
			travel_main.jsp에서 name="travel" value="india" 가 넘어온 것을 알 수 있음.
			
	html에서는 get과 post만 쓸 수 있고, 
	(rest개발방식?) http에서는 patch, put, delete, get, post

	★검색 키워드 : http 상태코드
		개발자도구의 네트워크 > headers > General > Status Code 옆에 있는 번호를 확인할 수 있다.

-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	
	// 라디오 버튼에서 값을 받는다.
	// 라디오 버튼은 하나의 값만 들어올 수 있으므로 배열로 안 받아도 됨.
	String travel = request.getParameter("travel");

	// if문을 사용해서 라디오에서 입력된 값과 비교해서 다른 페이지로 이동하는 로직을 만듦.
	// 바로 이동하기 때문에 이 페이지는 약간 스쳐가는 정거장 같은 느낌.(사용자는 바로 다른 페이지가 보임)
	if(travel.equals("india")){
		response.sendRedirect("travel_india.jsp");
	}else if(travel.equals("bali")){
		response.sendRedirect("travel_bali.jsp");
	}else if(travel.equals("yangyang")){
		response.sendRedirect("travel_yangyang.jsp");
	}else if(travel.equals("jeju")){
		response.sendRedirect("travel_jeju.jsp");
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