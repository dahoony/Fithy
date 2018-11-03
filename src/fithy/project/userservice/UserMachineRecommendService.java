package fithy.project.userservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import fithy.project.dao.UserDAO;
import fithy.project.dto.Facility;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserMachineRecommendService implements Service {
	// ����н��� ���� ���� ������ ��õ �ü� ����Ʈ
	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String recommendKindCode = null;
		String line = null;
		String strResult = "";

		// ��û �Ķ���� ó��
		HttpSession session = request.getSession();// id,ȸ���ڵ带 ���ǿ����� �����ҷ��� ����

		String userId = (String) session.getAttribute("uId");
		if (userId != null) {
			JSONArray jsonArray = new JSONArray();

			PrintWriter out = null;

			// python�� �ӽŷ��� ����� �޾ƿ��� ���� �Լ�
			try {
				Process p = Runtime.getRuntime().exec("python C:/connect/oracle_connect.py");
				BufferedReader is = new BufferedReader(new InputStreamReader(p.getInputStream()));
				line = is.readLine();
				while ((line = is.readLine()) != null) {
					strResult = line;
				}

				System.out.println("oracle end : " + strResult);
				if (strResult.equals("oracle end")) {
					p = Runtime.getRuntime().exec("python C:/connect/hive_connect.py");
					is = new BufferedReader(new InputStreamReader(p.getInputStream()));
					line = null;

					while ((line = is.readLine()) != null) {
						strResult = line;
					}
					System.out.println("hive end : " + strResult);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.print("����");
				;
			}
			if (strResult.equals("0")) {
				recommendKindCode = "SW";
			} else if (strResult.equals("1")) {
				recommendKindCode = "SH";
			} else if (strResult.equals("2")) {
				recommendKindCode = "BA";
			} else if (strResult.equals("3")) {
				recommendKindCode = "TE";
			} else if (strResult.equals("4")) {
				recommendKindCode = "FO";
			} else if (strResult.equals("5")) {
				recommendKindCode = "BD";
			}

			System.out.println(recommendKindCode);

			// DB ó��, ��� ó��
			ArrayList<Facility> machineRecommendName = UserDAO.getInstance().machineRecommendSelect(userId,
					recommendKindCode);

			System.out.println("machineRecommendName : " + machineRecommendName.toString());

			for (Facility facility : machineRecommendName) {
				JSONObject obj = new JSONObject();
				obj.put("maFcName", facility.getFcName());
				obj.put("maFcAddress", facility.getFcAddress());
				obj.put("machinKindCode", recommendKindCode);
				jsonArray.add(obj);
			}
			response.setCharacterEncoding("UTF-8");

			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			out.print(jsonArray);
		}
		return null;
	}

}
