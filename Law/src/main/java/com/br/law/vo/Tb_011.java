package com.br.law.vo;

public class Tb_011 {
	private int court_proper_num;
	private String court_name;
	public Tb_011() {
		super();
	}
	public Tb_011(int court_proper_num, String court_name) {
		super();
		this.court_proper_num = court_proper_num;
		this.court_name = court_name;
	}
	public int getCourt_proper_num() {
		return court_proper_num;
	}
	public void setCourt_proper_num(int court_proper_num) {
		this.court_proper_num = court_proper_num;
	}
	public String getCourt_name() {
		return court_name;
	}
	public void setCourt_name(String court_name) {
		this.court_name = court_name;
	}
	@Override
	public String toString() {
		return "[Tb_011] " + "court_proper_num : " + court_proper_num + 
				", court_name : "+ court_name ;
		}
	
	
}
