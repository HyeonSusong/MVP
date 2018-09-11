package net.mvp.users;

public class usersDTO {
	private int u_no;
	private String u_id;
	private String u_pwd;
	private String u_mail;
	private String u_mygenre;
	private String u_verify;
	private String u_lock;
	
	//// mail input ////
	private String u_mail_id;
	private String u_mail_domain;
	public int getU_no() {
		return u_no;
	}
	public String getU_mail_id() {
		return u_mail_id;
	}
	public void setU_mail_id(String u_mail_id) {
		this.u_mail_id = u_mail_id;
	}
	public String getU_mail_domain() {
		return u_mail_domain;
	}
	public void setU_mail_domain(String u_mail_domain) {
		this.u_mail_domain = u_mail_domain;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_mail() {
		return u_mail;
	}
	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}
	public String getU_mygenre() {
		return u_mygenre;
	}
	public void setU_mygenre(String u_mygenre) {
		this.u_mygenre = u_mygenre;
	}
	public String getU_verify() {
		return u_verify;
	}
	public void setU_verify(String u_verify) {
		this.u_verify = u_verify;
	}
	public String getU_lock() {
		return u_lock;
	}
	public void setU_lock(String u_lock) {
		this.u_lock = u_lock;
	}

}
