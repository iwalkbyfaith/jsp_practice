package kr.co.ict.servlet.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

// IBoardService를 구현해서 서블릿 기능을 서비스로 옮겨주신 다음 insertBoard.do 패턴에서 실행하도록 수정해주세요.
public class BoardInsertService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
		// DAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// INSERT 로직 호출
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		dao.insertBoard(title, content, writer);
		
	}

}
