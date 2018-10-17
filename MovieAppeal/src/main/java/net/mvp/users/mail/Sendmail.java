package net.mvp.users.mail;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import net.mvp.users.UsersDTO;

@Service
public class Sendmail {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Inject
	@Autowired
	MailKeyDAO dao;
	
	
	public void sendmail(UsersDTO dto) {
		
		String key = new TempKey().getKey(50, false);
		MailKeyDTO mkdto = new MailKeyDTO();
		mkdto.setU_id(dto.getU_id());
		mkdto.setKey(key);
		System.out.println(mkdto.getKey() + mkdto.getU_id());
		System.out.println(dao);
		dao.dbMailKeyInsert(mkdto);
		MailHandler sendMail;
		try {
			sendMail = new MailHandler(mailSender);

		System.out.println(dto);
		System.out.println(mkdto);
		sendMail.setSubject("[MVP 가입 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
//				.append("<a href='https://drive.google.com/open?id=10b0jmwLYFPmB_jtHaqO3RuAlQNmtZDh_")
				.append("<a href='http://localhost:8080/emailconfirm?key=")
				.append(key)
				.append("&u_id=")
				.append(dto.getU_id())
				.append("' target='_blenk'> 이메일 인증 확인 </a>")
				.toString());
		try {
			sendMail.setFrom("shs8831@gmail.com", "관리자");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sendMail.setTo(dto.getU_mail());
		sendMail.send();		
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
