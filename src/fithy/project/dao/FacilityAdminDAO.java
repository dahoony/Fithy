package fithy.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fithy.project.dto.FacilityAdmin;
import fithy.project.util.DBUtil;

public class FacilityAdminDAO {

	// ------------------------------------------------
	private static FacilityAdminDAO dao = new FacilityAdminDAO();

	private FacilityAdminDAO() {

	}

	public static FacilityAdminDAO getInstance() {
		return dao;
	}
	// -------------------------------------------------

	// FaRegister----------------------------------
	public int facilityAdminInsert(FacilityAdmin faAdmin) {
		System.out.println("facilityAdminInsert()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "insert into f_admin values('FAN'||lpad(fa_code_seq.nextval, 7, '0'), ?, ?, ?, ?)";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faAdmin.getFaId());
			pState.setString(2, faAdmin.getFaPw());
			pState.setString(3, faAdmin.getFaName());
			pState.setString(4, faAdmin.getFaNum());

			return pState.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState);
		}
	}

	// FaIdCheck ----------------------------------
	public int adminIdCheck(String faId) {
		System.out.println("adminIdCheck()");

		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;

		con = DBUtil.getConnect();

		String sql = "select * from f_admin where fa_id = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faId);

			rs = pState.executeQuery();

			if (rs.next()) {
				return 0;
			}

			else {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}

	// FaDelete -----------------------------------
	public int adminDelete(String faId) {
		System.out.println("adminDelete()");

		Connection con = null;
		PreparedStatement pState = null;

		con = DBUtil.getConnect();

		String sql = "delete from f_admin where fa_id = ?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faId);

			return pState.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			DBUtil.close(con, pState);
		}
	}

	// FaDetail------------------------------------
	public FacilityAdmin adminDetail(String fa_id) {
		System.out.println("adminDetail()");

		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;
		FacilityAdmin fadmin = new FacilityAdmin();

		System.out.println("adminDetail : " + fa_id);
		con = DBUtil.getConnect();

		String sql = "select fa_code, fa_id, fa_name, fa_phonenum from f_admin where fa_id=?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, fa_id);

			rs = pState.executeQuery();

			while (rs.next()) {
				fadmin.setFaCode(rs.getString("fa_code"));
				fadmin.setFaId(rs.getString("fa_id"));
				fadmin.setFaName(rs.getString("fa_name"));
				fadmin.setFaNum(rs.getString("fa_phonenum"));
			}
			return fadmin;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.close(con, pState, rs);
		}
	}

	
	// FaLogin ------------------------------------
	public FacilityAdmin adminLogin(String faId, String faPw) {
		System.out.println("adminLogin()");

		Connection con = null;
		PreparedStatement pState = null;
		ResultSet rs = null;
		FacilityAdmin fadmin = null;

		con = DBUtil.getConnect();

		String sql = "select fa_id, fa_password, fa_name, fa_code from f_admin where fa_id=? and fa_password=?";

		try {
			pState = con.prepareStatement(sql);

			pState.setString(1, faId);
			pState.setString(2, faPw);

			rs = pState.executeQuery();

			if (rs.next()) {
				fadmin = new FacilityAdmin(rs.getString("fa_code"), rs.getString("fa_Id"), rs.getString("fa_name"));
			}

			DBUtil.close(con, pState, rs);
			return fadmin;
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.close(con, pState, rs);
			return null;
		}
	}

}
