package net.mvp.main;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

import com.sun.mail.util.QEncoderStream;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import net.mvp.admin.movie.MovieDateNow;
import net.mvp.movie.MovieAPI;
import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@RequestMapping(value = "/")
	public String home() {
		return "redirect:/main.do";
	}
	@RequestMapping(value = "/main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		String url = "main";
		MovieAPI movieapi = new MovieAPI();
		ArrayList<Map<String,String>> boxOfiiceTop10 = new ArrayList<Map<String,String>>();
		try {
			boxOfiiceTop10 = movieapi.boxOffice();
			System.out.println(boxOfiiceTop10);
			mav.addObject("boxOfiiceTop10",boxOfiiceTop10);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MovieDTO mdto1 = new MovieDTO();
		MovieDTO mdto2 = new MovieDTO();
		int cnt = mdao.dbMovieAllCount(mdto1);
		mdto1.setPage("1",cnt, 10);
		mdto1.setQuery("m_rating");
		List<MovieDTO> list1 =  mdao.dbAdminMovieList(mdto1);
		System.out.println(list1.get(0).getM_title());
		mav.addObject("ratelist",list1);
		mdto2.setPage("1",cnt,10);
		mdto2.setQuery("m_likes");
		List<MovieDTO> list2 =  mdao.dbAdminMovieList(mdto2);
		mav.addObject("likelist",list2);
		String week = new MovieDateNow().week();
		mav.addObject("week",week);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	
	@RequestMapping(value="/movieserch.do")
	public ModelAndView movieserch(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MovieDTO mdto = new MovieDTO();
		String query = req.getParameter("query");
		System.out.println(query);
		mdto.setM_title(query);
		mdto.setQuery("m_rating");
		int cnt= mdao.dbMovieAllCount(mdto);
		Map<String, Integer> setPage = mdto.setPage("1",cnt, 20);
		int curPage = setPage.get("nowPage");
		List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
		String url = "movieserch";
		mav.addObject("list",list);
		mav.addObject("curPage",curPage);
		mav.addObject("query",query);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value="/movieserchadd.do")
	@ResponseBody
	public Map<Object,Object> movieSerchAdd(@RequestBody Map<String,Object> rmap){
		Map<Object,Object> map = new HashMap<Object, Object>();
		int curPage = Integer.parseInt(rmap.get("curPage").toString())+1;
		String m_title = rmap.get("query").toString();
		MovieDTO mdto = new MovieDTO();
		mdto.setM_title(m_title);
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
		map.put("query", m_title);
		return map;
	}
}
