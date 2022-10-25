package com.br.law.service.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.mapper.admin.TrialAdminMapper;
import com.br.law.mapper.member.NoticeSQLMapper;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_003;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_015;

@Service
public class NoticeService {

	@Autowired
	private NoticeSQLMapper noticeSQLMapper;
	
	@Autowired
	private TrialAdminMapper trialAdminMapper;
	
	public void writeNoticeBoard(Tb_003 tb_003){
		noticeSQLMapper.insertNoticeBoard(tb_003);
	}
	
	public ArrayList<HashMap<String, Object>> getNoticeBoard(){
		
		ArrayList<HashMap<String, Object>> noticeDataList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<Tb_003> noticeBoardList = noticeSQLMapper.selectByAll(null);
		for(Tb_003 tb_003 : noticeBoardList) {
			int admin_proper_num = tb_003.getAdmin_proper_num();
			Tb_015 noticeAdmin = noticeSQLMapper.selectAdminByNo(admin_proper_num);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("tb_003", tb_003);
			map.put("noticeAdmin", noticeAdmin);
			
			noticeDataList.add(map);
		}
		
		return noticeDataList;
		
		 
	}
	
	public ArrayList<HashMap<String, Object>> getTrialAssistantBoard(){
		
		ArrayList<HashMap<String, Object>> trialAssistantDataList = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<Tb_002> trialAssistantList = noticeSQLMapper.selectByAllRegisterBoard(null);
		for (Tb_002 tb_002 : trialAssistantList) {
			int admin_proper_num = tb_002.getAdmin_proper_num();
			Tb_015 noticeAdmin = noticeSQLMapper.selectAdminByNo(admin_proper_num);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("tb_002", tb_002);
			map.put("noticeAdmin", noticeAdmin);
			
			trialAssistantDataList.add(map);
		}
		
		return trialAssistantDataList;
				
	}
	
	
	public HashMap<String, Object> getSelectTrialAssistantBoard(int announce_proper_num){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Tb_002 tb_002 = noticeSQLMapper.selectTrialAssistantByNo(announce_proper_num);
		Tb_010 tb_010 = noticeSQLMapper.selectTb010VoByPk(tb_002.getTrial_fcltt_proper_num());
		Tb_015 noticeAdmin = trialAdminMapper.selectByNo(tb_002.getAdmin_proper_num());
		
		map.put("tb_002", tb_002);
		map.put("tb_010", tb_010);
		map.put("noticeAdmin", noticeAdmin);
		
		return map;
	}
	
	
	
	public HashMap<String, Object> getNoticeData(int notice_proper_num){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Tb_003 tb_003 = noticeSQLMapper.selectNoticeByNo(notice_proper_num);
		int admin_proper_num = tb_003.getAdmin_proper_num();
		Tb_015 noticeAdmin = trialAdminMapper.selectByNo(admin_proper_num);
		
		
		map.put("tb_003", tb_003);
		map.put("noticeAdmin", noticeAdmin);
		
		return map;
	}
	
	public void deleteMyNotice(int notice_proper_num) {
		noticeSQLMapper.deleteMyNoticeByNo(notice_proper_num);
		
	}
	
	public void deleteMytrialAssistant(int announce_proper_num) {
		noticeSQLMapper.deleteMytrialAssistantByNo(announce_proper_num);
	}
	
	
	public void updateMyNotice(Tb_003 tb_003) {
		noticeSQLMapper.updateNoitceData(tb_003);
	}
	
	public void updateMyTrialAssistant(Tb_002 tb_002) {
		noticeSQLMapper.updateTrialAssistantData(tb_002);
	}

	
	public void writeTrialAssistantRegisterBorad(Tb_002 tb_002) {
		
		noticeSQLMapper.insertTrialAssistantRegisterBorad(tb_002);
	}
	
	public ArrayList<Tb_010> getTrialFcltt(){
		
		return noticeSQLMapper.selectTrialFcltt();
		
	}
	

}


