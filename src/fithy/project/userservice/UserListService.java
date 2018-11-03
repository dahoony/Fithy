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
		
		// DB 처리, 결과 처리
		ArrayList<User> userArray = UserDAO.getInstance().userSelectAll();
		
		request.setAttribute("userArray", userArray);
		System.out.println("회원 리스트 갯수 : " + userArray.size());
		
		
		// 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();
		
		nextPage.setPageName("./user/list.jsp");
		nextPage.setRedirect(false);

		
		return nextPage;
	}

}
