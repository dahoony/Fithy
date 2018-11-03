package fithy.project.userservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.UserDAO;
import fithy.project.dto.User;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserDetailService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("UserDetailService execute()");
		
		HttpSession session = request.getSession();
		JSONArray jsonArray = new JSONArray();//json 타입으로 ajax에 넘겨 주기위해서 사용
		
		PrintWriter out =null;
		// 요청 파라미터 처리
		String id = (String)session.getAttribute("uId");//session 영역에 저장되있는 id값을 가져오기 위해 사용
		System.out.println("검색회원 ID : " + id);//제대로 들어갔는지 확인하기 위해서 써줌 지워도 상관 x
		
		// DB 처리  (DAO로 가도록)
		User user = UserDAO.getInstance().userSelectById(id);//회원의 개인정보를 출력해주기 위해서 사용
		
		JSONObject obj = new JSONObject();
		obj.put("userName", user.getUserName());
		obj.put("userGender", user.getUserGender());
		obj.put("userDate", user.getUserAge());
		obj.put("phoneNum", user.getUserPhoneNum());
		obj.put("userAddress", user.getUserAddress());
		obj.put("userFavoriteKind", user.getUserFavoriteKind());
		obj.put("userJob", user.getUserJob());
		jsonArray.add(obj);
		
		response.setCharacterEncoding("UTF-8");//한글 인코딩 해주기 위해서 해줌
		System.out.println(jsonArray);
		try {
			out = response.getWriter();//jsp로 데이터를 넘겨주기 위해 사용
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(jsonArray);//데이터를 jsp파일에 있는 ajax로 넘겨줌
		
		return null;//현재 페이지에서 처리하기 위해서 nextPage는 null로 반환
	}

}
