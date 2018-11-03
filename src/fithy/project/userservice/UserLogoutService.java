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
		// 요청 파라미터 처리
		String userId = (String)session.getAttribute("uId");
		System.out.println(userId);
		// DB 처리
//		int result = UserDAO.getInstance().userLogin(userId, userPw);
		// 이동할 다음페이지 처리
		NextPage nextPage = new NextPage();
		
		// ------------------------------------로그아웃 결과
		// 성공
		if (userId != null) {
			session.invalidate();
			UserDAO.getInstance().logout_delete(userId);
			nextPage.setPageName("./index.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} // 실패
		else {
			nextPage.setPageName("./errors/error.jsp");
			nextPage.setRedirect(false);
			return nextPage;
		}
	}

}
