package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_002 {
	private int announce_proper_num;
	private int admin_proper_num;
	private int trial_fcltt_proper_num;
	private String announce_title;
	private String announce_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date announce_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date announce_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date announce_first_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date announce_last_date;
	public Tb_002() {
		super();
	}
	public Tb_002(int announce_proper_num, int admin_proper_num, int trial_fcltt_proper_num, String announce_title,
			String announce_content, Date announce_start_date, Date announce_end_date, Date announce_first_date,
			Date announce_last_date) {
		super();
		this.announce_proper_num = announce_proper_num;
		this.admin_proper_num = admin_proper_num;
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
		this.announce_title = announce_title;
		this.announce_content = announce_content;
		this.announce_start_date = announce_start_date;
		this.announce_end_date = announce_end_date;
		this.announce_first_date = announce_first_date;
		this.announce_last_date = announce_last_date;
	}
	public int getAnnounce_proper_num() {
		return announce_proper_num;
	}
	public void setAnnounce_proper_num(int announce_proper_num) {
		this.announce_proper_num = announce_proper_num;
	}
	public int getAdmin_proper_num() {
		return admin_proper_num;
	}
	public void setAdmin_proper_num(int admin_proper_num) {
		this.admin_proper_num = admin_proper_num;
	}
	public int getTrial_fcltt_proper_num() {
		return trial_fcltt_proper_num;
	}
	public void setTrial_fcltt_proper_num(int trial_fcltt_proper_num) {
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
	}
	public String getAnnounce_title() {
		return announce_title;
	}
	public void setAnnounce_title(String announce_title) {
		this.announce_title = announce_title;
	}
	public String getAnnounce_content() {
		return announce_content;
	}
	public void setAnnounce_content(String announce_content) {
		this.announce_content = announce_content;
	}
	public Date getAnnounce_start_date() {
		return announce_start_date;
	}
	public void setAnnounce_start_date(Date announce_start_date) {
		this.announce_start_date = announce_start_date;
	}
	public Date getAnnounce_end_date() {
		return announce_end_date;
	}
	public void setAnnounce_end_date(Date announce_end_date) {
		this.announce_end_date = announce_end_date;
	}
	public Date getAnnounce_first_date() {
		return announce_first_date;
	}
	public void setAnnounce_first_date(Date announce_first_date) {
		this.announce_first_date = announce_first_date;
	}
	public Date getAnnounce_last_date() {
		return announce_last_date;
	}
	public void setAnnounce_last_date(Date announce_last_date) {
		this.announce_last_date = announce_last_date;
	}
	@Override
	public String toString() {
		return "[Tb_002] " + "announce_proper_num; : " + announce_proper_num + 
				", admin_proper_num : "+ admin_proper_num +
				", trial_fcltt_proper_num" + trial_fcltt_proper_num + 
				", announce_title" + announce_title + 
				", announce_content" + announce_content + 
				", announce_start_date" + announce_start_date + 
				", announce_end_date" + announce_end_date + 
				", announce_first_date" + announce_first_date + 
				", announce_last_date" + announce_last_date
				;
	}    
	
	
	
}
