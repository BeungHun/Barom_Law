package com.br.law.mapper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_014;

public interface ApplicationRegistrationAdminMapper {
	
	public List<Map<String, Object>> selUserList();
	//기존
//	public Map<String, Object> onestExamination(Map<String, Object> param);
	//신규
	public Map<String, Object> onestExamination(int aplcn_dtls_proper_num);
	
	public void upComplete(int param);
	
	public void upFail(int param);
	
	public void acceptIns(Tb_014 param);

	public Tb_005 getFive(int param);
	
	public Map<String, Object> forComplete(Map<String, Object> param);

	public List<Tb_009> uploadFileSel(int param);
	
	public Tb_001 getUserNameAndPk(int param);
	
	public int userDetailPk(int param);
	
	public Tb_009 noForUploadFileSel(int param);
	
	public void companionUp(int param);
	
	public void evaluationCpUp(int param);
	
	//조건별 조회 (서류통과, 반려, 진행중)
	public List<Map<String, Object>> accList();
		
	// optionBox 조건별 불러오기
	public List<Tb_010> optionBoxapp();
	
	//22.10.04 신우진 추가 : 활동중인 명단 중 이름 검색 기능
	public List<Map<String, Object>> searchUserName(Map<String, Object> map);
}
