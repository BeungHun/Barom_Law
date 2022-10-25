package com.br.law.mapper.member;

import java.util.ArrayList;

import com.br.law.vo.Tb_004;

public interface FaqSQLMapper {
	
	public void insertFaq(Tb_004 tb_004);
	public ArrayList<Tb_004> selectAll();
	public Tb_004 selectByNo(int faq_proper_num);
	public void deleteByNo(int faq_proper_num);
	public void updateFaq(Tb_004 tb_004);	
}