package com.br.law.mapper.admin;

import com.br.law.vo.Tb_015;

public interface TrialAdminMapper {
	public int chkID(Tb_015 admin);

	public Tb_015 login(Tb_015 admin);
	
	public Tb_015 example(Tb_015 admin);
	
	public Tb_015 selectByNo(int admin_proper_num);
}
