package com.br.law.service.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.mapper.user.ApplicationRegistrationMapper;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;

@Service
public class ApplicationRegistrationService {

	@Autowired
	private ApplicationRegistrationMapper applicationRegistrationMapper;
	//
	
	public void userIns(Tb_001 param) {
		applicationRegistrationMapper.userIns(param);
	}
	
	
	public void UserDetailExam(int aplcn_dtls_proper_num) {
		applicationRegistrationMapper.UserDetailExam(aplcn_dtls_proper_num);
	}
	public Tb_005 userDetailIns(Tb_005 param) {
		applicationRegistrationMapper.userDetailIns(param);
		return applicationRegistrationMapper.userDetailSel(param);
	}//insert 시 session에 담음
	public Tb_005 userDetailUp(Tb_005 param) {
		System.out.println("업데이트 시작 왔니?");
		applicationRegistrationMapper.userDetailUp(param);
		System.out.println("업데이트 끝 왔니?");
		return applicationRegistrationMapper.userDetailSel(param);
	}// update 시 session에 담음
	public Tb_005 userDetailSel(Tb_005 param) {
		return applicationRegistrationMapper.userDetailSel(param);
	}//임시저장시 불러오기 용
	public int userDetailCount(@Param("user_proper_num")int user_proper_num, 
			@Param("announce_proper_num")int announce_proper_num) {
		return applicationRegistrationMapper.userDetailCount(user_proper_num, announce_proper_num);
	}
	
	
	public void univIns(Tb_006 param) {
		applicationRegistrationMapper.univIns(param);
	}
	public void univUp(Tb_006 param) {
		applicationRegistrationMapper.univUp(param);
	}
	public Tb_006 univSel(Tb_006 param) {
		return applicationRegistrationMapper.univSel(param);
	}
	public int univCount(int aplcn_dtls_proper_num) {
		return applicationRegistrationMapper.univCount(aplcn_dtls_proper_num);
	}
	
	
	public void careerIns(Tb_007 param) {
		applicationRegistrationMapper.careerIns(param);
	}
	public void careerUp(Tb_007 param) {
		applicationRegistrationMapper.careerUp(param);
	}
	public Tb_007 careerSel(Tb_007 param) {
		return applicationRegistrationMapper.careerSel(param);
	}
	public int careerCount(int aplcn_dtls_proper_num) {
		return applicationRegistrationMapper.careerCount(aplcn_dtls_proper_num);
	}
	
	public void licenseIns(Tb_008 param) {
		applicationRegistrationMapper.licenseIns(param);
	}
	public void licenseUp(Tb_008 param) {
		applicationRegistrationMapper.licenseUp(param);
	}
	public Tb_008 licenceSel(Tb_008 param) {
		return applicationRegistrationMapper.licenceSel(param);
	}
	public int licenceCount(int aplcn_dtls_proper_num) {
		return applicationRegistrationMapper.licenceCount(aplcn_dtls_proper_num);
	}
	
	public void uploadFilesIns(ArrayList<Tb_009> param) {
		for(Tb_009 nine : param) {
			applicationRegistrationMapper.uploadFilesIns(nine);
			System.out.println("service 여긴 들어오나? : " +  nine);
		}
		System.out.println("service 여긴 들어오나? : " +  param.toString());
	}
	
	public int duplicate(int paramOne, int paramTwo) {
		return applicationRegistrationMapper.duplicate(paramOne, paramTwo);
	}
	
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap){
		return applicationRegistrationMapper.autocomplete(paramMap);
	}
	
	public List<Tb_002> asd() {
		return applicationRegistrationMapper.asd();
	}
	
	public boolean registerOverLabCheck(String param) {
		System.out.println("param" + param);
		if(applicationRegistrationMapper.registerOverLabCheck(param) > 0 ) {
			//중복 아이디가 존재함
			return true;
		}else {
			//중복 아이디가 없음
			return false;
		}
		
	}
	
	//22.09.27 임병훈 추가
	//현재 모집 중인 재판조력자 리스트 추출
	public ArrayList<Tb_010> chkFcltt(){
		return applicationRegistrationMapper.chkTodayFcltt();
	}
	
	//현재 모집 중인 재판조력자 리스트 중 중분류 추출
	public ArrayList<String> searchMiddleLevel(ArrayList<Tb_010> list){
		return (ArrayList<String>) list.stream()
				.map(Tb_010::getTrial_fcltt_clasifi_code)
				.distinct()
				.collect(Collectors.toList());
	}
	
	//현재 모집 중인 재판조력자 리스트 중 소분류 추출
	public ArrayList<String> searchSmallLevel(ArrayList<Tb_010> list, String str){
		return (ArrayList<String>) list.stream()
				.filter(tb_010 -> tb_010.getTrial_fcltt_clasifi_code().equals(str))
				.map(Tb_010::getTrial_fcltt_sbcls_code)
				.distinct()
				.collect(Collectors.toList());
	}
	
	//임시저장 Ajax를 위한 Tb_010찾기 
	public Tb_010 searchTb010ByTb010(Tb_010 tb_010) {
		return applicationRegistrationMapper.selectVoByCodes(tb_010);
	}
	
	//임시저장 Ajax를 위한 Tb_002찾기 
	public Tb_002 searchTb002ByTb010(Tb_010 tb_010) {
		tb_010 = applicationRegistrationMapper.selectVoByCodes(tb_010);
		return applicationRegistrationMapper.selectVoByTb_010(tb_010);
	}
	
	
	
}
