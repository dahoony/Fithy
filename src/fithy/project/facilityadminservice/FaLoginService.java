package fithy.project.facilityadminservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.dto.FacilityAdmin;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaLoginService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaLoginService()");

		// 1. 요청 파라미터 처리
		String faId = request.getParameter("faId");
		String faPw = request.getParameter("faPw");
		System.out.println("조회 ID : " + faId + "조회 PW : " + faPw);

		// 2. DB 처리
		FacilityAdmin fadmin = FacilityAdminDAO.getInstance().adminLogin(faId, faPw);
		System.out.println("DB 처리 완료");

		// 4. 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		HttpSession session = request.getSession(); 

		// 로그인 성공
		if (fadmin != null) {
			nextPage.setPageName("./index.jsp");
			session.setAttribute("faCode", fadmin.getFaCode());
			session.setAttribute("faName", fadmin.getFaName());
			session.setAttribute("faId", faId);
			nextPage.setRedirect(true);
			return nextPage;
		}
		// 로그인 실패
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "로그인 실패");
			return nextPage;
		}
	}

}
