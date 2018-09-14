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
	
	public UsersDTO dbLoginCount(LoginDTO ldto)throws Exception {
		UsersDTO udto = temp.selectOne("users.login",ldto);
		return udto;
	}
}
