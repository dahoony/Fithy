package fithy.project.reservationservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.ReservationDAO;
import fithy.project.dto.Reservation;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class ReservationCheckService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ReservationCheckService()");
		
		JSONArray jsonArray = new JSONArray();
		
		// 요청 파라미터 처리
		Date date = Date.valueOf(request.getParameter("date"));// String -> Date 형변환
		String fcName = request.getParameter("fcName");
		String kindCode = request.getParameter("kindcode");
		System.out.println(date);
		
		// DB 처리, 결과 처리
		ArrayList<String> reArray = ReservationDAO.getInstance().reservationCheck(fcName, date, kindCode);
		
		JSONObject obj = null;
		
		for(int i=0;i<reArray.size();i++) {
			obj = new JSONObject();
			obj.put("time", reArray.get(i));
			jsonArray.add(obj);
		}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jsonArray);
		out.print(jsonArray);

		return null;
	}

}
