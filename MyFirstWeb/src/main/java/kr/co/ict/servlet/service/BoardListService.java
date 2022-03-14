/* IBoardService 인터페이스를 상속한 BoardListService */


package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
		}



}
