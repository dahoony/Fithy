package fithy.project.dto;

public class FacilityAdmin {
	private String faCode;
	private String faId;
	private String faPw;
	private String faName;
	private String faNum;
	
	public FacilityAdmin() {
		super();
	}

	public FacilityAdmin(String faCode, String faId, String faPw, String faName, String faNum) {
		super();
		this.faCode = faCode;
		this.faId = faId;
		this.faPw = faPw;
		this.faName = faName;
		this.faNum = faNum;
	}
	
	public FacilityAdmin(String faId, String faPw, String faName, String faNum) {
		super();
		this.faId = faId;
		this.faPw = faPw;
		this.faName = faName;
		this.faNum = faNum;
	}

	public FacilityAdmin(String faCode, String faId, String faName) {
		super();
		this.faCode = faCode;
		this.faId = faId;
		this.faName = faName;
	}

	public String getFaCode() {
		return faCode;
	}
	public void setFaCode(String faCode) {
		this.faCode = faCode;
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
}
