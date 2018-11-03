package fithy.project.reservationservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fithy.project.dao.ReservationDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class ReservationAddService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		// ��û �Ķ���� ó��
		String fcName = request.getParameter("fcName");
		String kindCode = request.getParameter("kindcode");
		Date date = Date.valueOf(request.getParameter("date"));
		String time = request.getParameter("times");
		
		HttpSession session = request.getSession();
		String usCode = (String)session.getAttribute("uCode"); //���� ������ ����� ��
		
		// DB ó��, ��� ó��
		int result = ReservationDAO.getInstance().reservationInsert(usCode, kindCode, fcName, date, time);
		String rCode = ReservationDAO.getInstance().reservationCodeSelect(usCode);
		
		System.out.println(rCode);
		
		session.setAttribute("rCode", rCode);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
		out.print(result);
		
		return null;
	}

}
