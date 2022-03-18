package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("삭제 서비스 접근 성공");
		
		// 03.17 추가
		// 아이디 체킹) 폼에서 날려준 writer에 든 값이랑 세션 내 아이디 값 변수로 저장
		// 아래 DAO 생성 및 삭제로직을 if문을 이용해 감싸주고, if문은 글쓴이가 현재 로그인한 사람이 맞는지 체크	
		
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		String writer = request.getParameter("writer");
		System.out.println("넘어온 게시판 번호 : " + boardNum + ", 글쓴이 : " + writer);
		
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("session_id");
		
		if(writer.equals(sId)) {
		
			// 다오 생성
			BoardDAO dao = BoardDAO.getInstance();
			
			// 메서드 호출
			dao.deleteBoard(boardNum);
			
			System.out.println("삭제 완료");
		}
		
		System.out.println("삭제되지 않고 게시판으로 이동");
		
	}

}
