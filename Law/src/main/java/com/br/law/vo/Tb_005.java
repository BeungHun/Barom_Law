package com.br.law.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Tb_005 {
	private int aplcn_dtls_proper_num;
	private int user_proper_num;
	private int announce_proper_num;
	private int trial_fcltt_proper_num;
	private int court_proper_num;
	private String ligtn_case_carer_yn;
	private String ligtn_case_carer_etc;
	private String insrn_indst_carer_yn;
	private String insrn_indst_carer_etc;
	private String criminal_penalty_carer_yn;
	private String criminal_penalty_carer_etc;
	private String aplcn_dtls_sts;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date aplcn_dtls_date;
	 
	public Tb_005() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tb_005(int aplcn_dtls_proper_num, int user_proper_num, int announce_proper_num, int court_proper_num,
			int trial_fcltt_proper_num, String ligtn_case_carer_yn, String ligtn_case_carer_etc,
			String insrn_indst_carer_yn, String insrn_indst_carer_etc, String criminal_penalty_carer_yn,
			String criminal_penalty_carer_etc, String aplcn_dtls_sts, Date aplcn_dtls_date) {
		super();
		this.aplcn_dtls_proper_num = aplcn_dtls_proper_num;
		this.user_proper_num = user_proper_num;
		this.announce_proper_num = announce_proper_num;
		this.court_proper_num = court_proper_num;
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
		this.ligtn_case_carer_yn = ligtn_case_carer_yn;
		this.ligtn_case_carer_etc = ligtn_case_carer_etc;
		this.insrn_indst_carer_yn = insrn_indst_carer_yn;
		this.insrn_indst_carer_etc = insrn_indst_carer_etc;
		this.criminal_penalty_carer_yn = criminal_penalty_carer_yn;
		this.criminal_penalty_carer_etc = criminal_penalty_carer_etc;
		this.aplcn_dtls_sts = aplcn_dtls_sts;
		this.aplcn_dtls_date = aplcn_dtls_date;
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

	public int getAnnounce_proper_num() {
		return announce_proper_num;
	}

	public void setAnnounce_proper_num(int announce_proper_num) {
		this.announce_proper_num = announce_proper_num;
	}

	public int getCourt_proper_num() {
		return court_proper_num;
	}

	public void setCourt_proper_num(int court_proper_num) {
		this.court_proper_num = court_proper_num;
	}

	public int getTrial_fcltt_proper_num() {
		return trial_fcltt_proper_num;
	}

	public void setTrial_fcltt_proper_num(int trial_fcltt_proper_num) {
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
	}

	public String getLigtn_case_carer_yn() {
		return ligtn_case_carer_yn;
	}

	public void setLigtn_case_carer_yn(String ligtn_case_carer_yn) {
		this.ligtn_case_carer_yn = ligtn_case_carer_yn;
	}

	public String getLigtn_case_carer_etc() {
		return ligtn_case_carer_etc;
	}

	public void setLigtn_case_carer_etc(String ligtn_case_carer_etc) {
		this.ligtn_case_carer_etc = ligtn_case_carer_etc;
	}

	public String getInsrn_indst_carer_yn() {
		return insrn_indst_carer_yn;
	}

	public void setInsrn_indst_carer_yn(String insrn_indst_carer_yn) {
		this.insrn_indst_carer_yn = insrn_indst_carer_yn;
	}

	public String getInsrn_indst_carer_etc() {
		return insrn_indst_carer_etc;
	}

	public void setInsrn_indst_carer_etc(String insrn_indst_carer_etc) {
		this.insrn_indst_carer_etc = insrn_indst_carer_etc;
	}

	public String getCriminal_penalty_carer_yn() {
		return criminal_penalty_carer_yn;
	}

	public void setCriminal_penalty_carer_yn(String criminal_penalty_carer_yn) {
		this.criminal_penalty_carer_yn = criminal_penalty_carer_yn;
	}

	public String getCriminal_penalty_carer_etc() {
		return criminal_penalty_carer_etc;
	}

	public void setCriminal_penalty_carer_etc(String criminal_penalty_carer_etc) {
		this.criminal_penalty_carer_etc = criminal_penalty_carer_etc;
	}

	public String getAplcn_dtls_sts() {
		return aplcn_dtls_sts;
	}

	public void setAplcn_dtls_sts(String aplcn_dtls_sts) {
		this.aplcn_dtls_sts = aplcn_dtls_sts;
	}

	public Date getAplcn_dtls_date() {
		return aplcn_dtls_date;
	}

	public void setAplcn_dtls_date(Date aplcn_dtls_date) {
		this.aplcn_dtls_date = aplcn_dtls_date;
	}

	@Override
	public String toString() {
		return "[Tb_005] " + "aplcn_dtls_proper_num : " + aplcn_dtls_proper_num + 
				", user_proper_num : "+ user_proper_num +
				", announce_proper_num" + announce_proper_num + 
				", court_proper_num" + court_proper_num + 
				", trial_fcltt_proper_num" + trial_fcltt_proper_num + 
				", ligtn_case_carer_yn" + ligtn_case_carer_yn + 
				", ligtn_case_carer_etc" + ligtn_case_carer_etc + 
				", insrn_indst_carer_yn" + insrn_indst_carer_yn + 
				", insrn_indst_carer_etc" + insrn_indst_carer_etc + 
				", criminal_penalty_carer_yn" + criminal_penalty_carer_yn + 
				", criminal_penalty_carer_etc" + criminal_penalty_carer_etc +
				", aplcn_dtls_sts" + aplcn_dtls_sts 
				;
	}    
	
    
}
