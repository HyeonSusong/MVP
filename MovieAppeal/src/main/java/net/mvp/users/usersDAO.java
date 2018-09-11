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
	
	public int dbidcheck(String userid) {
		int cnt = temp.selectOne("users.idcheck", userid);
		return cnt;
	}
	public int dbmailcheck(String u_mail) {
		int cnt = temp.selectOne("users.mailcheck",u_mail);
		return cnt;
	}
}
