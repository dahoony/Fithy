package fithy.project.userservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.ReservationDAO;
import fithy.project.dao.UserDAO;
import fithy.project.dto.User;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserLoginService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// ��û �Ķ���� ó��
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		System.out.println("��ȸ ID : " + userId + " ��ȸ PW : " + userPw);

		// DB ó��
		User user = UserDAO.getInstance().userLogin(userId, userPw);
		System.out.println("dbó��(��ȸ) �Ϸ�");
		
		UserDAO.getInstance().loginInsert(user.getUserCode(), userId);
		
		// �̵��� ���������� ó��
		NextPage nextPage = new NextPage();
		
		HttpSession session = request.getSession();//id,ȸ���ڵ带 ���ǿ����� �����ҷ��� ����
		// �α��� ����
		if (user != null) {
			nextPage.setPageName("./index.jsp");
			session.setAttribute("uCode", user.getUserCode());
			session.setAttribute("uId", userId);
			session.setAttribute("uName", user.getUserName());
			session.setAttribute("uAddress", user.getUserAddress());
			session.setAttribute("uKind", user.getUserFavoriteKind());
			nextPage.setRedirect(true);
			return nextPage;
		}
		// �α��� ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "�α��ο� ���� �ϼ̽��ϴ�.");
			return nextPage;
		}

	}

}
