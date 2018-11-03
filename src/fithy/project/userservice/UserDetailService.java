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
		JSONArray jsonArray = new JSONArray();//json Ÿ������ ajax�� �Ѱ� �ֱ����ؼ� ���
		
		PrintWriter out =null;
		// ��û �Ķ���� ó��
		String id = (String)session.getAttribute("uId");//session ������ ������ִ� id���� �������� ���� ���
		System.out.println("�˻�ȸ�� ID : " + id);//����� ������ Ȯ���ϱ� ���ؼ� ���� ������ ��� x
		
		// DB ó��  (DAO�� ������)
		User user = UserDAO.getInstance().userSelectById(id);//ȸ���� ���������� ������ֱ� ���ؼ� ���
		
		JSONObject obj = new JSONObject();
		obj.put("userName", user.getUserName());
		obj.put("userGender", user.getUserGender());
		obj.put("userDate", user.getUserAge());
		obj.put("phoneNum", user.getUserPhoneNum());
		obj.put("userAddress", user.getUserAddress());
		obj.put("userFavoriteKind", user.getUserFavoriteKind());
		obj.put("userJob", user.getUserJob());
		jsonArray.add(obj);
		
		response.setCharacterEncoding("UTF-8");//�ѱ� ���ڵ� ���ֱ� ���ؼ� ����
		System.out.println(jsonArray);
		try {
			out = response.getWriter();//jsp�� �����͸� �Ѱ��ֱ� ���� ���
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(jsonArray);//�����͸� jsp���Ͽ� �ִ� ajax�� �Ѱ���
		
		return null;//���� ���������� ó���ϱ� ���ؼ� nextPage�� null�� ��ȯ
	}

}
