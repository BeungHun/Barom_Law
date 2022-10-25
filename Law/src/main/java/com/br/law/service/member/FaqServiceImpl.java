package com.br.law.service.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.mapper.admin.ApplicationRegistrationAdminMapper;
import com.br.law.mapper.member.FaqSQLMapper;
import com.br.law.vo.Tb_004;

@Service
public class FaqServiceImpl {
	
	@Autowired
	public ApplicationRegistrationAdminMapper applicationRegistrationAdminMapper;
	
	@Autowired
	private FaqSQLMapper faqSQLMapper;
	
	public void writeFaq(Tb_004 tb_004) {
		faqSQLMapper.insertFaq(tb_004);
	}
	
	public ArrayList<Tb_004> getFaqDataList(){
		
		ArrayList<Tb_004> faqList = faqSQLMapper.selectAll();
		
	
		return faqList;
	}
	
	public HashMap<String, Object> getFaqData(int faq_proper_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Tb_004 tb_004 = faqSQLMapper.selectByNo(faq_proper_num);
		
		map.put("tb_004", tb_004);
		
		return map;
	}
	
	public void deleteFaq(int faq_proper_num) {
		faqSQLMapper.deleteByNo(faq_proper_num);
	}
	
	public void updateFaq(Tb_004 tb_004) {
		faqSQLMapper.updateFaq(tb_004);
	}
	
}