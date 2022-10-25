package com.br.law.mapper.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;

public interface TrialUserMapper {
//	public User login(User user);
	public Tb_001 login(Tb_001 user);
	
	public Tb_001 example(Tb_001 user);
	
	public Tb_001 seluser(Tb_001 user);
	
	public Tb_001 selectMyInfo(int user_proper_num);
	
	// 내정보
	public int modifyMyInfo(Tb_001 user);
	
	// 비밀번호 변경
	public int modifyPassword(@Param("user_proper_num") int user_proper_num, @Param("new_pw") String new_pw);
	
	// 회원 탈퇴
	public int withdrawal(@Param("user_proper_num") int user_proper_num, @Param("user_pw") String user_pw);
	
	// 나의 등재신청 정보 리스트 출력
	public List<Map<String, Object>> selectMyApplicationList(int user_proper_num);
	
	// 나의 등재신청 내역 상세보기
	public Map<String, Object> selectMyApplication(int aplcn_dtls_proper_num);
	
	// 나의 기본정보 수정
	public int modifyUserDetail(int user_proper_num);
	
	// 나의 등재신청정보 수정
	public int modifyTableFive(Tb_005 param);
	
	// 나의 등재신청 학력정보 수정
	public int modifyTableSix(Tb_006 param);
	
	// 나의 등재신청 경력정보 수정
	public int modifyTableSeven(Tb_007 param);
	
	// 나의 등재신청 자격증정보 수정
	public int modifyTableEight(Tb_008 param);
	
	// 나의 등재신청 첨부파일정보 수정
	public int modifyTableNine(Tb_009 param);
	
	// 등재신청번호 & 서류타입으로 나의 등재신청 첨부파일 정보 조회
	public Tb_009 selectTableNineByAplcnNoAndFileType(@Param("aplcn_dtls_proper_num") int aplcn_dtls_proper_num, @Param("file_type") String file_type);
	
	// 등재신청 상태 변경
	public int updateApplicationStatus(@Param("aplcn_dtls_proper_num") int aplcn_dtls_proper_num, @Param("aplcn_dtls_sts") String aplcn_dtls_sts);
	
	// 나의 활동내역 리스트
	public List<Map<String, Object>> selectMyActiveList(int user_proper_num);
	
	// 나의 등재(활동)리스트
	public List<Map<String, Object>> selectMyAcceptList(int user_propeR_num);
	
	// 나의 활동여부 변경
	public int updateAcceptActYn(@Param("accept_proper_num") int accept_proper_num, @Param("accept_act_yn") String accept_act_yn);

}
