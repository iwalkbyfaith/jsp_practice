package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.servlet.service.BoardDeleteService;
import kr.co.ict.servlet.service.BoardDetailService;
import kr.co.ict.servlet.service.BoardInsertFormService;
import kr.co.ict.servlet.service.BoardInsertService;
import kr.co.ict.servlet.service.BoardListService;
import kr.co.ict.servlet.service.BoardUpdateFormService;
import kr.co.ict.servlet.service.BoardUpdateService;
import kr.co.ict.servlet.service.IBoardService;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식으로 요청이 들어오건
		doRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 방식으로 요청이 들어오건 동일하게 doRequest 에서 처리하도록 설정
		doRequest(request, response);
	}

	
	// doGet / doPost 어떤 형식으로 요청이 들어올지 모르기 때문에 공용 메서드를 하단에 하나 생성합니다.
		// 여러 주소를 한꺼번에 처리해야하니까 어떤 것으로 들어올지 모른다는 뜻
	private void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 초기 세팅
		
			// 포스트 방식도 처리하게 될 수 있으므로 인코딩 설정
			request.setCharacterEncoding("utf-8");
			
			// 프론트 컨트롤러는 여러 주소 요청을 처리하기 때문에 uri부터 받아옵니다. (주소창에 뭐라고 친지 나옴)
			String uri = request.getRequestURI();
			
			// 포워딩 할 .jsp 파일의 경로를 미리 저장해둘 변수
			String ui = null;
			
			// 다형성을 이용해 요청 주소에 따른 처리해줄 서비스 (인터페이스 IBoardService가 하나의 타입이 됨)
			IBoardService sv = null;
			
			System.out.println("현재 주소창에 입력된 .do 패턴 -> " + uri);
		
			
			
		// if~else문 생성
			
			// ■ 모든 게시판 리스트 보기
			if(uri.equals("/MyFirstWeb/boardList.do")) {
				System.out.println("/boardList.do로 들어옴");
				// 다형성에 의해 IBoardService를 구현한 모든 타입을 sv에 저장 가능
					// IBoardService(부모)에는 온갖 걸(자식들) 다 집어 넣을 수 있는 것 (당연히 상속한 경우)
				sv = new BoardListService();
				
				// BoardListService의 execute는 게시글 목록을 가져옴 (게시판 리스트 DB에서 받아와서 바인딩까지 한 것) 
				sv.execute(request, response);
				
				// 포워딩 주소를 ui에 저장함
				ui = "/board/boardlist.jsp";
			
			// ■ 게시판 디테일 보기
			}else if(uri.equals("/MyFirstWeb/boardDetail.do")){
				System.out.println("/boardDetail.do로 들어옴");
				
				sv = new BoardDetailService();
				sv.execute(request, response);
				ui = "/board/boarddetail.jsp";
				
			// ■ 게시판 인서트 폼
			}else if(uri.equals("/MyFirstWeb/insertForm.do")) {
				sv = new BoardInsertFormService();
				sv.execute(request, response);
				ui = "/board/insertBoardForm.jsp";
	
			// ■ 게시판 인서트 폼에서 데이터를 받아 DB에 넣는 구문
			}else if(uri.equals("/MyFirstWeb/insertBoard.do")) {	
				sv = new BoardInsertService();
				sv.execute(request, response);
				ui = "/boardList.do";
			
			// ■ 게시판 삭제
			}else if(uri.equals("/MyFirstWeb/boardDelete.do")) {
				sv = new BoardDeleteService();
				sv.execute(request, response);
				ui = "/boardList.do";
				
			// ■ 게시판 수정 폼으로 이동하기
			}else if(uri.equals("/MyFirstWeb/boardUpdateForm.do")) {
				sv = new BoardUpdateFormService();
				sv.execute(request, response);
				ui = "/board/boardUpdateForm.jsp";
				
			// ■ 게시판 수정 폼에서 데이터를 받아 DB에 update 하기 ★ 
			}else if(uri.equals("/MyFirstWeb/boardUpdate.do")) {
				sv = new BoardUpdateService();
				sv.execute(request, response);
				ui = "/boardDetail.do?board_num=" + request.getParameter("board_num");
			
			// ■ 정해진 주소 이외의 주소로 접속했을때 메인 페이지로 보내주는 포워딩 구문을 작성하세요.
			}else {
				ui = "/";
			}
		
		
		
		
		// 위쪽 if~else문을 다 호출한 다음 실제로 포워딩 실행
			RequestDispatcher dp = request.getRequestDispatcher(ui);
			dp.forward(request, response);
			
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
