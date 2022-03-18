package kr.co.ict.servlet.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInsertFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("session_id");
		
		System.out.println("/insertForm.do에서 확인된 세션 아이디 -> " + sId);
		request.setAttribute("sId", sId);
		
		/*
		if(sId == null) { // 리다이렉트가 안돼서 바로 포워딩을 시킴 ★
			RequestDispatcher dp = request.getRequestDispatcher("/boardList.do");
			dp.forward(request, response);
		}
		*/
		// 지금 콘솔 창에서 에러메세지는 뜨는데(여기서 포워드 한 경우, 호출한 자리로 가서 또 포워드 하기 때문) 진행은 잘 됨;;
			// 03.17 해결 방법 : 스크립트릿을 쪼금 써줘야함. 
				// 위의 코드는 주석처리하고 sId만 바인딩하고 insertBoardForm.jsp 로 이동해서 스크립트릿 추가
		
		
		/*
		 
		 ○ 글쓰기/ 수정시 아이디를 자동으로 로그인한 사람 아이디로 처리합니다. 11:43~	
			insertBoardForm.jsp
			
			이전코드)
			<input type="text" name="writer" placeholder="글쓴이" required/><br/>
			
			방법1)
			<input type="text" name="writer" value="${sessionScope.session_id}" readonly/><br/>
			
			방법2)
			BoardInsertFormService에서 아이디를 바인딩해서 보내서 
			request.setAttribute("sId" sId);
			.jsp 파일에서 value=${sId}로 적기
		  
		 */
		
		
		
		
	}

}
