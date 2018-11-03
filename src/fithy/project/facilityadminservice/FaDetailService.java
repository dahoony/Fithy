package fithy.project.facilityadminservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.FacilityAdminDAO;
import fithy.project.dto.FacilityAdmin;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class FaDetailService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FaDetailService()");

		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();

		PrintWriter out = null;

		// 요청 파라미터 처리
		String faId = (String) session.getAttribute("faId");
		String faCode = (String) session.getAttribute("faCode");

		System.out.println("검색회원 ID : " + faId);
		System.out.println("검색회원 CODE : " + faCode);

		// DB 처리
		FacilityAdmin fadmin = FacilityAdminDAO.getInstance().adminDetail(faId);

		// 결과 처리
		JSONObject obj = new JSONObject();

		// 관리자 정보
		obj.put("faName", fadmin.getFaName());
		obj.put("faNum", fadmin.getFaNum());
		
		jsonArray.add(obj);
		response.setCharacterEncoding("UTF-8");

		try {
			out = response.getWriter();// jsp로 데이터를 넘겨주기 위해 사용
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(jsonArray);// 데이터를 jsp파일에 있는 ajax로 넘겨줌
		return null;// 현재 페이지에서 처리하기 위해서 nextPage는 null로 반환
	}

}
