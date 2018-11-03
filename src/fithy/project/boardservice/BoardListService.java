package fithy.project.boardservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.BoardDAO;
import fithy.project.dto.Board;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class BoardListService implements Service {

	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("BoardListService()");
	
		// json -----------------------------
		JSONArray jsonArray = new JSONArray();// []�迭�� �ǹ� ArrayList�� ���
		PrintWriter out = null;
		// 2. DB ó��, ��� ó��
		ArrayList<Board> boardArray = BoardDAO.getInstance().boardSelectAll();

		for (Board board : boardArray) {
			JSONObject obj = new JSONObject();
			obj.put("boardNum", board.getBoardNum());
			obj.put("boardTitle", board.getBoardTitle());
			obj.put("userId", board.getUserId());
			obj.put("boardDate", board.getBoardDate().toString());
			jsonArray.add(obj);
		}
		System.out.println(jsonArray);
		// 3. DB ��� ó��
		response.setCharacterEncoding("UTF-8");

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
