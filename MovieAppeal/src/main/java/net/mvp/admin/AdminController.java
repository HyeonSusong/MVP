package net.mvp.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import net.mvp.admin.movie.MovieDateNow;
import net.mvp.admin.movie.MovieSearchAPI;
import net.mvp.admin.movie.MovieSearchDTO;
import net.mvp.login.LoginDAO;
import net.mvp.login.LoginDTO;
import net.mvp.movie.MovieDAO;
import net.mvp.movie.MovieDTO;
import net.mvp.movie.MovieImgDAO;
import net.mvp.movie.MovieImgDTO;
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
	public String home() {
		String url = "redirect:/administrator/movietable.do";
		return url;
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
		int maxitem = mdao.dbMovieAllCount(reqdto);
		Map<String,Integer> setpage = reqdto.setPage(curPage,maxitem,10);
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
		String m_plot = (String)reqmap.get("m_plot");
		m_plot = m_plot.replace("\n", "<br>");
		System.out.println(m_plot);
		mdto.setM_no(Integer.parseInt((String)reqmap.get("m_no")));
		mdto.setM_imgurl((String)reqmap.get("m_imgurl"));
		mdto.setM_plot(m_plot);
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
	
	
	
	@Inject
	@Autowired
	MovieImgDAO midao;
	
	private final String PATH = "C://Users/bit-user/git/MVP/MovieAppeal/src/main/webapp/resources/upload/movie/";
	
	@RequestMapping(value ="/administrator/movieimgupload.do",method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody 
	public String movieimgupload(MultipartHttpServletRequest multi) throws IOException{
		//String root = multireq.getSession().getServletContext().getRealPath("/");
		//String path = root+"resources/upload/"
		Map<Object,Object> map = new HashMap<Object,Object>();
		String path = this.PATH;
		String newFileName = "";
		String msg ="";
		String webpath="/local/upload/movie/";
		MovieImgDTO midto = new MovieImgDTO();
		int m_no = Integer.parseInt(multi.getParameter("m_no").toString());
		File file = new File(path);
		if(!file.isDirectory()) {
			file.mkdir();
		} 
		// 디렉토리없을시 생성
		Iterator<String> itr = multi.getFileNames();
		while(itr.hasNext()) {
			System.out.println(itr.hasNext());
			MultipartFile mf = multi.getFile(itr.next());
			String header = mf.getContentType();
			System.out.println(header);
			if(!header.startsWith("image")) {
				msg = "image file only";
				break;
			}
			if(mf.getBytes().length>10485760) {
				msg = "10Mbyte 이하만 등록가능합니다";
				break;
			}
			String fileName = mf.getOriginalFilename();
			System.out.println("실제파일 이름 : "+ fileName);
			newFileName = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
			try {
				mf.transferTo(new File(path+newFileName));
				msg = "파일업로드 성공";
				midto.setDirectory(webpath);
				midto.setM_no(m_no);
				midto.setOriginal_fileNm(fileName);
				midto.setStorage_fileNm(newFileName);
				midao.dbmovieImgAdd(midto);
			} catch(Exception e) {
				e.printStackTrace();
				msg = "파일 업로드 실패";
			} 
		}
		String aa="";
		aa ="{\"data\":\""+msg+"\"}"; 
		return aa;
	} //conunt AJAX ADMINmovieeidt
	
	
	@RequestMapping(value ="/administrator/movieimglist.do")
	@ResponseBody
	public Map<Object, Object> movieImgList(@RequestBody Map<Object,Object> reqmap){
		MovieImgDTO midto = new MovieImgDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		List<Map<String,Object>> dtolist = new ArrayList<Map<String,Object>>();
		int m_no = Integer.parseInt(reqmap.get("m_no").toString());
		midto.setM_no(m_no);
		int cnt = midao.dbMovieimgcount(midto);
		if(cnt > 0) {
			try {
				List<MovieImgDTO> list = midao.dbMovieImgSelectList(midto);
				for (MovieImgDTO dto : list) {
					Map<String,Object> dtomap = new HashMap<String, Object>();
					dtomap.put("mi_no", dto.getMi_no());
					dtomap.put("m_no", dto.getM_no());
					dtomap.put("directory", dto.getDirectory());
					dtomap.put("original_fileNm", dto.getOriginal_fileNm());
					dtomap.put("storage_fileNm", dto.getStorage_fileNm());
					dtolist.add(dtomap);
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		map.put("list",dtolist);	
		}	
		map.put("cnt", cnt);
		return map;
	} //conunt AJAX ADMINmovieadd
	
	@RequestMapping(value ="/administrator/movieImgdelete.do")
	@ResponseBody
	public Map<Object, Object> movieImgdelete(@RequestBody Map<Object,Object> reqmap){
		MovieImgDTO midto = new MovieImgDTO();
		Map<Object, Object> map = new HashMap<Object,Object>();
		String msg = "NO";
		String path = this.PATH;
		int mi_no = Integer.parseInt(reqmap.get("mi_no").toString());
		midto.setMi_no(mi_no);
		int cnt = midao.dbMovieimgcount(midto);
		if(cnt >0) {
		midto = midao.dbMovieImgSelectOne(midto);
		midao.dbmovieImgdelete(midto);
		String url = path+midto.getStorage_fileNm();
		File file = new File(url);
		if(file.exists()) {
			if(file.delete()) {
				msg="OK";
			}
		}
		}
		map.put("msg", msg);
		return map;
	}
	
	////////////////////////// 영화 추가 관련 /////////////////////////////////////

	
	@RequestMapping(value = "/administrator/movieadd.do")
	public ModelAndView movieadd(MovieSearchDTO mdto, HttpServletRequest req) {
		ArrayList<HashMap<String, Object>> movielist = new ArrayList<HashMap<String, Object>>();
		ModelAndView mav = new ModelAndView();
		String query = "";
		if(req.getQueryString()==""||req.getQueryString()==null) {
			mdto.setPrdtStartYear(now.nowyear());
			mdto.setPrdtEndYear(now.nowyear());
		}
		else {
			query = "&movieNm="+mdto.getMovieNm();
			System.out.println(mdto.getMovieNm());
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
		mav.addObject("query",query);
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
