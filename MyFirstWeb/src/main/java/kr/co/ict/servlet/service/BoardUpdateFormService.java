package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardUpdateFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		
		System.out.println("들어온 게시판 번호 : " + boardNum);

		
		// 다오 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드 호출
		BoardVO board = dao.getBoardDetail(boardNum);
		
		// 바인딩
		request.setAttribute("board", board);
		
	}

}
