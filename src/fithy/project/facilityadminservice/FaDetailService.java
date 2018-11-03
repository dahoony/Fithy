package fithy.project.facilityadminservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.dto.FacilityAdmin;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaDetailService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaDetailService()");

		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// ��û �Ķ���� ó��
		String faId = (String) session.getAttribute("faId");
		String faCode = (String) session.getAttribute("faCode");

		System.out.println("�˻�ȸ�� ID : " + faId);
		System.out.println("�˻�ȸ�� CODE : " + faCode);

		// DB ó��
		FacilityAdmin fadmin = FacilityAdminDAO.getInstance().adminDetail(faId);

		// ��� ó��
		JSONObject obj = new JSONObject();

		// ������ ����
		obj.put("faName", fadmin.getFaName());
		obj.put("faNum", fadmin.getFaNum());
		
		jsonArray.add(obj);
		response.setCharacterEncoding("UTF-8");

		try {
			out = response.getWriter();// jsp�� �����͸� �Ѱ��ֱ� ���� ���
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(jsonArray);// �����͸� jsp���Ͽ� �ִ� ajax�� �Ѱ���
		return null;// ���� ���������� ó���ϱ� ���ؼ� nextPage�� null�� ��ȯ
	}

}
