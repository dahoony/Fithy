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

		// ��û �Ķ����
		HttpSession session = request.getSession();
		
		String fcName = (String) session.getAttribute("fcName");

		String faCode = (String) session.getAttribute("faCode");
		
		// DB ó��
		String fcCode = FacilityDAO.getInstance().fcCodeGet(faCode, fcName); 
		
		String kCode = FacilityDAO.getInstance().priceDetail(fcCode); 
		
		System.out.println("kCode : " + kCode);
		System.out.println("fcName : " + fcName);
		System.out.println("faCode : " + faCode);
		System.out.println("fcCode : " + fcCode);
		
		
		// price table ����
		FacilityDAO.getInstance().priceDelete(fcCode, kCode);
		System.out.println("price table ���� ����");
		
		// facility table  ����
		int result = FacilityDAO.getInstance().facilityDelete(faCode, fcName);
		System.out.println("facility table ���� ����");

		// 4. �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		if (result != 0) {
			System.out.println("�ü� ���� ����");
			nextPage.setPageName("./user/faPage.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMsg", "�ü� ���� ����");
			return nextPage;
		}
	}

}
