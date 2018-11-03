package fithy.project.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	public abstract NextPage execute(HttpServletRequest request, HttpServletResponse response);

}
