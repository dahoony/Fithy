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

		// ��û �Ķ���� ó��
		String faId = (String) session.getAttribute("faId");
		
		// �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		// �α׾ƿ� ����
		if (faId != null) {
			session.invalidate();
			nextPage.setPageName("./index.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// �α׾ƿ� ����
		else {
			nextPage.setPageName("./errors/error.jsp");
			nextPage.setRedirect(false);
			return nextPage;
		}
	}

}
