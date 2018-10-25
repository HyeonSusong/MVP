package net.mvp.recommend;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;
import net.mvp.users.UsersDTO;

@Controller
public class RecommendController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	
	@RequestMapping(value = "/recommend.do")
	public ModelAndView home(HttpServletRequest req) {
		Enumeration param = req.getParameterNames();
		String strParam = "";
		while(param.hasMoreElements()) {
			String name = (String)param.nextElement();
			String value = req.getParameter(name);
			strParam = name + "="+value+"&";
		}
		String query = req.getQueryString();
		System.out.println(req.getRequestURI()+"?"+query);
		String URL = req.getRequestURI()+"?"+strParam;
		
		if(URL.length()>0) {
			URL=URL.substring(0, URL.length()-1);
		}
		System.out.println(URL);
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		UsersDTO udto = (UsersDTO)session.getAttribute("LOGIN");
		String u_mygerne = udto.getU_mygenre();
		StringTokenizer strtoken = new StringTokenizer(u_mygerne, ",");
		ArrayList<String> genre = new ArrayList<String>();
		while(strtoken.hasMoreTokens()) {
			genre.add(strtoken.nextToken());
		}
		MovieDTO mdto = new MovieDTO();
		List<Map<String,Object>> genre_movie_list = new ArrayList<Map<String,Object>>();
		for(String m_genre : genre) {
			Map<String,Object> moviemap = new HashMap<String, Object>();
			mdto.setM_genre(m_genre);
			mdto.setQuery("m_rating");
			int cnt = mdao.dbMovieAllCount(mdto);
			mdto.setPage("1",cnt, 20);
			List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
			moviemap.put("genre", m_genre);
			moviemap.put("movielist", list);
			genre_movie_list.add(moviemap);
			System.out.println(moviemap);
			}
		mav.addObject("genre",genre);
		mav.addObject("genre_movie_list",genre_movie_list);
		String url = "recommend";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	@RequestMapping(value="/movielist.do")
	public ModelAndView movieList(MovieDTO mdto) {
		ModelAndView mav = new ModelAndView();
		mdto.setQuery("m_rating");
		int cnt = mdao.dbMovieAllCount(mdto);
		Map<String, Integer> setPage = mdto.setPage("1",cnt, 20);
		int curPage = setPage.get("nowPage");
		List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
		String m_genre = mdto.getM_genre();
		String url = "movielist";
		mav.addObject("list",list);
		mav.addObject("curPage",curPage);
		mav.addObject("query",m_genre);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value="/movielistadd.do")
	@ResponseBody
	public Map<Object,Object> movieListAdd(@RequestBody Map<String,Object> rmap){
		Map<Object,Object> map = new HashMap<Object, Object>();
		int curPage = Integer.parseInt(rmap.get("curPage").toString())+1;
		String m_genre = rmap.get("query").toString();
		MovieDTO mdto = new MovieDTO();
		mdto.setM_genre(m_genre);
		int cnt = mdao.dbMovieAllCount(mdto);
		mdto.setPage(Integer.toString(curPage),cnt, 20);	
		if(cnt < (curPage-1)*20) {
			cnt=0;
		}
		else {
			List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
			map.put("list", list);
		}
		map.put("cnt",cnt);
		map.put("curPage", curPage);
		map.put("m_genre", m_genre);
		return map;
	}
	/*@RequestMapping(value="/movielistaddtest.do")
	@ResponseBody
	public Map<Object,Object> movieListAddtest(@RequestBody Map<String,Object> rmap){
		Map<Object,Object> map = new HashMap<Object, Object>();
		int curPage = Integer.parseInt(rmap.get("curPage").toString());
		String m_genre = rmap.get("query").toString();
		System.out.println(m_genre);
		MovieDTO mdto = new MovieDTO();
		mdto.setPage(Integer.toString(curPage), 20);
		mdto.setM_genre(m_genre);
		int cnt = mdao.dbMovieAllCount(mdto);
		System.out.println(cnt);
			List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
			map.put("list", list);
		map.put("cnt",cnt);
		map.put("curPage", curPage);
		map.put("m_genre", m_genre);
		return map;
	}*/
}
