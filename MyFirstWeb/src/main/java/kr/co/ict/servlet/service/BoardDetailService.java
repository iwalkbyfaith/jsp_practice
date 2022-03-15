package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardDetailService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 게시판 번호 가져오기
		String str_board_num = request.getParameter("board_num");
		int board_num = Integer.parseInt(str_board_num);
		
		// DAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// VO 생성 (SELECT니까 받아줘야)
		BoardVO detailBoard = dao.getBoardDetail(board_num);
		
		// 바인딩
		request.setAttribute("detailBoard", detailBoard);
		
	}
	

}
