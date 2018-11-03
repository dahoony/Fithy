package fithy.project.reservationservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.ReservationDAO;
import fithy.project.dto.Reservation;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class ReservationCityService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		// 夸没 颇扼固磐 贸府
		String cityName = request.getParameter("cityName");
		System.out.println(cityName);
		
		// DB 贸府, 搬苞 贸府
		ArrayList<Reservation> cityArray = ReservationDAO.getInstance().reservationCityList(cityName);
		
		session.setAttribute("cityName", cityName);//菊 林家 历厘
		
		System.out.println(cityArray);
		JSONArray jsonArray = new JSONArray();
		
		for(Reservation ci : cityArray) {
			JSONObject obj = new JSONObject();
			obj.put("fname",ci.getFacilityName());
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
