package fithy.project.userservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.UserDAO;
import fithy.project.dto.Facility;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserFavoriteService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserFavoriteService()");

		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// ��û �Ķ���� ó��
		String uCode = (String) session.getAttribute("uCode");
		String uId = (String) session.getAttribute("uId");
		String uKind = (String) session.getAttribute("uKind");
		String uAd = (String) session.getAttribute("uAddress");
		System.out.println(uAd);

		if (uCode != null) {

			String[] uAdrs = uAd.split(" ");
			String uAddress = uAdrs[0] + " " + uAdrs[1];

			System.out.println("���� ���� ȸ�� ID : " + uId);
			System.out.println("���� ���� ȸ�� CODE : " + uCode);
			System.out.println("KIND : " + uKind);
			System.out.println("uAdrs : " + uAdrs[0]);
			System.out.println("uAdrs : " + uAdrs[1]);

			// DB ó��

			List<Facility> list = UserDAO.getInstance().userFavorite(uKind, uAddress);

			System.out.println(list);
			// DB ��� ó��
			for (Facility facility : list) {
				JSONObject obj = new JSONObject();
				obj.put("fcName", facility.getFcName());
				obj.put("fcAddress", facility.getFcAddress());
				obj.put("kind", uKind);
				jsonArray.add(obj);
			}

			response.setCharacterEncoding("UTF-8");

			try {
				out = response.getWriter();// jsp�� �����͸� �Ѱ��ֱ� ���� ���
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(jsonArray);// �����͸� jsp���Ͽ� �ִ� ajax�� �Ѱ���
		}
		return null;// ���� ���������� ó���ϱ� ���ؼ� nextPage�� null�� ��ȯ
	}

}
