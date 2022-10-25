package com.br.law.vo;

import java.util.Date;

public class Tb_003 {
	private int notice_proper_num;
	private int admin_proper_num;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	public Tb_003() {
		super();
	}

	public Tb_003(int notice_proper_num, int admin_proper_num, String notice_title, String notice_content,
			Date notice_date) {
		super();
		this.notice_proper_num = notice_proper_num;
		this.admin_proper_num = admin_proper_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}

	public int getNotice_proper_num() {
		return notice_proper_num;
	}

	public int getAdmin_proper_num() {
		return admin_proper_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_proper_num(int notice_proper_num) {
		this.notice_proper_num = notice_proper_num;
	}

	public void setAdmin_proper_num(int admin_proper_num) {
		this.admin_proper_num = admin_proper_num;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
	@Override
	public String toString() {
		return "[Tb_003] " + "notice_proper_num : " + notice_proper_num + 
				", admin_proper_num : "+ admin_proper_num +
				", notice_title" + notice_title + 
				", notice_content" + notice_content + 
				", notice_date" + notice_date 
				;
	}    

}
