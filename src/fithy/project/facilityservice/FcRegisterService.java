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

		// ��û �Ķ���� ó��
		String fcName = request.getParameter("fcName");
		String fcNum = request.getParameter("fcNum");
		String fcAddress = request.getParameter("fcAddress") + " " + request.getParameter("fcDetailAddress");
		String kCode = request.getParameter("Kind");
		String price = request.getParameter("price");

		int setprice = 0; // String price�� ��ȯ
		setprice = Integer.parseInt(price);

		// DB ó��, ��� ó��
		HttpSession session = request.getSession();
		String faCode = (String) session.getAttribute("faCode"); 
		
		// ---------------------�ü� ���
		int result = FacilityDAO.getInstance().facilityInsert(new Facility(faCode, fcAddress, fcNum, fcName));
		System.out.println("�ü���� ����");

		// ---------------------���� ���
		String fcCode = FacilityDAO.getInstance().fcCodeGet(fcAddress, fcNum, fcName);
		FacilityDAO.getInstance().priceInsert(fcCode, kCode, setprice);
		System.out.println("���ݵ�� ����");

		// �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();

		// �ü���� ����
		if (result != 0) {
			nextPage.setPageName("./user/faPage.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		}
		// �ü���� ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "ȸ������ ����");
			return nextPage;
		}
	}

}
