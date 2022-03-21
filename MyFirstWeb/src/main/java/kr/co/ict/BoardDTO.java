/* (DTO : Board)

	원래 VO(Value Object)와 DTO(Data Transfer Object)는 큰 차이는 두지 않고 사용합니다.
	
	굳이 차이를 두자면 
		VO는 DB 테이블 형태를 그대로 전달할 때,
		DTO는 DB에서 꺼낸 데이터가 가공되어 전달 할 때 쓰는 것을 지칭할 때 씁니다.
	
	다만 DTO 와 VO는 엄격하게 구분되지 않고 프로그래머에 따라서는 그냥 DTO를 VO와 완전히 동일하게 쓰는 경우도 있으므로
	사용하는 사람이 부르고 싶은대로 부르셔도 무방합니다.

*/

package kr.co.ict;

public class BoardDTO {
	
	
	// 필드
	private int boardCount; 					// 전체 글 개수 (DAO에서 받아옴)
	private int currentPage; 					// 현재 보고있는 페이지
	
	private int totalPages;  					// 전체 페이지 개수
	private int startPage; 						// 시작 페이지 번호
	private int endPage; 						// 끝 페이지 번호
	
	private static final int NAV_NUM = 5; 		// 페이지는 10개씩 링크 표시 (하단에 깔릴 버튼은 10개씩)
	private static final int BOARD_NUM = 20; 	// 글도 10개씩 표시 (DAO의 limit 구문도 함께 수정해야함)
	
	
	
	
	
	
	// ★ 생성자
	// 생성자 생성시 모든 정보를 자동으로 구하도록 처리
	public BoardDTO(int boardCount, int currentPage) {
		
		// 총 글 개수와, 현재 조회중인 페이지 정보를 입력받아 => 아래에 깔릴 버튼 개수, 현재 깔려야하는 번호대를 구합니다.
		this.boardCount = boardCount;
		this.currentPage = currentPage;
		
		// 글이 없다면? 아래에 깔리는 버튼 자체가 없어야함. (혹시 몰라서 넣는 옵션임)
		if(boardCount == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
			
		
		// ■ totalPages값 구하기
		// 게시글 개수를 이용해 전체 페이지 개수 구하기 (선생님은 this. 안쓰심)
		}else {
			// 딱 떨어지면 배수인거고 아니면 +1 더해주면 됨
			if(boardCount % BOARD_NUM == 0) {
				totalPages = (boardCount / BOARD_NUM);
			}else {
				totalPages = (boardCount / BOARD_NUM) + 1;
			}
			
		// □ 페이지 개수 구하기 종료 
		

			
			
		// ■ startPage값 구하기
		// 해당 페이지의 시작 페이지 구하기
			// 52라고 했을때 51~60까지 나와야 함. 근데 문제가
				//1) 50 / 10 = 5 ( 있어야하는 곳은 5번대 )
				//2) 60 / 10 = 6 ( 있어야하는 곳은 6번대 )
				// 얘네들이 이렇게 나오는게 문제임 (두 케이스를 보정으로 해줘야함. 나머지% 활용)
			
		int navNum = 0;
		
		// 10n 번대 페이지인 경우
		if(currentPage % NAV_NUM == 0) {
			// 10번대 페이지는 자신이 속한 그룹보다 페이지 식별 숫자가 1크게 나옴 (그래서 -1을해서 맞춰줌 : 50번 글번호면 49 => 4번 페이지)
			navNum = (currentPage-1) / NAV_NUM;
			System.out.println("현재 navNum -> " + navNum );
		
		// 10n + m 번대 페이지. (51/10 = 5, 59/10 = 5)
			// ★★ 근데 여기서 현재페이지-1을 해도 사실 같은 번호가 나옴 ( 51-1/10 =5, 59-1/10 = 5) : 그래서 실제로는 if~else문 자체가 필요 없음.
		}else {
			navNum = currentPage / NAV_NUM ;
			System.out.println("현재 navNum -> " + navNum );
		}
		
		// ==> 즉, navNum = (currentPage-1)/10을 해도 상관 없는 것. (헷갈릴까봐 비효율적으로 위의 코드를 쓰는 것.)
		
		
		// 식별번호 nvaNum이 구해졌으면 *10 + 1 해서 시작 번호를 구한다.
		startPage = (navNum * NAV_NUM) + 1 ;
			
		}
		// □
		
		
		
		
		// ■ endPage값 구하기
		// 현재 조회중인 페이지 그룹의 끝페이지 구하기
		endPage = startPage + (NAV_NUM - 1); // 나중에 10을 상수처리 해야하니까 9가 아니고 10-1로 바꿈
		
			// 그런에 마지막이 84페이지었을때 있지도 않은 90 구할 수도 있음 (해결 : boardCount를 이용해 구한 totalPages 사용)
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		
		// (개선된 방법도 있긴 함.)
			// endPage = Math.min(startPage + (NAV_NUM-1), totalPages);
			// endPage = (starPage + (NAV_NUM-1) > totalPages) ? totalPages : starPage + (NAV_NUM-1));
		
		// □
			
		
	}// ☆ 생성자 끝
	
	
	
	
	// ★ 수동으로 getter/setter 생성
	// set/getter를 그냥 만들면 안됨 (가공된 데이터를 보낼 수 있도록 생성을 해주어야 함)
	
	
	// 총 글 개수
	public int getBoardCount() {
		return boardCount; 
	}
	
	// 밑에 버튼을 깔지 말지를 결정하기 위한 bool 자료형
		// 표기할 게시물이 없으면 버튼을 깔 필요 없음
		public boolean hasNoBoard() {
			return boardCount == 0;
		}
		
		// 표시할 게시물이 있다면 버튼을 깔아주어야 함.
		public boolean hasBoard() {
			return boardCount > 0;
		}
	
	
	// 페이지의 총 개수를 알려주는 getter
	public int getTotalPages() {
		return totalPages;
	}
	
	// 해당 페이지 그룹의 시작 페이지
	public int getStartPage() {
		return startPage;
	}
	
	// 해당 페이지 그룹의 끝 페이지
	public int getEndPage() {
		return endPage;
	}


	
	// ★ 디버깅을 위한 toString (주소값이 나오는 것을 방지)
	@Override
	public String toString() {
		return "BoardDTO [boardCount=" + boardCount + ", currentPage=" + currentPage + ", totalPages=" + totalPages
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
}
