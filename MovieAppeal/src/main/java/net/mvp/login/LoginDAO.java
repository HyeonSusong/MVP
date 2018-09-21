package net.mvp.login;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.mvp.users.UsersDTO;

@Repository
public class LoginDAO {

	@Autowired
	@Inject
	SqlSessionTemplate temp;
	
	public UsersDTO dbLogin(LoginDTO ldto){
	
		UsersDTO udto = temp.selectOne("users.login",ldto);
		System.out.println("3");
		return udto;
	}
	
	public int dbLoginidcheck(LoginDTO ldto) {
		String u_id = ldto.getU_id();
		int cnt = temp.selectOne("users.idcheck",u_id);
		return cnt;
	}
	
	public int dbLoginPwdcheck(LoginDTO ldto) {
		int cnt = temp.selectOne("users.pwdcheck",ldto);
		return cnt;
	}
	
}
