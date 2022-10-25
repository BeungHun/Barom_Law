package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_008 {
	private int aplcn_crtfc_proper_num;
	private int aplcn_dtls_proper_num;
	private String crtfc_type;
	private String issue_agency;
	private String crtfc_number;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date issue_date;
	public Tb_008() {
		super();
	}
	public Tb_008(int aplcn_crtfc_proper_num, int aplcn_dtls_proper_num, String crtfc_type, String issue_agency,
			String crtfc_number, Date issue_date) {
		super();
		this.aplcn_crtfc_proper_num = aplcn_crtfc_proper_num;
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.crtfc_type = crtfc_type;
		this.issue_agency = issue_agency;
		this.crtfc_number = crtfc_number;
		this.issue_date = issue_date;
	}
	public int getAplcn_crtfc_proper_num() {
		return aplcn_crtfc_proper_num;
	}
	public void setAplcn_crtfc_proper_num(int aplcn_crtfc_proper_num) {
		this.aplcn_crtfc_proper_num = aplcn_crtfc_proper_num;
	}
	public int getAplcn_dtls_proper_num() {
		return aplcn_dtls_proper_num;
	}
	public void setAplcn_dtls_proper_num(int aplcn_dtls_proper_num) {
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
	}
	public String getCrtfc_type() {
		return crtfc_type;
	}
	public void setCrtfc_type(String crtfc_type) {
		this.crtfc_type = crtfc_type;
	}
	public String getIssue_agency() {
		return issue_agency;
	}
	public void setIssue_agency(String issue_agency) {
		this.issue_agency = issue_agency;
	}
	public String getCrtfc_number() {
		return crtfc_number;
	}
	public void setCrtfc_number(String crtfc_number) {
		this.crtfc_number = crtfc_number;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	
	
	@Override
	public String toString() {
		return "[Tb_008] " + "aplcn_crtfc_proper_num : " + aplcn_crtfc_proper_num + 
				", aplcn_dtls_proper_num : "+ aplcn_dtls_proper_num +
				", crtfc_type" + crtfc_type + 
				", issue_agency" + issue_agency + 
				", crtfc_number" + crtfc_number + 
				", issue_date" + issue_date
				;
				
	}    
	
	
}
