package com.br.law.mapper.member;

import java.util.ArrayList;

import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_003;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_015;

public interface NoticeSQLMapper {
	
	public void insertNoticeBoard(Tb_003 tb_003);
	public void insertTrialAssistantRegisterBorad(Tb_002 tb_002);
	
	public ArrayList<Tb_003> selectByAll(Tb_003 tb_003);
	public ArrayList<Tb_002> selectByAllRegisterBoard(Tb_002 tb_002);
	
	public ArrayList<Tb_010> selectTrialFcltt();
	
	public Tb_003 selectNoticeByNo(int notice_proper_num);
	public Tb_002 selectTrialAssistantByNo(int announce_proper_num);
	public Tb_010 selectTb010VoByPk (int trial_fcltt_proper_num);
	public Tb_015 selectAdminByNo(int admin_proper_num);
	
	public void deleteMyNoticeByNo(int notice_proper_num);
	public void deleteMytrialAssistantByNo(int announce_proper_num);
	
	public void updateNoitceData(Tb_003 tb_003);
	public void updateTrialAssistantData(Tb_002 tb_002);
	


	
}
