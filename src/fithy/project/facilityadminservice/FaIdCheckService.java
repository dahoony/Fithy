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
		
		// 요청 파라미터 처리
		String faId = request.getParameter("faId");

		// DB 처리
		int result = FacilityAdminDAO.getInstance().adminIdCheck(faId);

		PrintWriter out = null;

		try {
			out = response.getWriter();
			out.print(result); // out.print를 하면 값이 ajax로 감
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
