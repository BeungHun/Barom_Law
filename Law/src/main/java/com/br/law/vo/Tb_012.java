package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_012 {
	private int act_proper_num;
	private int court_proper_num;
	private int user_proper_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chosen_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attendance_date;
	private String act_complete_yn;
	public Tb_012() {
		super();
	}
	public Tb_012(int act_proper_num, int court_proper_num, int user_proper_num, Date chosen_date, Date attendance_date,
			String act_complete_yn) {
		super();
		this.act_proper_num = act_proper_num;
		this.court_proper_num = court_proper_num;
		this.user_proper_num = user_proper_num;
		this.chosen_date = chosen_date;
		this.attendance_date = attendance_date;
		this.act_complete_yn = act_complete_yn;
	}
	public int getAct_proper_num() {
		return act_proper_num;
	}
	public void setAct_proper_num(int act_proper_num) {
		this.act_proper_num = act_proper_num;
	}
	public int getCourt_proper_num() {
		return court_proper_num;
	}
	public void setCourt_proper_num(int court_proper_num) {
		this.court_proper_num = court_proper_num;
	}
	public int getUser_proper_num() {
		return user_proper_num;
	}
	public void setUser_proper_num(int user_proper_num) {
		this.user_proper_num = user_proper_num;
	}
	public Date getChosen_date() {
		return chosen_date;
	}
	public void setChosen_date(Date chosen_date) {
		this.chosen_date = chosen_date;
	}
	public Date getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	public String getAct_complete_yn() {
		return act_complete_yn;
	}
	public void setAct_complete_yn(String act_complete_yn) {
		this.act_complete_yn = act_complete_yn;
	}
	
	@Override
	public String toString() {
		return "[Tb_012] " + "act_proper_num : " + act_proper_num + 
				", court_proper_num : "+ court_proper_num +
				", chosen_date : "+ chosen_date +
				", attendance_date" + attendance_date + 
				", act_complete_yn" + act_complete_yn ;
				
	}    
	
}
