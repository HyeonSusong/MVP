package net.mvp.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.mvp.users.UsersDTO;


public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "LOGIN";
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session= request.getSession();
		response.setCharacterEncoding("EUC-KR");
		if(session.getAttribute(LOGIN) == null) { 
			PrintWriter writer = response.getWriter();
	     writer.println("<script type='text/javascript'>");
	     writer.println("alert('로그인이 필요한 서비스입니다');");
	     writer.println("location.href='/administrator/adminlogin.do'");
	     writer.println("</script>");
	     writer.flush();
	     saveDest(request);
		  return false;
		}else {
			UsersDTO dto = (UsersDTO)session.getAttribute(LOGIN);
			String identity = dto.getU_verify();
			if(identity.equals("a")) {
			return true;
			}
			PrintWriter writer = response.getWriter();
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('허용되지 않은 접근입니다');");
		     writer.println("location.href='/main.do'");
		     writer.println("</script>");
		     writer.flush();
		    session.removeAttribute(LOGIN);
			return false;
		}
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
				System.out.println("실패");
				
			}
	}
	
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		System.out.println(query);
		if(query == null || query.equals("null")) {
			query ="";
		}else {
			query = "?"+query;			
		}
		
		if(req.getMethod().equals("GET")) {
			req.getSession().setAttribute("adDest", uri+query);
		}
	}

}
