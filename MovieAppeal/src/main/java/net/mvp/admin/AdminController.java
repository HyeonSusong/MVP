package net.mvp.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import net.mvp.admin.movie.MovieDateNow;
import net.mvp.admin.movie.MovieSearchAPI;
import net.mvp.admin.movie.MovieSearchDTO;
import net.mvp.login.LoginDAO;
import net.mvp.login.LoginDTO;
import net.mvp.users.UsersDTO;

@Controller
public class AdminController {
	
	@Inject
	@Autowired
	AdminDAO adao;
	
	@Inject
	@Autowired
	LoginDAO ldao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/// 화면처리 관련 ///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/administrator/main.do")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		String url = "movietable";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping(value = "/administrator/movietable.do")
	public ModelAndView movietable() {
		ModelAndView mav = new ModelAndView();
		String url = "movietable";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	

	@RequestMapping(value = "/administrator/usersmanage.do")
	public ModelAndView usersmanage() {
		ModelAndView mav = new ModelAndView();
		String url = "usersmanage";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping(value = "/administrator/reviewmanage.do")
	public ModelAndView reviewmanage() {
		ModelAndView mav = new ModelAndView();
		String url = "reviewmanage";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping(value = "/administrator/replymanage.do")
	public ModelAndView replymanage() {
		ModelAndView mav = new ModelAndView();
		String url = "replymanage";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping(value = "/administrator/admincreate.do")
	public ModelAndView admincreate() {
		ModelAndView mav = new ModelAndView();
		String url = "admincreate";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	////////////////////////// 영화 추가 관련 /////////////////////////////////////
	MovieDateNow now = new MovieDateNow();
	@Inject
	@Autowired
	MovieSearchAPI msapi;
	
	@RequestMapping(value = "/administrator/movieadd.do")
	public ModelAndView movieadd(MovieSearchDTO mdto, HttpServletRequest req) {
		ArrayList<HashMap<String, Object>> movielist = new ArrayList<HashMap<String, Object>>();
		ModelAndView mav = new ModelAndView();
		if(req.getQueryString()==""||req.getQueryString()==null) {
			mdto.setPrdtStartYear(now.nowyear());
			mdto.setPrdtEndYear(now.nowyear());
		}
		try {
			movielist = msapi.MovieSearch(mdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			HashMap<String,Object> codelist = msapi.MovieCodeSearch();
			mav.addObject("code",codelist);
		} catch (OpenAPIFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String page = mdto.getCurPage()==null ? "" : mdto.getCurPage();
		Map<String,Integer> pageset = msapi.SearchPageNum(page);	
		String url = "movieadd";
		mav.addObject("page",url);
		mav.addObject("pageset",pageset);
		mav.addObject("movielist",movielist);
		System.out.println("웨않됨?");
		mav.setViewName("administratormain");
		return mav;
	}
	
	
	
	
	////// 관리자로그인 화면 관련/////////////////////////////////////////////////////////////////////////
	@RequestMapping("/administrator/adminlogin.do")
	public ModelAndView adminlogin() {
		ModelAndView mav = new ModelAndView();
		String url = "adminlogin";
		mav.addObject("page",url);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping("/administrator/admincheck.do")
	@ResponseBody
	public Map<Object, Object> admincheck(@RequestBody Map<Object,Object> reqmap){
		LoginDTO ldto = new LoginDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		ldto.setU_id((String)reqmap.get("u_id"));
		ldto.setU_pwd((String)reqmap.get("u_pwd"));
		int cnt = 0;
		cnt += ldao.dbLoginidcheck(ldto);
		cnt += ldao.dbLoginPwdcheck(ldto);
		map.put("cnt", cnt);
		return map;
	} //conunt AJAX ADMINLOGIN
	
	@RequestMapping("/administrator/adminloginpost.do")
	public String adminLoginPost(LoginDTO ldto,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String url = "redirect: ";
		UsersDTO udto = ldao.dbLogin(ldto);
		//if(udto.getU_verify().equals("a")) {
		session.setAttribute("LOGIN", udto);
		//}
		try {
		if(session.getAttribute("adDest") !=null){
		url += (String)session.getAttribute("adDest");
		}
		else {
			url += "/administrator/main.do";
		}
		}catch(Exception ex) {
			ex.printStackTrace();
			url += "/administrator/main.do";
		}
		System.out.println(url);
		return url;
	} 

	////////////////////////////////////////////////////////////////////////////////////////////////////
	
}
