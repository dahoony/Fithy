package fithy.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fithy.project.dto.Facility;
import fithy.project.util.DBUtil;

public class FacilityDAO {

	// ------------------------------------------------
	private static FacilityDAO dao = new FacilityDAO();

	private FacilityDAO() {

	}

	public static FacilityDAO getInstance() {
		return dao;
	}
	// -------------------------------------------------

	// FcRegister----------------------------------
	public int facilityInsert(Facility facility) {
		System.out.println("facilityInsert()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "insert into facility values('FCN'||lpad(fc_code_seq.nextval,7,'0'),?,?,?,?)";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, facility.getFaCode());
			pState.setString(2, facility.getFcAddress());
			pState.setString(3, facility.getFcNum());
			pState.setString(4, facility.getFcName());

			return pState.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState);
		}

	}
	
	// FcDetail----------------------------------
		public Facility facilityDetail(String fa_code) {
			System.out.println("facilityDetail()");

			Connection con = null;
			PreparedStatement pState = null;
			ResultSet rs = null;
			Facility facility = new Facility();
			
			System.out.println("facilityDetail : " + fa_code);
			con = DBUtil.getConnect();

			String sql = "select f_name, f_address, f_phonenum from facility where fa_code=?";

			try {
				pState = con.prepareStatement(sql);

				pState.setString(1, fa_code);
				
				rs = pState.executeQuery();

				while (rs.next()) {
					facility.setFcName(rs.getString("f_name"));
					facility.setFcAddress(rs.getString("f_address"));
					facility.setFcNum(rs.getString("f_phonenum"));
				}
				return facility;

			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				DBUtil.close(con, pState, rs);
			}

		}
		// PriceDetail----------------------------------
		public String priceDetail(String f_code) {
			System.out.println("priceDetail()");

			Connection con = null;
			PreparedStatement pState = null;
			ResultSet rs = null;
			Facility facility = new Facility();
			
			System.out.println("PriceDetail : " + f_code);
			con = DBUtil.getConnect();

			String sql = "select k_code from price where f_code=?";

			try {
				pState = con.prepareStatement(sql);

				pState.setString(1, f_code);
				
				rs = pState.executeQuery();

				while (rs.next()) {
					facility.setkCode(rs.getString("k_code"));
				}
				return facility.getkCode();

			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			} finally {
				DBUtil.close(con, pState, rs);
			}

		}

	// FcDelete -----------------------------관리자코드와 시설명으로 삭제
	// price table 삭제 -> facility table 삭제
	public void priceDelete(String fcCode, String kCode) {
		System.out.println("priceDelete()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "delete from price where f_code = ? and k_code = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, fcCode);
			pState.setString(2, kCode);

			pState.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pState);
		}
	}

	public int facilityDelete(String faCode, String fcName) {
		System.out.println("facilityDelete()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "delete from facility where fa_code = ? and f_name = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faCode);
			pState.setString(2, fcName);

			return pState.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState);
		}
	}

	// FcRegister(price) -----------------------------------------
	public int priceInsert(String fcCode, String kCode, int price) {
		System.out.println("priceInsert()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "insert into price values(?,?,?)";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, fcCode);
			pState.setString(2, kCode);
			pState.setInt(3, price);

			return pState.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState);
		}
	}

	// ================getCode==================================================
	// 시설코드(fcCode)반환 함수(1) - deleteService에서 사용
	public String fcCodeGet(String faCode, String fcName) {
		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;
		Facility FcCode = new Facility();

		con = DBUtil.getConnect();

		String sql = "select f_code from facility where fa_code = ? and f_name = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faCode);
			pState.setString(2, fcName);

			rs = pState.executeQuery();

			while (rs.next()) {
				FcCode.setFcCode(rs.getString("f_code"));
			}
			return FcCode.getFcCode();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}

	// 시설코드(fcCode)반환 함수(2) - registerService에서 사용
	public String fcCodeGet(String fcAddress, String fcNum, String fcName) {
		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;
		Facility FcCode = null;

		con = DBUtil.getConnect();

		String sql = "select f_code from facility where f_address = ? and f_phonenum = ? and f_name = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, fcAddress);
			pState.setString(2, fcNum);
			pState.setString(3, fcName);

			rs = pState.executeQuery();

			while (rs.next()) {
				FcCode = new Facility(rs.getString("f_code"));
			}
			return FcCode.getFcCode();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}

	// 관리자코드(faCode) 반환함수(session에 저장된 관리자 아이디를 통해서)
	public String faCodeGet(String faId) {
		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;
		Facility FaCode = new Facility();

		con = DBUtil.getConnect();

		String sql = "select fa_code from f_admin where fa_id = ?";
		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faId);

			rs = pState.executeQuery();

			while (rs.next()) {
				FaCode.setFaCode(rs.getString("fa_code"));
			}
			return FaCode.getFaCode();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}
	

}
