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
	
	@RequestMapping("/signup.do")
	public String Signup() {
		return "signup";
	}
	
	@RequestMapping("/usercreate.do")
	public ModelAndView usercreate(usersDTO udto) {
		ModelAndView mav = new ModelAndView();
		udto.setU_mail(udto.getU_mail_id()+"@"+udto.getU_mail_domain());
		System.out.println(udto.getU_mygenre());
		udao.dbuserInsert(udto);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String userid) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = udao.dbidcheck(userid);
        map.put("cnt", count);
       return map;	
	}
	
	@RequestMapping("/mailcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody Map<Object, Object> mail) {
        int count = 0;
        String u_mail = (String)mail.get("u_mail_id")+"@"+mail.get("u_mail_domain");
        System.out.println(u_mail);
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = udao.dbmailcheck(u_mail);
        map.put("cnt", count);
       return map;	
	}
}