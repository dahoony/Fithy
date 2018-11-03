package fithy.project.reservationservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.ReservationDAO;
import fithy.project.dao.UserDAO;
import fithy.project.dto.Facility;
import fithy.project.dto.User;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class ReservationFriendService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// ���� �߰� �� session�� ���� �ڵ� ���� ! null�̳� �ƴϳĿ� �ӽ� ���� �н� ���� ���� if��
		System.out.println("ReservationFriendService()");
		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// ��û �Ķ���� ó��
		String line = null;
		String strResult = null;

		String rCode = (String) session.getAttribute("rCode");
		

		Process p = null;
		BufferedReader is = null;

		// python�� �ӽŷ��� ����� �޾ƿ��� ���� �ҽ�
		if (rCode != null) {
			String cityNames = (String) session.getAttribute("cityName");
			String cityName = cityNames.substring(0,2);
			System.out.println("cityName : "+cityName);
			System.out.println("rCode: " + rCode);
			System.out.println("�Ӵ׷��� ����");
			try {
				if (cityName.equals("����")) {
					System.out.println("����");
					p = Runtime.getRuntime().exec("python C:/connect/seoul_hive_connect.py");
					is = new BufferedReader(new InputStreamReader(p.getInputStream()));
					
					while ((line = is.readLine()) != null) {
						strResult = line;
					}
					System.out.println("strResult 2 : "+strResult);
					if (strResult.equals("seoul hive")) {
						p = Runtime.getRuntime().exec("python C:/connect/kmeans_seoul.py");
						is = new BufferedReader(new InputStreamReader(p.getInputStream()));
						line = null;

						while ((line = is.readLine()) != null) {
							strResult = line;
						}
					}
				} else {

					p = Runtime.getRuntime().exec("python C:/connect/daejeon_hive_connect.py");
					is = new BufferedReader(new InputStreamReader(p.getInputStream()));
					line = null;

					while ((line = is.readLine()) != null) {
						strResult = line;
					}
					System.out.println(strResult);
					if (strResult.equals("daejeon hive")) {
						p = Runtime.getRuntime().exec("python C:/connect/kmeans_daejeon.py");
						is = new BufferedReader(new InputStreamReader(p.getInputStream()));
						line = null;

						while ((line = is.readLine()) != null) {
							strResult = line;
						}
						if (strResult.equals("kmeans daejeon")) {
							p = Runtime.getRuntime().exec("python C:/connect/result_connect.py");
							is = new BufferedReader(new InputStreamReader(p.getInputStream()));
							line = null;

							while ((line = is.readLine()) != null) {
								strResult = line;
							}
						}
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.print("����");
				;
			}

			System.out.println("������ȣ : " + strResult);

			// DB ó��, ��� ó��
			List<User> list = UserDAO.getInstance().userFriendRecommend(strResult);
			
			ReservationDAO.getInstance().deleteCommunity();
			
			for(int i=0; i<3;i++) {
				JSONObject obj = new JSONObject();
				obj.put("uId",list.get(i).getUserId());
				obj.put("uName", list.get(i).getUserName());
				jsonArray.add(obj);
			}//3������� ������ �ϱ�
			
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