package fithy.project.userservice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.dao.UserDAO;
import fithy.project.dto.User;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserListService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("UserListService execute()");
		
		// DB ó��, ��� ó��
		ArrayList<User> userArray = UserDAO.getInstance().userSelectAll();
		
		request.setAttribute("userArray", userArray);
		System.out.println("ȸ�� ����Ʈ ���� : " + userArray.size());
		
		
		// �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();
		
		nextPage.setPageName("./user/list.jsp");
		nextPage.setRedirect(false);

		
		return nextPage;
	}

}
