package com.br.law.vo;

public class Tb_010 {
	private int trial_fcltt_proper_num;
	private String trial_fcltt_clasifi_code;
	private String trial_fcltt_sbcls_code;
	private String trial_fcltt_description;
	public Tb_010() {
		super();
	}
	public Tb_010(int trial_fcltt_proper_num, String trial_fcltt_clasifi_code, String trial_fcltt_sbcls_code,
			String trial_fcltt_description) {
		super();
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
		this.trial_fcltt_clasifi_code = trial_fcltt_clasifi_code;
		this.trial_fcltt_sbcls_code = trial_fcltt_sbcls_code;
		this.trial_fcltt_description = trial_fcltt_description;
	}
	public int getTrial_fcltt_proper_num() {
		return trial_fcltt_proper_num;
	}
	public void setTrial_fcltt_proper_num(int trial_fcltt_proper_num) {
		this.trial_fcltt_proper_num = trial_fcltt_proper_num;
	}
	public String getTrial_fcltt_clasifi_code() {
		return trial_fcltt_clasifi_code;
	}
	public void setTrial_fcltt_clasifi_code(String trial_fcltt_clasifi_code) {
		this.trial_fcltt_clasifi_code = trial_fcltt_clasifi_code;
	}
	public String getTrial_fcltt_sbcls_code() {
		return trial_fcltt_sbcls_code;
	}
	public void setTrial_fcltt_sbcls_code(String trial_fcltt_sbcls_code) {
		this.trial_fcltt_sbcls_code = trial_fcltt_sbcls_code;
	}
	public String getTrial_fcltt_description() {
		return trial_fcltt_description;
	}
	public void setTrial_fcltt_description(String trial_fcltt_description) {
		this.trial_fcltt_description = trial_fcltt_description;
	}
	
	@Override
	public String toString() {
		return "[Tb_010] " + "trial_fcltt_proper_num : " + trial_fcltt_proper_num + 
				", trial_fcltt_clasifi_code : "+ trial_fcltt_clasifi_code +
				", trial_fcltt_sbcls_code" + trial_fcltt_sbcls_code + 
				", trial_fcltt_description" + trial_fcltt_description;
				
	}    
	
}
