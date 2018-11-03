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

		// ��û �Ķ���� ó��
		String faId = request.getParameter("faCheckId");
		String faPw = request.getParameter("faPw");
		String faName = request.getParameter("faName");
		String faNum = request.getParameter("faNum");

		// DB ó��, ��� ó��
		int result = FacilityAdminDAO.getInstance().facilityAdminInsert(new FacilityAdmin(faId, faPw, faName, faNum));

		System.out.println("DB ó�� �Ϸ�");

		// �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		// ȸ������ ����
		if (result != 0) {
			nextPage.setPageName("./user/faLogin.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// ȸ������ ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "ȸ������ ����");
			return nextPage;
		}
	}

}
