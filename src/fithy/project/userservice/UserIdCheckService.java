package fithy.project.userservice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.dao.UserDAO;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class UserIdCheckService implements Service {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("UserIdCheckService execute()");
		
		// 夸没 颇扼固磐 贸府
		String userId = request.getParameter("userId");
		
		System.out.println(userId);
		
		int result = 0;
		
		// DB 贸府, 搬苞 贸府
		result = UserDAO.getInstance().userIdCheck(userId);
		
		System.out.println(result);
		
		
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print(result);
		
		return null;
	}

}
