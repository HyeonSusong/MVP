package net.mvp.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session= request.getSession();
		if(session.getAttribute(LOGIN) == null) { 
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
	     writer.println("<script type='text/javascript'>");
	     writer.println("alert('로그인이 필요한 서비스입니다');");
	     writer.println("history.back();");
	     writer.println("</script>");
	     writer.flush();
		  return false;
		}		
		return true;
	}

}
