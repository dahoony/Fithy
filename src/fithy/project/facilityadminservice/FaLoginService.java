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

		// 1. ��û �Ķ���� ó��
		String faId = request.getParameter("faId");
		String faPw = request.getParameter("faPw");
		System.out.println("��ȸ ID : " + faId + "��ȸ PW : " + faPw);

		// 2. DB ó��
		FacilityAdmin fadmin = FacilityAdminDAO.getInstance().adminLogin(faId, faPw);
		System.out.println("DB ó�� �Ϸ�");

		// 4. �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		HttpSession session = request.getSession(); 

		// �α��� ����
		if (fadmin != null) {
			nextPage.setPageName("./index.jsp");
			session.setAttribute("faCode", fadmin.getFaCode());
			session.setAttribute("faName", fadmin.getFaName());
			session.setAttribute("faId", faId);
			nextPage.setRedirect(true);
			return nextPage;
		}
		// �α��� ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "�α��� ����");
			return nextPage;
		}
	}

}
