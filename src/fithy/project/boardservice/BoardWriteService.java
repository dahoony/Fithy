package fithy.project.boardservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fithy.project.dao.BoardDAO;
import fithy.project.dto.Board;
import fithy.project.util.NextPage;
import fithy.project.util.Service;

public class BoardWriteService implements Service {

	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("BoardWriteService()");
		
		// 1. ��û �Ķ���� ó��
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		HttpSession session = request.getSession();
		String uCode = (String)session.getAttribute("uCode"); //���� ������ ����� ��
		
		System.out.println("uCode : " + uCode);
		System.out.println("bTitle : " + bTitle);
		System.out.println("bContent : " + bContent);
		
		// 2. DB ó��, ��� ó��
		int result = BoardDAO.getInstance().boardInsert(uCode, bTitle, bContent);
		
		System.out.println("DB ó�� �Ϸ�");
		
		// 4. �̵��� ���� ������ ó��
		NextPage nextPage = new NextPage();
		
		
		// �Է� ����
		if(result != 0) {
			nextPage.setPageName("./board/boardList.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} 
		// �Է� ����
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "�۾��� ����");
			return nextPage;
		}
		
	}

}
