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
		// 예약 추가 시 session에 예약 코드 저장 ! null이냐 아니냐에 머신 러닝 학습 할지 말지 if문
		System.out.println("ReservationFriendService()");
		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// 요청 파라미터 처리
		String line = null;
		String strResult = null;

		String rCode = (String) session.getAttribute("rCode");
		

		Process p = null;
		BufferedReader is = null;

		// python의 머신러닝 결과값 받아오기 위한 소스
		if (rCode != null) {
			String cityNames = (String) session.getAttribute("cityName");
			String cityName = cityNames.substring(0,2);
			System.out.println("cityName : "+cityName);
			System.out.println("rCode: " + rCode);
			System.out.println("머닝러신 시작");
			try {
				if (cityName.equals("서울")) {
					System.out.println("서울");
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
				System.out.print("오류");
				;
			}

			System.out.println("군집번호 : " + strResult);

			// DB 처리, 결과 처리
			List<User> list = UserDAO.getInstance().userFriendRecommend(strResult);
			
			ReservationDAO.getInstance().deleteCommunity();
			
			for(int i=0; i<3;i++) {
				JSONObject obj = new JSONObject();
				obj.put("uId",list.get(i).getUserId());
				obj.put("uName", list.get(i).getUserName());
				jsonArray.add(obj);
			}//3등까지만 나오게 하기
			
			response.setCharacterEncoding("UTF-8");
			
			try {
				out = response.getWriter();// jsp로 데이터를 넘겨주기 위해 사용
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(jsonArray);// 데이터를 jsp파일에 있는 ajax로 넘겨줌
		}
		return null;// 현재 페이지에서 처리하기 위해서 nextPage는 null로 반환
	}

}