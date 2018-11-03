package fithy.project.dto;

import java.io.Serializable;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	private String userCode;
	private String userId;
	private String userPw;
	private String userName;
	private String userGender;
	private String userDate;
	private String userPhoneNum;
	private String userAddress;
	private String userFavoriteKind;
	private String userJob;
	
	//DB에 insert 해주기 위해 만든 생성자
	public User(String userCode, String userId, String userPw, String userName, String userGender, String userDate,
			String userPhoneNum, String userAddress, String userFavoriteKind, String userJob) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userGender = userGender;
		this.userDate = userDate;
		this.userPhoneNum = userPhoneNum;
		this.userAddress = userAddress;
		this.userFavoriteKind = userFavoriteKind;
		this.userJob = userJob;
	}

	//session 영역에 회원코드, 회원아이디, 회원이름을 저장시키기위해 쓴 생성자
	public User(String userCode, String userId, String userName) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userName = userName;
	}

	
	//마이페이지에서 회원 상세 정보를 출력하기 위한 함수
	public User(String userName, String userGender, String userDate, String userPhoneNum, String userAddress,
			String userFavoriteKind, String userJob) {
		super();
		this.userName = userName;
		this.userGender = userGender;
		this.userDate = userDate;
		this.userPhoneNum = userPhoneNum;
		this.userAddress = userAddress;
		this.userFavoriteKind = userFavoriteKind;
		this.userJob = userJob;
	}

	
	public User(String userCode, String userId, String userName, String userAddress, String userFavoriteKind) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userName = userName;
		this.userAddress = userAddress;
		this.userFavoriteKind = userFavoriteKind;
	}

	//로그인하는데 비교하는데 이용하려고 만든 생성자
	public User(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
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

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhoneNum() {
		return userPhoneNum;
	}

	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAge() {
		return userDate;
	}

	public void setUserAge(String userDate) {
		this.userDate = userDate;
	}

	public String getUserFavoriteKind() {
		return userFavoriteKind;
	}

	public void setUserFavoriteKind(String userFavoriteKind) {
		this.userFavoriteKind = userFavoriteKind;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}
	
	
}
