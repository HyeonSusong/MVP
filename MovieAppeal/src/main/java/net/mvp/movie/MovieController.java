package net.mvp.movie;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@Controller
public class MovieController {
	
	@Autowired
	@Inject
	MovieAPI mdapi;
	
	@Autowired
	@Inject
	MovieDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	
	@RequestMapping(value = "/moviedetail.do")
	public ModelAndView movieDetail(MovieDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setM_no(20176122);		
		int count = mdao.dbMovieCount(dto);
		if(count >0) {
			dto = mdao.dbMovieSelet(dto);
		try {
			dto = mdapi.MovieDetail(dto);
		} catch (OpenAPIFault e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// m_no 
		
		}
		String url = "moviedetail";
		mav.addObject("DTO",dto);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	

	
}
