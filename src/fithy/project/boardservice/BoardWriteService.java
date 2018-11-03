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
		
		// 1. 요청 파라미터 처리
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		HttpSession session = request.getSession();
		String uCode = (String)session.getAttribute("uCode"); //세션 영역에 저장된 값
		
		System.out.println("uCode : " + uCode);
		System.out.println("bTitle : " + bTitle);
		System.out.println("bContent : " + bContent);
		
		// 2. DB 처리, 결과 처리
		int result = BoardDAO.getInstance().boardInsert(uCode, bTitle, bContent);
		
		System.out.println("DB 처리 완료");
		
		// 4. 이동할 다음 페이지 처리
		NextPage nextPage = new NextPage();
		
		
		// 입력 성공
		if(result != 0) {
			nextPage.setPageName("./board/boardList.jsp");
			nextPage.setRedirect(true);
			return nextPage;
		} 
		// 입력 실패
		else {
			nextPage.setPageName("./error/error.jsp");
			nextPage.setRedirect(false);
			request.setAttribute("errorMessage", "글쓰기 실패");
			return nextPage;
		}
		
	}

}
