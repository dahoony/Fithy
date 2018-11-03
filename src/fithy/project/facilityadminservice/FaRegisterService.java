package fithy.project.facilityadminservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.dto.FacilityAdmin;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaRegisterService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaRegisterService()");

		// 요청 파라미터 처리
		String faId = request.getParameter("faCheckId");
		String faPw = request.getParameter("faPw");
		String faName = request.getParameter("faName");
		String faNum = request.getParameter("faNum");

		// DB 처리, 결과 처리
		int result = FacilityAdminDAO.getInstance().facilityAdminInsert(new FacilityAdmin(faId, faPw, faName, faNum));

		System.out.println("DB 처리 완료");

		// 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		// 회원가입 성공
		if (result != 0) {
			nextPage.setPageName("./user/faLogin.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// 회원가입 실패
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "회원가입 실패");
			return nextPage;
		}
	}

}
