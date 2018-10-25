package net.mvp.users;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.mvp.login.LoginDAO;
import net.mvp.login.LoginDTO;
import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;
import net.mvp.movie.like.MovieLikeDAO;
import net.mvp.movie.like.MovieLikeDTO;
import net.mvp.movie.rate.MovieRateDAO;
import net.mvp.movie.rate.MovieRateDTO;
import net.mvp.review.ReviewDAO;
import net.mvp.review.ReviewDTO;
import net.mvp.review.reply.ReviewReplyDAO;
import net.mvp.review.reply.ReviewReplyDTO;
import net.mvp.users.mail.MailKeyDAO;
import net.mvp.users.mail.MailKeyDTO;
import net.mvp.users.mail.Sendmail;

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
	@Inject
	@Autowired
	Sendmail send;
	
	@RequestMapping("/usercreate.do")
	public String usercreate(UsersDTO udto) throws UnsupportedEncodingException, MessagingException {
		System.out.println(udto.getU_mygenre());
		udao.dbuserInsert(udto);
		Sendmail send = new Sendmail();
		send.sendmail(udto);
		String url = "redirect:/verifymailsend.do";
		return url;
	}
	
	
	@RequestMapping("/testmail.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		String url = "test";
		UsersDTO dto = new UsersDTO();
		dto.setU_id("shs2989");
		dto.setU_mail("chun_a_@naver.com");
		send.sendmail(dto);
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	////// 메일 인증 /////////////
	@Inject
	@Autowired
	MailKeyDAO mkdao;
	
	@RequestMapping("/emailconfirm")
	public String emailconfirm(MailKeyDTO dto, HttpServletResponse respon) {
		UsersDTO udto = new UsersDTO();		
		try {
		int cnt = mkdao.dbMailkeycheck(dto);
		if(cnt>0) {
			udto.setU_id(dto.getU_id());
			udto.setU_verify("Y");
			udao.dbverify(udto);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		String url = "redirect:/mailverify.do";
		return url;
	}
	
	@RequestMapping("/verifymailsend.do")
	public ModelAndView verifymailsend() {
		ModelAndView mav = new ModelAndView();
		String url = "verifymailsend";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	@RequestMapping("/mailverify.do")
	public ModelAndView mailverify() {
		ModelAndView mav = new ModelAndView();
		String url = "mailverify";
		mav.addObject("page",url);
		mav.setViewName("mainLayout");
		return mav;
	}
	
	
/////////////////////////////////////////////////////////////////	
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
	
////////////////////////////////////////////////////////////////////////////////
	
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
	@RequestMapping("/useredit.do")
	public String useredit(UsersDTO dto) {
		String url = "redirect:/myprofile.do";
		udao.dbuseredit(dto);
		return url;
	}
	
///////////////////////////// 비밀 번호 변경 페이지 관련 ////////////////
	@RequestMapping("/passwordmodify.do")
	public ModelAndView passwordmodify() {
		ModelAndView mav = new ModelAndView();
		String url = "passwordmodify";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	@Inject
	@Autowired
	LoginDAO ldao;
	/// 이전비밀번호 확인
	@RequestMapping("/prepwdmodify.do")
    @ResponseBody
    public Map<Object, Object> prepwdmodify(@RequestBody LoginDTO dto) {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = ldao.dbLoginPwdcheck(dto);
        map.put("cnt", count);
       return map;	
	}
	
	// 비밀번호 변경 
	@RequestMapping("/postpwdmodify.do")
    @ResponseBody
    public Map<Object, Object> postpwdmodify(@RequestBody UsersDTO dto) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        String msg="";
        try {
        udao.dbpwdmodify(dto);
        msg="OK";
        }catch(Exception ex) {
        	ex.printStackTrace();
        	msg="NO";
        }
        map.put("msg", msg);
       return map;	
	}
	
/////////////////////////////////////////////////////////////////////////	
	@Inject
	@Autowired
	MovieLikeDAO mldao;
	
	@Inject
	@Autowired
	MovieDAO mdao;
	
	/////////////회원 페이지 - 찜한 영화
	@RequestMapping("/myfavorite.do")
	public ModelAndView myfavorite(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		UsersDTO dto = new UsersDTO();
		dto = (UsersDTO)session.getAttribute("LOGIN");
		MovieLikeDTO mldto = new MovieLikeDTO();
		mldto.setU_no(dto.getU_no());
		int cnt = mldao.AllMovieuserLikeCheck(mldto);
		if(cnt>0) {
		List<Integer> movie_Num = mldao.dbAllMovieuserLike(mldto);
		List<MovieDTO> movielist = new ArrayList<MovieDTO>();
		for(int m_no : movie_Num) {
			MovieDTO mdto = new MovieDTO();
			mdto.setM_no(m_no);
			mdto=mdao.dbMovieSelet(mdto);
			movielist.add(mdto);
		}
		mav.addObject("movielist",movielist);
		}
		System.out.println(dto.getU_id());
		String url = "myfavorite";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}

	///////////////////회원 페이지 - 평점을 남긴영화
	@Inject
	@Autowired
	MovieRateDAO mrdao;
	
	@RequestMapping("/myrating.do")
	public ModelAndView myrating(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		UsersDTO udto = new UsersDTO();
		udto = (UsersDTO)session.getAttribute("LOGIN");
		MovieRateDTO mrdto = new MovieRateDTO();
		mrdto.setU_no(udto.getU_no());
		int cnt = mrdao.dbuserAllRateMovieCheck(mrdto);
		if(cnt>0) {
			List<MovieRateDTO> ratelist = mrdao.dbUserRateMovie(mrdto);
			List<HashMap<String,Object>> myratelist = new ArrayList<HashMap<String,Object>>();
			for(MovieRateDTO mymr : ratelist) {
				MovieDTO mdto = new MovieDTO();
				HashMap<String,Object> mymovie = new HashMap<String, Object>();
				mdto.setM_no(mymr.getM_no());
				mdto = mdao.dbMovieSelet(mdto);
				System.out.println(mdto.getM_no()+"gd"+mdto.getM_title()+mdto.getM_imgurl());
				mymovie.put("m_no",mdto.getM_no());
				mymovie.put("m_title", mdto.getM_title());
				mymovie.put("m_genre",mdto.getM_genre());
				mymovie.put("m_rating", mdto.getM_rating());
				mymovie.put("m_imgurl", mdto.getM_imgurl());
				mymovie.put("myrating", mymr.getMr_rating());
				myratelist.add(mymovie);
			}
			mav.addObject("myratelist",myratelist);
		}
		String url = "myrating";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	
	///////////////////회원 페이지 - 나의 게시물
	
	@Inject
	@Autowired
	ReviewDAO rdao; 
	
	@RequestMapping("/myreview.do")
	public ModelAndView myreview(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		UsersDTO udto = new UsersDTO();
		String curPage = req.getParameter("curPage");
		if(curPage == "" || curPage ==null) {
			curPage="1";
		}
		udto = (UsersDTO)session.getAttribute("LOGIN");
		int u_no = udto.getU_no();
		ReviewDTO rdto = new ReviewDTO();
		rdto.setU_no(u_no);
		int cnt = rdao.dbCountAll(rdto);
		System.out.println(cnt);
		Map<String, Integer> pageset = rdto.setPage(curPage, cnt, 10);
		if(cnt>0) {
			List<ReviewDTO> list = rdao.dbReviewList(rdto);
			System.out.println(list.size());
			mav.addObject("list",list);
		}
		String url = "myreview";
		mav.addObject("pageset",pageset);
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	
	////////////////////회원 페이지 - 나의 댓글
	@Inject
	@Autowired
	ReviewReplyDAO brdao;
	
	@RequestMapping("/myreply.do")
	public ModelAndView myreply(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		UsersDTO udto = new UsersDTO();
		String curPage = req.getParameter("curPage");
		if(curPage == null || curPage =="") {
			curPage = "1";
		}
		udto = (UsersDTO)session.getAttribute("LOGIN");
		int u_no = udto.getU_no();
		ReviewReplyDTO brdto = new ReviewReplyDTO();
		brdto.setU_no(u_no);
		int cnt = brdao.dbreplyCount(brdto);
		System.out.println(cnt);
		Map<String,Integer> pageset =brdto.setPage(curPage, cnt, 10);
		if(cnt>0) {
			List<ReviewReplyDTO> list = brdao.dbMyReply(brdto);
			System.out.println(list.size());
			mav.addObject("list",list);
		}
		String url = "myreply";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}

	////////////////////////회원 페이지 - 계정삭제 
	@RequestMapping("/userdelete.do")
	public ModelAndView userdelete() {
		ModelAndView mav = new ModelAndView();
		String url = "userdelete";
		mav.addObject("page",url);
		mav.setViewName("mypagemenu");
		return mav;
	}
	@RequestMapping("/userdeletepost.do")
	public String userdeletepost(UsersDTO dto, HttpServletRequest req) {
		String url = "redirect:/main.do";
		HttpSession session = req.getSession();
		int cnt = udao.dbidcheck(dto.getU_id());
		if(cnt >0) {
		System.out.println(dto.getU_lock());
		dto.setU_lock("Y");
		udao.dbuserdelete(dto);
		session.removeAttribute("LOGIN");
		}
		return url;
	}
}