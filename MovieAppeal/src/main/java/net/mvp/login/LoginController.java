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
			if(udto.getU_lock().equals("Y")){
				cnt = -1;
				map.put("cnt", cnt);
				return map;
			}
			if(udto.getU_verify().equals("N")) {
				cnt = -2;
				map.put("cnt", cnt);
				return map;
			}
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
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("LOGIN");
		String url = "redirect:/main.do";
		return url;
	}
	
}
