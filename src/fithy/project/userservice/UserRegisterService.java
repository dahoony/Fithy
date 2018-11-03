package fithy.project.userservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.dao.UserDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserRegisterService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		// ��û �Ķ���� ó��
		String userId = request.getParameter("userCheckId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		String userDate = request.getParameter("birthDate");
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userAddress = request.getParameter("userAddress")+ " " +request.getParameter("userDetailAddress");
		String[] userFavoriteKinds = request.getParameterValues("favoriteKind");
		String userFavoriteKind = "";
		String userJob = request.getParameter("userJob");
		
		if(userFavoriteKinds.length==1) {
			userFavoriteKind = userFavoriteKinds[0];
		}else {
			for(int i=0;i<userFavoriteKinds.length;i++) {
				if(i==userFavoriteKinds.length-1)
					userFavoriteKind += userFavoriteKinds[i];
				else
					userFavoriteKind += userFavoriteKinds[i]+", ";
			}
		}

		System.out.println(userFavoriteKind);
		// DB ó��, ��� ó��
		int result = UserDAO.getInstance().userInsert(userId, userPw, userName, userGender, userDate, userPhoneNum, userAddress, userFavoriteKind,userJob);
		System.out.println("dbó��(�Է�) �Ϸ�");

		// �̵��� ���������� ó��
		NextPage nextPage = new NextPage();
		
		// ȸ������ ����
		if (result != 0) {
			nextPage.setPageName("./user/login.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// ȸ������ ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "ȸ�����Կ� ���� �ϼ̽��ϴ�.");
			return nextPage;
		}
		
	}

}
