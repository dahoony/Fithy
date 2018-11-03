package fithy.project.dto;

import java.sql.Date;

public class Board {
	private String boardNum;
	private String userCode;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int commentNum;
	private String comment;
	private Date commentDate;

	//
	public Board(String boardNum, String boardTitle, String boardContent, String userId, Date boardDate) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userId = userId;
		this.boardDate = boardDate;
	}
	
	//게시판 리스트를 출력하기 위한 함수
	public Board(String boardNum, String boardTitle, String userId, Date boardDate) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.userId = userId;
		this.boardDate = boardDate;
	}
	
	//DB에 insert 해주기 위해 만든 생성자
	public Board(String userCode, String boardTitle, String boardContent) {
		super();
		this.userCode = userCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
	}

	
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
		
	
}
