/* IBoardService 인터페이스를 상속한 BoardListService */


package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

// BoardListService는 boardlist 접속시 사용하는 로직을 관리합니다.
public class BoardListService implements IBoardService{
	
		// BoardListServlet에서 바인딩까지 복사해오면 됩니다.
	
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) {
			// 1. 접속시 BoardDAO 생성 (싱글턴 패턴)
				BoardDAO dao = BoardDAO.getInstance();
			
			// 2. BoardDAO의 getAllBoardList() 호출해 전체 게시물 목록 받아오기
				List<BoardVO> allList = dao.getAllBoardList();
				
			// ★ List<BoardVO> boardList를 바로 바인딩할 수도 있다.
				request.setAttribute("allList", allList);	
				
			
			// 03.16 추가
				// 로그인 여부는 세션값을 저장한 다음, 바인딩해서 .jsp 페이지에서 확인합니다.
				// 서블릿 내부에서 세션 쓰는 법
				
				// 1. 세션 객체 생성 (.jsp 내부에서는 자동으로 생성되는 "내장 객체"이지만 서블릿 로직 하에서는 생성해줘야 쓸 수 있음)
				HttpSession session = request.getSession();
				String sId = (String)session.getAttribute("session_id");
				System.out.println("보드 리스트에서 세션 아이디 여부 -> " + sId);
				
				// 세션값 체킹이 확인되면 바인딩해서 포워딩시 세션값이 같이 넘어가도록 처리
				request.setAttribute("sId", sId);
		
			
		}



}
