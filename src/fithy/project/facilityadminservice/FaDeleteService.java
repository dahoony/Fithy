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

		// ��û �Ķ����
		HttpSession session = request.getSession();
		
		String faId = (String) session.getAttribute("faId");

		// DB ó��
		int result = FacilityAdminDAO.getInstance().adminDelete(faId);

		// �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		if (result != 0) {
			System.out.println("�����ڰ��� ���� ����");
			nextPage.setPageName("./user/faLogin.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMsg", "�����ڰ��� ���� ����");
			return nextPage;
		}
	}
}
