package net.mvp.review;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import net.mvp.admin.movie.*;
import net.mvp.login.LoginDAO;
import net.mvp.login.LoginDTO;
import net.mvp.movie.MovieAPI;
import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;
import net.mvp.users.*;


@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO rdao;
	
	@Inject
	@Autowired
	LoginDAO ldao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public ModelAndView ReviewList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		ReviewDTO rdto = new ReviewDTO();
		String b_category = req.getParameter("b_category");
		if(b_category == null || b_category == "") {
			b_category = "all";
		}
		String qsel = req.getParameter("qsel");
		String qval = req.getParameter("qval");
		System.out.println(qsel+"."+qval);
		String query ="";
		if(qsel != null && qsel != "") {
			rdto.setQsel(qsel);
			rdto.setQval(qval);
			System.out.println(rdto.getQsel()+",12,"+rdto.getQval());
			query="b_category="+b_category+"&qsel="+qsel+"&qval="+qval;
		}
		else {
			query="b_category="+b_category;
		}
		String curPage = req.getParameter("curPage");
		if(curPage==null||curPage=="") {
			curPage="1";
		}
		rdto.setB_category(b_category);	
		int cnt = rdao.dbCountAll(rdto);
		Map<String,Integer> setPage = rdto.setPage(curPage,cnt,10);
			System.out.println(cnt);
		if(cnt>0) {
			List<ReviewDTO> list = rdao.dbReviewList(rdto);
			mav.addObject("rlist", list);
			System.out.println(rdto.getB_category()+","+rdto.getQsel());
		}
		String url = "reviewList";
		mav.addObject("category",b_category);
		mav.addObject("query",query);
		mav.addObject("pageset",setPage);
		mav.addObject("page", url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value = "/reviewdetail.do")
	public ModelAndView ReviewDetail(@RequestParam int b_no) {
		ModelAndView mav = new ModelAndView();
		ReviewDTO dto= rdao.dbDetail(b_no);
		MovieDTO mdto = new MovieDTO();
		mdto.setM_no(dto.getM_no());
		try {
			mdto = new MovieAPI().MovieDetail(mdto);
		} catch (OpenAPIFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("mdto",mdto);
		mav.addObject("dto",dto);
		mav.addObject("page", "reviewDetail");
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@Inject
	@Autowired
	MovieDAO mdao;
	@RequestMapping(value = "/reviewPreInsert.do", method = RequestMethod.GET)
	public ModelAndView ReviewPreInsert() {
		ModelAndView mav = new ModelAndView();
		String url = "reviewInsert";
		mav.addObject("page", url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping(value="/insertMovieTitleSerch.do")
	@ResponseBody
	public Map<Object,Object> MovieSerch(@RequestBody Map<Object,Object>rmap){
		Map<Object,Object> map = new HashMap<Object, Object>();
		String m_title = rmap.get("m_title").toString();
		MovieDTO mdto = new MovieDTO();
		mdto.setM_title(m_title);
		int cnt = mdao.dbMovieAllCount(mdto);
		mdto.setPage("1",cnt,5);
		System.out.println(cnt);
		if(cnt >0) {
		List<MovieDTO> movielist =mdao.dbAdminMovieList(mdto);
		map.put("list", movielist);
		}
		map.put("cnt", cnt);
		return map;
	}
	
	
	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.GET)
	public ModelAndView ReviewInsert(ReviewDTO dto,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession Session = req.getSession();
		UsersDTO udto = new UsersDTO();
		udto = (UsersDTO)Session.getAttribute("LOGIN");
		dto.setU_no(udto.getU_no());
		rdao.dbInsert(dto);
		mav.setViewName("redirect:/review.do");
		return mav;
	}
	
	@RequestMapping(value="/reviewInsertCheck.do")
	@ResponseBody
	public Map<Object,Object> ReviewInsertCheck(@RequestBody Map<Object,Object>rmap, HttpServletRequest req){
		Map<Object,Object> map = new HashMap<Object, Object>();
		int m_no = Integer.parseInt(rmap.get("m_no").toString());
		UsersDTO udto = new UsersDTO();
		HttpSession session = req.getSession();
		udto = (UsersDTO)session.getAttribute("LOGIN");
		int u_no = udto.getU_no();
		ReviewDTO rdto = new ReviewDTO();
		rdto.setU_no(u_no);
		rdto.setM_no(m_no);
		int cnt = rdao.dbInsertCheck(rdto);
		map.put("cnt", cnt);
		return map;
	}
	
	@RequestMapping(value = "/reviewDelete.do", method = RequestMethod.GET)
	public String qnaDelete(ReviewDTO dto) {
		rdao.dbDelete(dto);
		String url = "redirect:/review.do";
		return url;
	}
	
}
