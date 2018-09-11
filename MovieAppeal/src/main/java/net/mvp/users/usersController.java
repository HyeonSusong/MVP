package net.mvp.users;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class usersController {
	
	@Autowired
	@Inject
	usersDAO udao;
	
	private static final Logger logger = LoggerFactory.getLogger(usersController.class);
	
	@RequestMapping("/signup.do")
	public String Signup() {
		return "signup";
	}
	
	@RequestMapping("/usercreate.do")
	public ModelAndView usercreate(usersDTO udto) {
		ModelAndView mav = new ModelAndView();
		udao.dbuserInsert(udto);
		mav.setViewName("main.do");
		return mav;
	}
	
}
