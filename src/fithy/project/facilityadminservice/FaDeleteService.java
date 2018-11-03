package fithy.project.facilityadminservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaDeleteService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaDeleteService()");

		// 요청 파라미터
		HttpSession session = request.getSession();
		
		String faId = (String) session.getAttribute("faId");

		// DB 처리
		int result = FacilityAdminDAO.getInstance().adminDelete(faId);

		// 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		if (result != 0) {
			System.out.println("관리자계정 삭제 성공");
			nextPage.setPageName("./user/faLogin.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMsg", "관리자계정 삭제 실패");
			return nextPage;
		}
	}
}
