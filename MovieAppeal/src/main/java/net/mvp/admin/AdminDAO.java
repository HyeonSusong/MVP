package net.mvp.admin;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;
	
	
	
}
