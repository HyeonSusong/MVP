package net.mvp.login;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.net.ssl.SSLPermission;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.mvp.users.UsersDTO;

@Controller
public class LoginController {
	
	@Autowired
	@Inject
	LoginDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
/// 일반 로그인
	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST,  produces = "application/json")
	@ResponseBody  //
	public Map<Object, Object> signin(@RequestBody Map<Object, Object>lmap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Map<Object, Object> map= new HashMap<Object, Object>();
		LoginDTO ldto=new LoginDTO();
		ldto.setU_id((String)lmap.get("u_id"));
		ldto.setU_pwd((String)lmap.get("u_pwd"));
		int cnt = 0;
		cnt += dao.dbLoginidcheck(ldto);
		cnt += dao.dbLoginPwdcheck(ldto);
		if(cnt == 2) {
			UsersDTO udto = dao.dbLogin(ldto);
			session.setAttribute("LOGIN", udto);
			map.put("cnt", cnt);
			return map;
		}
		else {
			map.put("cnt", cnt);
			return map;
		}

	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.removeAttribute("LOGIN");
		String url = "main";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
/*	@RequestMapping("/test.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		String url = "test";
		LoginDTO ldto=new LoginDTO();
		ldto.setU_id("shs6337");
		ldto.setU_pwd("spfl!0925");
		System.out.println("1"+ldto.getU_id()+ldto.getU_pwd());
		UsersDTO udto=dao.dbLoginCount(ldto);
		System.out.println(udto.getU_mygenre());
		System.out.println("2");
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}*/
}
