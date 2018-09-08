package net.mvp.users;



import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsersController {
	
	//
	UsersDAO dao = new UsersDAO();
	
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	
	@RequestMapping("/signup.do")
	public String user_signup() {
		String url = "signup";
		return url;
	}
	
	@RequestMapping("/user_create.do")
	public String user_create(UsersDTO dto) {
		dto.setU_mail(dto.getU_mail_id()+"@"+dto.getU_mail_domain());
		dao.dbUserinsert(dto);
		// 메일 발송 메소드 추가
		return "main";
	}
	
	 @RequestMapping("/idcheck.do")
	    @ResponseBody
	    public Map<Object, Object> idcheck(String userid) {
	        
	        int count = 0;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	       count = dao.dbIdcheck(userid);
	        map.put("cnt", count);
	 
	        return map;
	    }
	
}
