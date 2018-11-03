package fithy.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import fithy.project.dto.Reservation;
import fithy.project.util.DBUtil;

public class ReservationDAO {
	private static ReservationDAO dao = new ReservationDAO();

	private ReservationDAO() {
	}

	public static ReservationDAO getInstance() {
		return dao;
	}

	//예약 확인하는 함수
	public ArrayList<String> reservationCheck(String fcName, Date reDate, String kindCode) {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		ResultSet rs = null;
		
		ArrayList<String> reArray = new ArrayList<>();

		String findFcCode = findFcCode(fcName);

		if (findFcCode.equals("")) {
			return null;
		} // 에러일 때 -1 반환
		String sql = "select request_time from reservation where f_code = '"+findFcCode+"' and request_date = '"+reDate+"' and k_code='"+kindCode+"'";
		
		try {
			pState = con.prepareStatement(sql);
			
			rs = pState.executeQuery();
			
			while(rs.next()) {
				reArray.add(rs.getString("request_time"));
			}
			
			return reArray;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	// 예약 확인을 하기 위해 시설 이름에 맞게 시설 코드를 반환하는 함수
	public String findFcCode(String fcName) {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		ResultSet rs = null;
		String fcCode = "";

		String sql = "select f_code from facility where f_name = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, fcName);

			rs = pState.executeQuery();

			if (rs.next()) {
				fcCode = rs.getString("f_code");
			}

			DBUtil.close(con, pState, rs);
			return fcCode;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState, rs);
			return "";
		}
	}

	// 모든 시설 이름을 출력하기 위한 함수
	public ArrayList<Reservation> reservationSelect() {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		ResultSet rs = null;
		ArrayList<Reservation> fNameArray = new ArrayList<>();

		String sql = "select f_code,f_name from facility order by f_name";

		try {
			pState = con.prepareStatement(sql);

			rs = pState.executeQuery();

			while (rs.next()) {
				fNameArray.add(new Reservation(rs.getString("f_code"), rs.getString("f_name")));
			}

			DBUtil.close(con, pState, rs);
			return fNameArray;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState, rs);
			return null;
		}

	}

	// 지역별로 리스트 띄어주기
	public ArrayList<Reservation> reservationCityList(String cityName) {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		ResultSet rs = null;

		ArrayList<Reservation> cityArray = new ArrayList<>();

		String sql = "select f_code, f_name from facility where f_address like '%" + cityName + "%' order by f_name";

		try {
			pState = con.prepareStatement(sql);

			rs = pState.executeQuery();

			while (rs.next()) {
				cityArray.add(new Reservation(rs.getString("f_code"), rs.getString("f_name")));
			}
			DBUtil.close(con, pState, rs);
			return cityArray;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState, rs);
			return null;
		}
	}
	
	// 예약 추가하는 함수
	public int reservationInsert(String usCode, String kindCode, String fcName, Date date, String time) {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		int result = 0;
		String fcCode = findFcCode(fcName);
		System.out.println(usCode+","+ kindCode+","+date+","+time+","+fcCode);
		String sql = "insert into reservation values('RE2'||lpad(r_code_seq.nextval,7,'0'),?,default,?,?,?,?)";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, usCode);
			pState.setString(2, kindCode);
			pState.setString(3, fcCode);	
			pState.setDate(4, date);
			pState.setString(5, time);

			result = pState.executeUpdate();

			DBUtil.close(con, pState);
			return result;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState);
			return 0;
		}
	}

	// 예약 취소하는 함수
	public int reservationDelete(Date deleteDate, String deleteTime, String deleteFcName, String deleteKindCode) {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;

		String findFcCode = findFcCode(deleteFcName);

		if (findFcCode.equals("")) {// 에러일 때 -1반환 함수 종료
			return -1;
		}

		String sql = "delete reservation where request_date = ? and request_time = ? and f_code = ? and k_code = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setDate(1, deleteDate);
			pState.setString(2, deleteTime);
			pState.setString(3, findFcCode);
			pState.setString(4, deleteKindCode);

			int result = pState.executeUpdate();

			DBUtil.close(con, pState);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState);
			return -1;
		}
	}
	
	//session 영역으로 python 실행 될지 안될지 판단해주는 함수
	public String reservationCodeSelect(String usCode) {
		System.out.println("reservationCodeSelect()");
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		ResultSet rs = null;
		System.out.println(usCode);
		String rCode = "";
		
		String sql = "select r_code from reservation where u_code = '"+usCode+"' order by r_code";

		try {
			pState = con.prepareStatement(sql);

			rs = pState.executeQuery();

			while (rs.next()) {
				rCode = rs.getString("r_code");
			}
			DBUtil.close(con, pState, rs);
			return rCode;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState, rs);
			return null;
		}
	}
	
	
	public int deleteCommunity() {
		Connection con = null;
		con = DBUtil.getConnect();

		PreparedStatement pState = null;
		
		int result = 0;
		
		String sql = "delete from community";

		try {
			pState = con.prepareStatement(sql);

			result = pState.executeUpdate();
			DBUtil.close(con, pState);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBUtil.close(con, pState);
			return 0;
		}
	}
	
}
