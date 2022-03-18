package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardUpdateFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String strBoardNum = request.getParameter("board_num");
		int boardNum = 0;
		// 03.17 추가 (10:35~) 아 null을 형 변환 하려고 해서 오류나는 것?
		if(strBoardNum != null) {
			boardNum = Integer.parseInt(strBoardNum);
		}
		System.out.println("들어온 게시판 번호 : " + boardNum);

		
		// 다오 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 메서드 호출
		// 03.18 메서드를 getBoardDetail -> getBoardDetail2 (uphit 미포함)으로 변경
		BoardVO board = dao.getBoardDetail2(boardNum);
		
		// 바인딩
		request.setAttribute("board", board);
		
	}

}
