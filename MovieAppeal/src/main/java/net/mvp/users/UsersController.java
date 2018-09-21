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
public class UsersController {
	
	@Autowired
	@Inject
	UsersDAO udao;
	
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
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
	public ModelAndView usercreate(UsersDTO udto) {
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
	
	// 마이페이지 메인	
	@RequestMapping("/mypage.do")
	public ModelAndView mymenu() {
		ModelAndView mav = new ModelAndView();
		String url = "profile";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	///회원 정보 조회
	@RequestMapping("/myprofile.do")
	public ModelAndView myprofile() {
		ModelAndView mav = new ModelAndView();
		String url = "profile";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	
	//회원 페이지 - 선호하는 영화
	@RequestMapping("/myfavorite.do")
	public ModelAndView myfavorite() {
		ModelAndView mav = new ModelAndView();
		String url = "myfavorite";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}

	//회원 페이지 - 평점을 남긴영화
	@RequestMapping("/myrating.do")
	public ModelAndView myrating() {
		ModelAndView mav = new ModelAndView();
		String url = "myrating";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	
	//회원 페이지 - 나의 게시물
	@RequestMapping("/myreview.do")
	public ModelAndView myreview() {
		ModelAndView mav = new ModelAndView();
		String url = "myreview";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	
	//회원 페이지 - 나의 댓글
	@RequestMapping("/myreply.do")
	public ModelAndView myreply() {
		ModelAndView mav = new ModelAndView();
		String url = "myreply";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}

	//회원 페이지 - 나의 댓글
	@RequestMapping("/userdelete.do")
	public ModelAndView userdelete() {
		ModelAndView mav = new ModelAndView();
		String url = "userdelete";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
}