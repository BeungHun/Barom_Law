package com.br.law.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.law.service.admin.TrialAdminService;
import com.br.law.service.user.TrialUserService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_015;

@RestController
@RequestMapping("/member/*")
public class RestLoginController {
		
	@Autowired
	private TrialUserService trialMainService;
	@Autowired
	private TrialAdminService trialAdminService;

	@RequestMapping("chkID")
	public Map<String, Object> chkID(@RequestParam("inputId") String id, @RequestParam("inputPw") String pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 어드민의 아이디 있는지 Chk
		Tb_015 admin = new Tb_015();
		admin.setAdmin_id(id);
		
		map.put("result", "success");
		map.put("admin", trialAdminService.chkID(admin));
		return map;
	}
	
	
}
