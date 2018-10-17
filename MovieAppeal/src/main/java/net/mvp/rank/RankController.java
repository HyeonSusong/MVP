package net.mvp.rank;

import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;

@Controller
public class RankController {
	
	private static final Logger logger = LoggerFactory.getLogger(RankController.class);
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	@RequestMapping(value = "/rank.do")
	public ModelAndView home(HttpServletRequest req) {
		String query = "";
		query = req.getParameter("query");
		if(query == null || query=="") {
			query="m_rating";
		}
		String curPage = "";
		curPage= req.getParameter("curPage");
		if(curPage==null || curPage =="") {
			curPage = "1";
		}
		MovieDTO mdto= new MovieDTO();
		mdto.setQuery(query);
		Map<String,Integer> pageset = mdto.setPage(curPage, 20);
		List<MovieDTO> list = mdao.dbAdminMovieList(mdto);
		ModelAndView mav = new ModelAndView();
		String url = "rank";
		mav.addObject("list",list);
		mav.addObject("pageset",pageset);
		mav.addObject("query",query);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
}
