package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_006 {
	private int edctn_dtls_proper_num;
	private int aplcn_dtls_proper_num;
	private String edctn_school_name;
	private String edctn_major;
	private String edctn_degree;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctn_admsn_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edctn_grdtn_date;
	private String edctn_final_yn;
	public Tb_006() {
		super();
	}
	public Tb_006(int edctn_dtls_proper_num, int aplcn_dtls_proper_num, String edctn_school_name, String edctn_major,
			String edctn_degree, Date edctn_admsn_date, Date edctn_grdtn_date, String edctn_final_yn) {
		super();
		this.edctn_dtls_proper_num = edctn_dtls_proper_num;
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.edctn_school_name = edctn_school_name;
		this.edctn_major = edctn_major;
		this.edctn_degree = edctn_degree;
		this.edctn_admsn_date = edctn_admsn_date;
		this.edctn_grdtn_date = edctn_grdtn_date;
		this.edctn_final_yn = edctn_final_yn;
	}
	public int getEdctn_dtls_proper_num() {
		return edctn_dtls_proper_num;
	}
	public void setEdctn_dtls_proper_num(int edctn_dtls_proper_num) {
		this.edctn_dtls_proper_num = edctn_dtls_proper_num;
	}
	public int getAplcn_dtls_proper_num() {
		return aplcn_dtls_proper_num;
	}
	public void setAplcn_dtls_proper_num(int aplcn_dtls_proper_num) {
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
	}
	public String getEdctn_school_name() {
		return edctn_school_name;
	}
	public void setEdctn_school_name(String edctn_school_name) {
		this.edctn_school_name = edctn_school_name;
	}
	public String getEdctn_major() {
		return edctn_major;
	}
	public void setEdctn_major(String edctn_major) {
		this.edctn_major = edctn_major;
	}
	public String getEdctn_degree() {
		return edctn_degree;
	}
	public void setEdctn_degree(String edctn_degree) {
		this.edctn_degree = edctn_degree;
	}
	public Date getEdctn_admsn_date() {
		return edctn_admsn_date;
	}
	public void setEdctn_admsn_date(Date edctn_admsn_date) {
		this.edctn_admsn_date = edctn_admsn_date;
	}
	public Date getEdctn_grdtn_date() {
		return edctn_grdtn_date;
	}
	public void setEdctn_grdtn_date(Date edctn_grdtn_date) {
		this.edctn_grdtn_date = edctn_grdtn_date;
	}
	public String getEdctn_final_yn() {
		return edctn_final_yn;
	}
	public void setEdctn_final_yn(String edctn_final_yn) {
		this.edctn_final_yn = edctn_final_yn;
	}
	
	@Override
	public String toString() {
		return "[Tb_006] " + "edctn_dtls_proper_num : " + edctn_dtls_proper_num + 
				", aplcn_dtls_proper_num : "+ aplcn_dtls_proper_num +
				", edctn_school_name" + edctn_school_name + 
				", edctn_major" + edctn_major + 
				", edctn_degree" + edctn_degree + 
				", edctn_admsn_date" + edctn_admsn_date + 
				", edctn_grdtn_date" + edctn_grdtn_date + 
				", edctn_final_yn" + edctn_final_yn 
				;
				
	}    
	
}
