package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService{

	@Override // 폼에서 수정 할 데이터 받아서 DB로 날려주는
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 03.17 글쓴이, 세션 추가
		//String writer = request.getParameter("writer");
		
		//HttpSession session = request.getSession();
		//String sId = (String)session.getAttribute("session_id");
		
		//if(writer.equals(sId)){
			// 다오 생성
			BoardDAO dao = BoardDAO.getInstance();
			
			// 메서드 호출 ( mDate도 같이 바뀜 )
			dao.updateBoard(title, content, boardNum);
		//}
		
		
		// ★ 서블릿에서는 아래와 같이 boardNum 변수를 넣어서 리다이렉트 해주었는데,
		// 프론트 컨트롤러 시스템으로 바뀐 이후에는 다른 방법이 필요함. (포워딩을 사용하니까)
			// 디테일 페이지로 리다이렉트
			// response.sendRedirect("http://localhost:8181/MyFirstWeb/boarddetail?board_num=" + boardNum);
		
		// 프론트 컨트롤러 해당 else if문으로 이동하삼
		// ui = "/boardDetail.do?board_num="+request.getParameter("board_num"); 이렇게 넣어주면 됨.
		
		// 리퀘스트와 리스폰스로 받은게 계속 이어지는 것 (자세한 설명 -> 03.15) 동영상 11:16 )
			
		
	}

}
