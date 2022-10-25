package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_007 {
	private int aplcn_carer_proper_num;
	private int aplcn_dtls_proper_num;
	private String company_name;
	private String carer_type;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date work_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date work_end_date;
	private String work_description;
	private String work_department;
	private String work_position;
	private String carer_description;
	private String special_note_description;
	public Tb_007() {
		super();
	}
	public Tb_007(int aplcn_carer_proper_num, int aplcn_dtls_proper_num, String company_name, String carer_type,
			Date work_start_date, Date work_end_date, String work_description, String work_department,
			String work_position, String carer_description, String special_note_description) {
		super();
		this.aplcn_carer_proper_num = aplcn_carer_proper_num;
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.company_name = company_name;
		this.carer_type = carer_type;
		this.work_start_date = work_start_date;
		this.work_end_date = work_end_date;
		this.work_description = work_description;
		this.work_department = work_department;
		this.work_position = work_position;
		this.carer_description = carer_description;
		this.special_note_description = special_note_description;
	}
	public int getAplcn_carer_proper_num() {
		return aplcn_carer_proper_num;
	}
	public void setAplcn_carer_proper_num(int aplcn_carer_proper_num) {
		this.aplcn_carer_proper_num = aplcn_carer_proper_num;
	}
	public int getAplcn_dtls_proper_num() {
		return aplcn_dtls_proper_num;
	}
	public void setAplcn_dtls_proper_num(int aplcn_dtls_proper_num) {
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCarer_type() {
		return carer_type;
	}
	public void setCarer_type(String carer_type) {
		this.carer_type = carer_type;
	}
	public Date getWork_start_date() {
		return work_start_date;
	}
	public void setWork_start_date(Date work_start_date) {
		this.work_start_date = work_start_date;
	}
	public Date getWork_end_date() {
		return work_end_date;
	}
	public void setWork_end_date(Date work_end_date) {
		this.work_end_date = work_end_date;
	}
	public String getWork_description() {
		return work_description;
	}
	public void setWork_description(String work_description) {
		this.work_description = work_description;
	}
	public String getWork_department() {
		return work_department;
	}
	public void setWork_department(String work_department) {
		this.work_department = work_department;
	}
	public String getWork_position() {
		return work_position;
	}
	public void setWork_position(String work_position) {
		this.work_position = work_position;
	}
	public String getCarer_description() {
		return carer_description;
	}
	public void setCarer_description(String carer_description) {
		this.carer_description = carer_description;
	}
	public String getSpecial_note_description() {
		return special_note_description;
	}
	public void setSpecial_note_description(String special_note_description) {
		this.special_note_description = special_note_description;
	}
	@Override
	public String toString() {
		return "[Tb_007] " + "aplcn_carer_proper_num : " + aplcn_carer_proper_num + 
				", aplcn_dtls_proper_num : "+ aplcn_dtls_proper_num +
				", company_name" + company_name + 
				", carer_type" + carer_type + 
				", work_start_date" + work_start_date + 
				", work_end_date" + work_end_date + 
				", work_description" + work_description + 
				", work_department" + work_department +
				", work_position" + work_position +
				", carer_description" + carer_description +
				", special_note_description" + special_note_description
				;
				
	}    
	
	
	
	
}
