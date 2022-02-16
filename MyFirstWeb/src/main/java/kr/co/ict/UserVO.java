/* VO(Value Object) 선언

  	VO는 '특정 테이블의 자료'를 자바형식으로 저장하기 위해 선언합니다.
  	그래서 SQL 데이터를 자바로 옮겨오기 위해서
  		1. 담당할 테이블의 컬럼을 전부 변수로 만듭니다.
  		2. 생성자, getter, setter를 만들어주세요
  			2-1 우클릭 > source > Generate getters and setters..
  			2-2 우클릭 > source > Generate Constructor using fields..
  		3. (선택)toString을 만들어주세요
			3-1 우클릭 > source > Generate toString()..
	
	하나의 VO에는 한 개의 row만 들어올 수 있다. (배열이 아니기 때문에)
	Q) 전체 회원의 목록을 보려고 만들어놨는데, 고작 한 row만 들어가면 쓸모없는 것 아닌가?
	A) ArrayList<UserVO> 자료형을 이용해 한 줄 한 줄 단위로 여러 row를 저장한다.
		ArrayList의 길이는 가변적이기 때문에, UserVO가 몇 개가 되든지 사용에 상관없음.
 */

package kr.co.ict;

public class UserVO {
	
	// 1. 담당할 테이블의 컬럼을 전부변수로 만들기 (DB의 컬럼의 데이터를 하나씩 받을 수 있도록)
		// 별 일이 없으며면 private으로 저장을 한다.
		private String uId;
		private String uName;
		private String uPw;
		private String uEmail;
		
		
	// 2. 생성자, getter, setter를 만들어주세요
		
		// 생성자
		public UserVO(String uName,String uId, String uPw, String uEmail) {
			super();
			this.uId = uId;
			this.uName = uName;
			this.uPw = uPw;
			this.uEmail = uEmail;
		}
			
		// getter, setter	
		public String getuId() {
			return uId;
		}
		public void setuId(String uId) {
			this.uId = uId;
		}
		public String getuName() {
			return uName;
		}
		public void setuName(String uName) {
			this.uName = uName;
		}
		public String getuPw() {
			return uPw;
		}
		public void setuPw(String uPw) {
			this.uPw = uPw;
		}
		public String getuEmail() {
			return uEmail;
		}
		public void setuEmail(String uEmail) {
			this.uEmail = uEmail;
		}

		
	
	// 3. (선택) toString을 만들어주세요. 필수는 아님
		// toString은 콘솔이나 화면에 UserVO를 찍었을 때, 주소 대신 내부 데이터가 나오도록 해준다.
		@Override
		public String toString() {
			return "UserVo [uId=" + uId + ", uName=" + uName + ", uPw=" + uPw + ", uEmail=" + uEmail + "]";
		}
		

	
}
