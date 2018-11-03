package fithy.project.facilityservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.FacilityDAO;
import fithy.project.dto.Facility;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FcRegisterService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FcRegisterService()");

		// 요청 파라미터 처리
		String fcName = request.getParameter("fcName");
		String fcNum = request.getParameter("fcNum");
		String fcAddress = request.getParameter("fcAddress") + " " + request.getParameter("fcDetailAddress");
		String kCode = request.getParameter("Kind");
		String price = request.getParameter("price");

		int setprice = 0; // String price를 변환
		setprice = Integer.parseInt(price);

		// DB 처리, 결과 처리
		HttpSession session = request.getSession();
		String faCode = (String) session.getAttribute("faCode"); 
		
		// ---------------------시설 등록
		int result = FacilityDAO.getInstance().facilityInsert(new Facility(faCode, fcAddress, fcNum, fcName));
		System.out.println("시설등록 성공");

		// ---------------------가격 등록
		String fcCode = FacilityDAO.getInstance().fcCodeGet(fcAddress, fcNum, fcName);
		FacilityDAO.getInstance().priceInsert(fcCode, kCode, setprice);
		System.out.println("가격등록 성공");

		// 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		// 시설등록 성공
		if (result != 0) {
			nextPage.setPageName("./user/faPage.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// 시설등록 실패
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "회원가입 실패");
			return nextPage;
		}
	}

}
