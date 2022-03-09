package kr.co.daeun;

import java.sql.Date;

public class BoardVO {
	
	// 변수 선언
		private int boardNum;
		private String title;
		private String content;
		private String writer;
		private Date bDate;
		private Date mDate;
		private int hit;
		
		
	// 생성자
		public BoardVO(int boardNum, String title, String content, String writer, Date bDate, Date mDate, int hit) {
			super();
			this.boardNum = boardNum;
			this.title = title;
			this.content = content;
			this.writer = writer;
			this.bDate = bDate;
			this.mDate = mDate;
			this.hit = hit;
		}


		
	// getter/ setter
		
		public int getBoardNum() {
			return boardNum;
		}


		public void setBoardNum(int boardNum) {
			this.boardNum = boardNum;
		}


		public String getTitle() {
			return title;
		}


		public void setTitle(String title) {
			this.title = title;
		}


		public String getContent() {
			return content;
		}


		public void setContent(String content) {
			this.content = content;
		}


		public String getWriter() {
			return writer;
		}


		public void setWriter(String writer) {
			this.writer = writer;
		}


		public Date getbDate() {
			return bDate;
		}


		public void setbDate(Date bDate) {
			this.bDate = bDate;
		}


		public Date getmDate() {
			return mDate;
		}


		public void setmDate(Date mDate) {
			this.mDate = mDate;
		}


		public int getHit() {
			return hit;
		}


		public void setHit(int hit) {
			this.hit = hit;
		}


		
		
		// toString
		@Override
		public String toString() {
			return "BoardVO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", writer=" + writer
					+ ", bDate=" + bDate + ", mDate=" + mDate + ", hit=" + hit + "]";
		}
		
	
	
		
		
		
		
		
		
		
		

}
