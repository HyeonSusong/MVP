package net.mvp.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.mvp.users.UsersDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		//	saveDest(request);
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		try {
		HttpSession session = request.getSession();
		UsersDTO dto =(UsersDTO)session.getAttribute("LOGIN");
		System.out.println(dto.getU_verify());
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("½ÇÆÐ");
		}
		// TODO Auto-generated method stub
/*		HttpSession session = request.getSession();
		Object UsersDTO = request.getAttribute("UsersDTO");
		System.out.println("5");
		
		if(UsersDTO != null) {
			logger.info("setAttribute");
			session.setAttribute(LOGIN, UsersDTO);
			//String url = (String)request.getSession().getAttribute("dest");
			//response.sendRedirect(url);
			System.out.println("8");
		}
		System.out.println("7");*/
	}
	
/**/
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
