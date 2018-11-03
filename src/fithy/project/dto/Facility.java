package fithy.project.dto;

public class Facility {
	private String faCode;
	private String fcCode;
	private String fcAddress;
	private String fcNum;
	private String fcName;

	// 조인해서 사용할 변수들
	private String faName;// 시설 관리자 이름
	private String faNum; // 시설관리자 번호
	private String faId; // 시설관리자 아이디
	private String faPw;// 시설관리자 비밀번호
	private String kindName;
	private int price;
	private String image;

	private String kCode;

	public Facility() {
	}

	public Facility(int price) {
		this.price = price;
	}

	// 생성자1
	public Facility(String faCode, String fcCode, String fcAddress, String fcNum, String fcName, int price,
			String image) {
		super();
		this.faCode = faCode;
		this.fcCode = fcCode;
		this.fcAddress = fcAddress;
		this.fcNum = fcNum;
		this.fcName = fcName;
		this.price = price;
		this.image = image;
	}

	// 생성자2
	public Facility(String fcCode, String faCode, String fcAddress, String fcNum, String fcName) {

		this.faCode = faCode;
		this.fcCode = fcCode;
		this.fcAddress = fcAddress;
		this.fcNum = fcNum;
		this.fcName = fcName;
	}

	// FcRegisterService - fcinsert
	public Facility(String faCode, String fcAddress, String fcNum, String fcName) {

		this.faCode = faCode;
		this.fcAddress = fcAddress;
		this.fcNum = fcNum;
		this.fcName = fcName;
	}
	// 생성자 5
	public Facility(String fcAddress, String fcNum, String fcName) {
		this.fcAddress = fcAddress;
		this.fcNum = fcNum;
		this.fcName = fcName;
	}

	// 생성자4
	public Facility(String fcName, String fcAddress) {
		this.fcName = fcName;
		this.fcAddress = fcAddress;
	}

	public Facility(String fcCode) {
		this.fcCode = fcCode;
	}

	public String getkCode() {
		return kCode;
	}

	public void setkCode(String kCode) {
		this.kCode = kCode;
	}

	public String getFaId() {
		return faId;
	}

	public void setFaId(String faId) {
		this.faId = faId;
	}

	public String getFaPw() {
		return faPw;
	}

	public void setFaPw(String faPw) {
		this.faPw = faPw;
	}

	public String getFaCode() {
		return faCode;
	}

	public void setFaCode(String faCode) {
		this.faCode = faCode;
	}

	public String getFcCode() {
		return fcCode;
	}

	public void setFcCode(String fcCode) {
		this.fcCode = fcCode;
	}

	public String getFcAddress() {
		return fcAddress;
	}

	public void setFcAddress(String fcAddress) {
		this.fcAddress = fcAddress;
	}

	public String getFcNum() {
		return fcNum;
	}

	public void setFcNum(String fcNum) {
		this.fcNum = fcNum;
	}

	public String getFcName() {
		return fcName;
	}

	public void setFcName(String fcName) {
		this.fcName = fcName;
	}

	public String getFaName() {
		return faName;
	}

	public void setFaName(String faName) {
		this.faName = faName;
	}

	public String getFaNum() {
		return faNum;
	}

	public void setFaNum(String faNum) {
		this.faNum = faNum;
	}

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
