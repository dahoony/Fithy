package fithy.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fithy.project.util.NextPage;
import fithy.project.util.Service;


/**
 * Servlet implementation class UserServlet
 */
@WebServlet(value = "*.fithy",initParams = {@WebInitParam(name="url",value="/fithy/project/util/url.properties")})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	//<URL,ServiceClassName>
	private Map<String,Service> map = new HashMap<>();//service 객체 생성한 것 담아주는 용도
	
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
		Properties prop = new Properties();
		
		try {
			prop.load(getClass().getResourceAsStream(config.getInitParameter("url")));//inputstream type 으로 읽어오기 위해 쓰는 함수
			
			Iterator<Object> it = prop.keySet().iterator();
			
			while(it.hasNext()) {
				String key = (String) it.next();
				
				Class serviceClass = null;
				Service service = null;
				
				serviceClass = Class.forName(prop.getProperty(key));
				service = (Service) serviceClass.newInstance();
				
				map.put(key, service);
			}
			System.out.println(map);
		} catch (IOException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		super.init(config);
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		int cmdIdx = url.lastIndexOf("/")+1;
		String cmd = url.substring(cmdIdx);
		System.out.println(cmd);
		NextPage nextPage = new NextPage();
		
		System.out.println(map.get(cmd));
		
		Service service = map.get(cmd);
		
		nextPage = service.execute(request, response);
		
		if(nextPage == null) {
			System.out.println("null 반환하면 디진당");
		}
		else {
			if(nextPage.isRedirect()) {
				response.sendRedirect(nextPage.getPageName());
			}else {
				request.getRequestDispatcher(nextPage.getPageName()).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
