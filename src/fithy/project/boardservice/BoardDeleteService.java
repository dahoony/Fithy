package fithy.project.boardservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.util.NextPage;
import fithy.project.util.Service;
import fithy.project.dao.BoardDAO;
import fithy.project.dto.Board;

public class BoardDeleteService implements Service {

	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//delete 삭제 기능 --------------------------------------
		String commentsNum = request.getParameter("commentsnum");
		String num = request.getParameter("num");
		
//		int result = BoardDAO.getInstance().deleteComments(Integer.parseInt(commentsNum));
//		System.out.println(result);
		
		
		
		return null;
	}

}
