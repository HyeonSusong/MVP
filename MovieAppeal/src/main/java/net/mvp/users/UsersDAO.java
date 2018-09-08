package net.mvp.users;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//@Repository
public class UsersDAO {

	@Inject
	@Autowired
	private SqlSessionTemplate temp;

	public void dbUserinsert(UsersDTO dto) {
		temp.insert("users.add", dto);
	}
	
	public int dbIdcheck(String userid) {
		return 0;
		//return temp.selectOne("users.idcheck",userid);
	}
	

}
