package fithy.project.facilityservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.FacilityDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FcDeleteService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FcDeleteService()");

		// 요청 파라미터
		HttpSession session = request.getSession();
		
		String fcName = (String) session.getAttribute("fcName");

		String faCode = (String) session.getAttribute("faCode");
		
		// DB 처리
		String fcCode = FacilityDAO.getInstance().fcCodeGet(faCode, fcName); 
		
		String kCode = FacilityDAO.getInstance().priceDetail(fcCode); 
		
		System.out.println("kCode : " + kCode);
		System.out.println("fcName : " + fcName);
		System.out.println("faCode : " + faCode);
		System.out.println("fcCode : " + fcCode);
		
		
		// price table 삭제
		FacilityDAO.getInstance().priceDelete(fcCode, kCode);
		System.out.println("price table 삭제 성공");
		
		// facility table  삭제
		int result = FacilityDAO.getInstance().facilityDelete(faCode, fcName);
		System.out.println("facility table 삭제 성공");

		// 4. 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();

		if (result != 0) {
			System.out.println("시설 삭제 성공");
			nextPage.setPageName("./user/faPage.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMsg", "시설 삭제 실패");
			return nextPage;
		}
	}

}
