<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script>
	
		window.onload = function(){
			
			var clBtn = document.getElementById("click");
			
			clBtn.onclick = function(){
				++clickNum;
				}
			}
			
			
		}
	
	
	
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<%!
	
	int newNum = 0;
	int clickNum = 0;
		
	
	%>

	<h1>한 번 실습해보기</h1>
	<h2>새로고침 횟수 : <%=++newNum %></h2>
	
	<button id="click">클릭</button>
	<h3>지금까지 "<%=++clickNum %>" 번 클릭했습니다.</h3>
	<a href="http://naver.com">네이버</a>


</body>
</html>