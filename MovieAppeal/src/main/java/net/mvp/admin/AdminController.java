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
import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;
import net.mvp.users.UsersDTO;
import oracle.net.aso.e;

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
	
	////////////////////////// 영화 수정 관련 /////////////////////////////////////
	MovieDateNow now = new MovieDateNow();
	@Inject
	@Autowired
	MovieSearchAPI msapi;
	
	//// 영화 추가
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@RequestMapping(value = "/administrator/movietable.do")
	public ModelAndView movietable(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MovieDTO reqdto = new MovieDTO();
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		String curPage = req.getParameter("curPage");
		int maxitem = mdao.MovieAllCount(reqdto);
		Map<String,Integer> setpage = reqdto.setPage(curPage,maxitem);
		list = mdao.dbAdminMovieList(reqdto);
		String url = "movietable";
		mav.addObject("page",url);
		mav.addObject("list",list);
		mav.addObject("pageset",setpage);
		mav.setViewName("administratormain");
		return mav;
	}
	
	@RequestMapping(value ="/administrator/movieedit.do")
	@ResponseBody
	public Map<Object, Object> movieEdit(@RequestBody Map<Object,Object> reqmap){
		MovieDTO mdto = new MovieDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		System.out.println(reqmap);
		System.out.println(reqmap.get("m_no"));
		mdto.setM_no(Integer.parseInt((String)reqmap.get("m_no")));
		mdto.setM_imgurl((String)reqmap.get("m_imgurl"));
		mdto.setM_plot((String)reqmap.get("m_plot"));
		mdto.setM_trailerurl((String)reqmap.get("m_trailerurl"));
		int cnt = mdao.dbMovieCount(mdto);
		String msg = "NO";
		if(cnt > 0) {
			try {
			mdao.dbMovieEdit(mdto);
			msg="OK";
			}catch(Exception ex) {
				ex.printStackTrace();
				msg="NO";
			}
		}	
		System.out.println("cnt:"+cnt+"msg:"+msg);
		map.put("msg", msg);
		return map;
	} //conunt AJAX ADMINmovieeidt
	
	@RequestMapping(value ="/administrator/moviedelete.do")
	@ResponseBody
	public Map<Object, Object> moviedelete(@RequestBody Map<Object,Object> reqmap){
		MovieDTO mdto = new MovieDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		System.out.println(reqmap);
		System.out.println(reqmap.get("m_no"));
		mdto.setM_no(Integer.parseInt((String)reqmap.get("m_no")));
		int cnt = mdao.dbMovieCount(mdto);
		String msg = "NO";
		if(cnt > 0) {
			try {
			mdao.dbMovieDelete(mdto);
			msg="OK";
			}catch(Exception ex) {
				ex.printStackTrace();
				msg="NO";
			}
		}	
		System.out.println("cnt:"+cnt+"msg:"+msg);
		map.put("msg", msg);
		return map;
	} //conunt AJAX ADMINmovieeidt
	
	
	////////////////////////// 영화 추가 관련 /////////////////////////////////////

	
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
		mav.setViewName("administratormain");
		return mav;
	}

	
	@RequestMapping(value ="/administrator/postmovieadd.do")
	@ResponseBody
	public Map<Object, Object> postMovieAdd(@RequestBody Map<Object,Object> reqmap){
		MovieDTO mdto = new MovieDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		System.out.println("0");
		System.out.println(reqmap);
		System.out.println(reqmap.get("m_no"));
		mdto.setM_no(Integer.parseInt((String)reqmap.get("m_no")));
		mdto.setM_title((String)reqmap.get("m_title"));
		mdto.setM_genre((String)reqmap.get("m_genre"));
		mdto.setM_imgurl((String)reqmap.get("m_imgurl"));
		System.out.println("1");
		int cnt = mdao.dbMovieCount(mdto);
		System.out.println("2");
		if(cnt == 0) {
			try {
			System.out.println("3");
			mdao.dbMovieAdd(mdto);
			System.out.println("4");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}	
		System.out.println("cnt:"+cnt);
		map.put("cnt", cnt);
		return map;
	} //conunt AJAX ADMINmovieadd
	
	
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
