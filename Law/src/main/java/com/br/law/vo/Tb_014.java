package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_014 {
	private int accept_proper_num;
	private int aplcn_dtls_proper_num;
	private int user_proper_num;
	private int trial_fcltt_proper_num;
	private int court_proper_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date accept_date;
	private String accept_etc;
	private String accept_act_yn;
	public Tb_014() {
		super();
	}
	public Tb_014(int accept_proper_num, int aplcn_dtls_proper_num, int user_proper_num, int trial_fcltt_proper_num,
			int court_proper_num, Date accept_date, String accept_etc, String accept_act_yn) {
		super();
		this.accept_proper_num = accept_proper_num;
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.user_proper_num = user_proper_num;
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
		this.court_proper_num = court_proper_num;
		this.accept_date = accept_date;
		this.accept_etc = accept_etc;
		this.accept_act_yn = accept_act_yn;
	}
	public int getAccept_proper_num() {
		return accept_proper_num;
	}
	public void setAccept_proper_num(int accept_proper_num) {
		this.accept_proper_num = accept_proper_num;
	}
	public int getAplcn_dtls_proper_num() {
		return aplcn_dtls_proper_num;
	}
	public void setAplcn_dtls_proper_num(int aplcn_dtls_proper_num) {
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
	}
	public int getUser_proper_num() {
		return user_proper_num;
	}
	public void setUser_proper_num(int user_proper_num) {
		this.user_proper_num = user_proper_num;
	}
	public int getTrial_fcltt_proper_num() {
		return trial_fcltt_proper_num;
	}
	public void setTrial_fcltt_proper_num(int trial_fcltt_proper_num) {
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
	}
	public int getCourt_proper_num() {
		return court_proper_num;
	}
	public void setCourt_proper_num(int court_proper_num) {
		this.court_proper_num = court_proper_num;
	}
	public Date getAccept_date() {
		return accept_date;
	}
	public void setAccept_date(Date accept_date) {
		this.accept_date = accept_date;
	}
	public String getAccept_etc() {
		return accept_etc;
	}
	public void setAccept_etc(String accept_etc) {
		this.accept_etc = accept_etc;
	}
	public String getAccept_act_yn() {
		return accept_act_yn;
	}
	public void setAccept_act_yn(String accept_act_yn) {
		this.accept_act_yn = accept_act_yn;
	}
	
	@Override
	public String toString() {
		return "[Tb_005] " + "accept_proper_num : " + accept_proper_num +  
				", aplcn_dtls_proper_num : "+ aplcn_dtls_proper_num + 
				", user_proper_num : " + user_proper_num + 
				", trial_fcltt_proper_num : " + trial_fcltt_proper_num + 
				", court_proper_num : " + court_proper_num +  
				", accept_date : " + accept_date + 
				", accept_etc : " + accept_etc + 
				", accept_act_yn : " + accept_act_yn 
				;
	}    
}
