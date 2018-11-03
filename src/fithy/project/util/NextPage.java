package fithy.project.util;

public class NextPage {//이동하려는 다음 페이지 정보 저장하는 클래스
	//이동하려는 페이지 이름
	private String pageName;
	//이동 방식
	private boolean isRedirect;//true 면 리다이렉트
	
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
