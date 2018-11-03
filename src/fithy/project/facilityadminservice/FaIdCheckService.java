package fithy.project.facilityadminservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaIdCheckService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		
		// ��û �Ķ���� ó��
		String faId = request.getParameter("faId");

		// DB ó��
		int result = FacilityAdminDAO.getInstance().adminIdCheck(faId);

		PrintWriter out = null;

		try {
			out = response.getWriter();
			out.print(result); // out.print�� �ϸ� ���� ajax�� ��
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
