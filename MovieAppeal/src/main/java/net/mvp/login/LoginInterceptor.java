package net.mvp.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
		if(session.getAttribute("dest")==null) {
			saveDest(request);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		Object usersDTO = modelMap.get("LoginDTO");
		if(usersDTO != null) {
			logger.info("setAttribute");
			session.setAttribute(LOGIN, usersDTO);
			String url = (String)request.getSession().getAttribute("dest");
			response.sendRedirect(url);
			
		}		
	}
	
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		if(query == null || query.equals("null")) {
			query ="";
		}else {
			query = "?"+query;			
		}
		
		if(req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
