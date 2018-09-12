package net.mvp.users;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

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

@Controller
public class usersController {
	
	@Autowired
	@Inject
	usersDAO udao;
	
	private static final Logger logger = LoggerFactory.getLogger(usersController.class);
	
	@RequestMapping("/login.do")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		String url = "login";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	@RequestMapping("/signin.do")
	public ModelAndView signin() {
		ModelAndView mav = new ModelAndView();
		String url = "main";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping("/signup.do")
	public ModelAndView Signup() {
		ModelAndView mav = new ModelAndView();
		String url = "signup";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	//////////////////// 유저 생성  ///////////////////////////////////////
	
	@RequestMapping("/usercreate.do")
	public ModelAndView usercreate(usersDTO udto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(udto.getU_mygenre());
		udao.dbuserInsert(udto);
		String url = "main";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	// AJAX id check
	@RequestMapping("/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userid) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = udao.dbidcheck(userid);
        map.put("cnt", count);
       return map;	
	}
	
	//  AJAX mail check
	@RequestMapping("/mailcheck.do")
    @ResponseBody
    public Map<Object, Object> mailcheck(@RequestBody String u_mail) {
        int count = 0;
        System.out.println(u_mail);
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = udao.dbmailcheck(u_mail);
        map.put("cnt", count);
       return map;	
	}
}