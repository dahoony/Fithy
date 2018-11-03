package fithy.project.facilityservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.FacilityDAO;
import fithy.project.dto.Facility;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FcDetailService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FcDetailService()");

		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// ��û �Ķ���� ó��
		String faId = (String) session.getAttribute("faId");
		String faCode = (String) session.getAttribute("faCode");

		System.out.println("�˻�ȸ�� ID : " + faId);
		System.out.println("�˻�ȸ�� CODE : " + faCode);

		// DB ó��
		Facility facility = FacilityDAO.getInstance().facilityDetail(faCode);
		System.out.println(facility);

		// DB ��� ó��
		JSONObject obj = new JSONObject();
	
		// �ü� ����
		obj.put("fcName", facility.getFcName());
		obj.put("fcAddress", facility.getFcAddress());
		obj.put("fcNum", facility.getFcNum());
		
		jsonArray.add(obj);
		
		session.setAttribute("fcName", facility.getFcName());
		session.setAttribute("fcCode", facility.getFcCode());
		session.setAttribute("kCode", facility.getkCode());
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
