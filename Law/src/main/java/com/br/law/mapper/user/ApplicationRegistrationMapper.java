package com.br.law.mapper.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;

public interface ApplicationRegistrationMapper {
	
	
	public void userIns(Tb_001 param);
	
	public void UserDetailExam(@Param("aplcn_dtls_proper_num") int aplcn_dtls_proper_num);
	public void userDetailIns(Tb_005 param); //인서트
	public void userDetailUp(Tb_005 param); //업데이트
	public Tb_005 userDetailSel(Tb_005 param); //5번 select
	public int userDetailCount(@Param("user_proper_num")int user_proper_num, //어떤게 user넘버인지 어떤게 공지넘버인지 모르기때문에 지정해줘야됨
			@Param("announce_proper_num")int announce_proper_num);
	
	public void univIns(Tb_006 param);
	public void univUp(Tb_006 param);
	public Tb_006 univSel(Tb_006 param);
	public int univCount(int aplcn_dtls_proper_num);
	
	public void careerIns(Tb_007 param);
	public void careerUp(Tb_007 param);
	public Tb_007 careerSel(Tb_007 param);
	public int careerCount(int aplcn_dtls_proper_num);
	
	
	public void licenseIns(Tb_008 param);
	public void licenseUp(Tb_008 param);
	public Tb_008 licenceSel(Tb_008 param);
	public int licenceCount(int aplcn_dtls_proper_num);
	
	
	
	public int uploadFilesIns(Tb_009 param);
	
	public int duplicate(@Param("announce_proper_num") int paramOne,  @Param("user_proper_num") int paramTwo);
	
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap);
	
	public List<Tb_002> asd();
	
	public int registerOverLabCheck(String param);

	//22.09.27 임병훈 추가 : 현재 모집 중인 재판조력자 추출
	public ArrayList<Tb_010> chkTodayFcltt();
	public Tb_010 selectVoByCodes(Tb_010 tb_010);
	public Tb_002 selectVoByTb_010(Tb_010 tb_010);
	
	
}
