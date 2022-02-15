/* VO 선언
 
 
  	VO는 특정 테이블의 자료를 자바형식으로 저장하기 위해 선언합니다.
  	그래서 SQL 데이터를 자바로 옮겨오기 위해서
  		1. 담당할 테이블의 컬럼을 전부 변수로 만듭니다.
  		2. 생성자, getter, setter를 만들어주세요
  			2-1 우클릭 > source > Generate getters and setters..
  			2-2 우클릭 > source > Generate Constructor using fields..
  		3. (선택)toString을 만들어주세요
  			3-1 우클릭 > source > Generate toString()..
 */

package kr.co.ict;

public class UserVo {
	
	// 1. 컬럼을 변수로 만들기
		private String uId;
		private String uName;
		private String uPw;
		private String uEmail;
		
		
	// 2. 생성자, getter, setter를 만들어주세요
		
		// 생성자
		public UserVo(String uId, String uName, String uPw, String uEmail) {
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
		@Override
		public String toString() {
			return "UserVo [uId=" + uId + ", uName=" + uName + ", uPw=" + uPw + ", uEmail=" + uEmail + "]";
		}
		

	
}
