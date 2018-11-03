package fithy.project.userservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.ReservationDAO;
import fithy.project.dao.UserDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserLogoutService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("UserLogoutService execute()");
		HttpSession session = request.getSession();
		// ��û �Ķ���� ó��
		String userId = (String)session.getAttribute("uId");
		System.out.println(userId);
		// DB ó��
//		int result = UserDAO.getInstance().userLogin(userId, userPw);
		// �̵��� ���������� ó��
		NextPage nextPage = new NextPage();
		
		// ------------------------------------�α׾ƿ� ���
		// ����
		if (userId != null) {
			session.invalidate();
			UserDAO.getInstance().logout_delete(userId);
			nextPage.setPageName("./index.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} // ����
		else {
			nextPage.setPageName("./errors/error.jsp");
			nextPage.setRedirect(false);
			return nextPage;
		}
	}

}
