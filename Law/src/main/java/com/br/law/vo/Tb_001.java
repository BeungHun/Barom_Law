package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_001 {

	private int user_proper_num;
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_age;
	private String user_email;
	private String user_phone;
	private String user_job;
	private String user_ar;
	private String user_ar_zonecode;
	private String user_ar_jibun;
	private String user_ar_detail;
	private String user_bank;
	private String user_bank_account;
	private String user_bank_holder;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_joindate;
	private String user_delete_yn;
	public Tb_001() {
		super();
	}
	public Tb_001(int user_proper_num, String user_id, String user_pw, String user_name, int user_age,
			String user_email, String user_phone, String user_job, String user_ar, String user_ar_zonecode,
			String user_ar_jibun, String user_ar_detail, String user_bank, String user_bank_account,
			String user_bank_holder, Date user_joindate, String user_delete_yn) {
		super();
		this.user_proper_num = user_proper_num;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_job = user_job;
		this.user_ar = user_ar;
		this.user_ar_zonecode = user_ar_zonecode;
		this.user_ar_jibun = user_ar_jibun;
		this.user_ar_detail = user_ar_detail;
		this.user_bank = user_bank;
		this.user_bank_account = user_bank_account;
		this.user_bank_holder = user_bank_holder;
		this.user_joindate = user_joindate;
		this.user_delete_yn = user_delete_yn;
	}
	public int getUser_proper_num() {
		return user_proper_num;
	}
	public void setUser_proper_num(int user_proper_num) {
		this.user_proper_num = user_proper_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_job() {
		return user_job;
	}
	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
	public String getUser_ar() {
		return user_ar;
	}
	public void setUser_ar(String user_ar) {
		this.user_ar = user_ar;
	}
	public String getUser_ar_zonecode() {
		return user_ar_zonecode;
	}
	public void setUser_ar_zonecode(String user_ar_zonecode) {
		this.user_ar_zonecode = user_ar_zonecode;
	}
	public String getUser_ar_jibun() {
		return user_ar_jibun;
	}
	public void setUser_ar_jibun(String user_ar_jibun) {
		this.user_ar_jibun = user_ar_jibun;
	}
	public String getUser_ar_detail() {
		return user_ar_detail;
	}
	public void setUser_ar_detail(String user_ar_detail) {
		this.user_ar_detail = user_ar_detail;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	public String getUser_bank_account() {
		return user_bank_account;
	}
	public void setUser_bank_account(String user_bank_account) {
		this.user_bank_account = user_bank_account;
	}
	public String getUser_bank_holder() {
		return user_bank_holder;
	}
	public void setUser_bank_holder(String user_bank_holder) {
		this.user_bank_holder = user_bank_holder;
	}
	public Date getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}
	public String getUser_delete_yn() {
		return user_delete_yn;
	}
	public void setUser_delete_yn(String user_delete_yn) {
		this.user_delete_yn = user_delete_yn;
	}
	
	@Override
	public String toString() {
		return "[Tb_001] " + "user_id; : " + user_id + 
				", user_pw : "+ user_pw +
				", user_name" + user_name + 
				", user_age" + user_age + 
				", user_email" + user_email + 
				", user_phone" + user_phone + 
				", user_job" + user_job + 
				", user_ar" + user_ar + 
				", user_ar_zonecode" + user_ar_zonecode + 
				", user_ar_jibun" + user_ar_jibun +
				", user_ar_detail" + user_ar_detail +
				", user_bank" + user_bank +
				", user_bank_account" + user_bank_account +
				", user_bank_holder" + user_bank_holder +
				", user_joindate" + user_joindate +
				", user_delete_yn" + user_delete_yn 
				;
	}    
	
	
	
	
	
}
