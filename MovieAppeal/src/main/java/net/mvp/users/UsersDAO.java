package net.mvp.users;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbuserInsert(UsersDTO udto) {
		System.out.println(udto.getU_mail());
		temp.insert("users.add", udto);
	}
	
	public int dbidcheck(String userid) {
		String u_id=userid;
		int cnt = temp.selectOne("users.idcheck", u_id);
		return cnt;
	}
	public int dbmailcheck(String u_mail) {
		int cnt = temp.selectOne("users.mailcheck",u_mail);
		return cnt;
	}
	public void dbverify(UsersDTO udto) {
		temp.update("users.verify",udto);
	}
	
	public void dbuserdelete(UsersDTO udto) {
		temp.update("users.delete",udto);
	}
	public void dbpwdmodify(UsersDTO udto) {
		temp.update("users.pwdmodify",udto);
	}
	public void dbuseredit(UsersDTO udto) {
		temp.update("users.edit",udto);
	}
}
