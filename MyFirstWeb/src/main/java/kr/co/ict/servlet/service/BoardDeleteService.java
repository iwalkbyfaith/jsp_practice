package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("삭제 서비스 접근 성공");
		
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		System.out.println("넘어온 게시판 번호 : " + boardNum);
		
		// 다오 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드 호출
		dao.deleteBoard(boardNum);
		
	}

}
