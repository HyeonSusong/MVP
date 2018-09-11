package net.mvp.users;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class usersDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbuserInsert(usersDTO udto) {
		temp.insert("users.add", udto);
	}
}
