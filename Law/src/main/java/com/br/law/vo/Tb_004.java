package com.br.law.vo;

public class Tb_004 {
	private int faq_proper_num;
	private int admin_proper_num;
	private String faq_ask_content;
	private String faq_ask_comment;
	
	public Tb_004() {
		super();
	}

	public Tb_004(int faq_proper_num, int admin_proper_num, String faq_ask_content, String faq_ask_comment) {
		super();
		this.faq_proper_num = faq_proper_num;
		this.admin_proper_num = admin_proper_num;
		this.faq_ask_content = faq_ask_content;
		this.faq_ask_comment = faq_ask_comment;
	}

	public int getFaq_proper_num() {
		return faq_proper_num;
	}

	public void setFaq_proper_num(int faq_proper_num) {
		this.faq_proper_num = faq_proper_num;
	}

	public int getAdmin_proper_num() {
		return admin_proper_num;
	}

	public void setAdmin_proper_num(int admin_proper_num) {
		this.admin_proper_num = admin_proper_num;
	}

	public String getFaq_ask_content() {
		return faq_ask_content;
	}

	public void setFaq_ask_content(String faq_ask_content) {
		this.faq_ask_content = faq_ask_content;
	}

	public String getFaq_ask_comment() {
		return faq_ask_comment;
	}

	public void setFaq_ask_comment(String faq_ask_comment) {
		this.faq_ask_comment = faq_ask_comment;
	}
	
	@Override
	public String toString() {
		return "[Tb_004] " + "faq_proper_num : " + faq_proper_num + 
				", admin_proper_num : "+ admin_proper_num +
				", faq_ask_content" + faq_ask_content + 
				", faq_ask_comment" + faq_ask_comment 
				;
				
	}    
		
}
