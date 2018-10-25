package net.mvp.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "LOGIN";
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session= request.getSession();
		String preurl = request.getHeader("referer");
		
		if(session.getAttribute(LOGIN) == null) { 
			response.setCharacterEncoding("EUC-KR");
			PrintWriter writer = response.getWriter();
			if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
			    writer.println("<script type='text/javascript'>");
			    writer.println("alert('�α����� �ʿ��� �����Դϴ�');");
			    writer.println("$('#loginModal').modal();");
			    writer.println("</script>");
			    writer.flush();

			}
			else {
				writer.println("<script type='text/javascript'>");
				writer.println("alert('�α����� �ʿ��� �����Դϴ�');");
				System.out.println(preurl);
				if(preurl.indexOf(":8080/")<0) {
					writer.println("location.href='http://183.98.215.169:8080/';");	
				}else {
				writer.println("location.href='"+preurl+"';");
				}
				writer.println("</script>");
				writer.flush();
			}
		  return false;
		}
		return true;
	}
	


}
