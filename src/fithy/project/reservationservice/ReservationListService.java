package fithy.project.reservationservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.ReservationDAO;
import fithy.project.dto.Reservation;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class ReservationListService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		// DB 처리, 결과 처리
		ArrayList<Reservation> fNameArray = ReservationDAO.getInstance().reservationSelect();
		System.out.println(fNameArray);
		//json -----------------------------
		JSONArray jsonArray = new JSONArray();//[]배열을 의미 ArrayList랑 비슷
		
		for(Reservation re : fNameArray) {
			JSONObject obj = new JSONObject();
			obj.put("fcode", re.getFacilityCode());
			obj.put("fname", re.getFacilityName());
			jsonArray.add(obj);
		}
		
		System.out.println(jsonArray);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(jsonArray);
		return null;
	}

}
