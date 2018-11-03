package fithy.project.facilityadminservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaLogoutService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaLogoutService()");

		HttpSession session = request.getSession();

		// 요청 파라미터 처리
		String faId = (String) session.getAttribute("faId");
		
		// 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		// 로그아웃 성공
		if (faId != null) {
			session.invalidate();
			nextPage.setPageName("./index.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// 로그아웃 실패
		else {
			nextPage.setPageName("./errors/error.jsp");
			nextPage.setRedirect(false);
			return nextPage;
		}
	}

}
