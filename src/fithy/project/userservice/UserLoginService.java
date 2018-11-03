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
		// 요청 파라미터 처리
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		System.out.println("조회 ID : " + userId + " 조회 PW : " + userPw);

		// DB 처리
		User user = UserDAO.getInstance().userLogin(userId, userPw);
		System.out.println("db처리(조회) 완료");
		
		UserDAO.getInstance().loginInsert(user.getUserCode(), userId);
		
		// 이동할 다음페이지 처리
		NextPage nextPage = new NextPage();
		
		HttpSession session = request.getSession();//id,회원코드를 세션영역에 저장할려고 만듬
		// 로그인 성공
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
		// 로그인 실패
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "로그인에 실패 하셨습니다.");
			return nextPage;
		}

	}

}
