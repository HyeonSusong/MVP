package net.mvp.login;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping("/loginPost.do")
	@ResponseBody
	public Map<Object, Object> signin(@RequestBody Map<Object, Object>lmap,HttpSession session) throws Exception {
		Map<Object, Object> map= new HashMap<Object, Object>();
		LoginDTO ldto=new LoginDTO();
		ldto.setU_id((String)lmap.get("u_id"));
		ldto.setU_pwd((String)lmap.get("u_pwd"));
		UsersDTO udto=dao.dbLoginCount(ldto);
		if(udto==null)
			{
			String msg = "아이디 또는 비밀번호가 잘못되었습니다.";
			map.put("msg", msg);
			map.put("UsersDTO",null);
			return map;
			}
		map.put("UsersDTO",udto);
		return map;
	}
	
	@RequestMapping("/loginout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("login");
		String url = "main";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
}
