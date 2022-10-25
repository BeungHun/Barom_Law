package com.br.law.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.br.law.service.admin.TrialAdminService;
import com.br.law.vo.Tb_015;

@Controller
@RequestMapping("/admin/*")
public class TrialAdminController {
	
	
	@Autowired
	private TrialAdminService trialAdminService;
	
	
	@RequestMapping("loginAdmin")
	public String login(){
		return "admin/loginAdmin";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("inputId") String id, @RequestParam("inputPw") String pw) throws Exception{
		
		Tb_015 param = new Tb_015();
		param.setAdmin_id(id);
		param.setAdmin_pw(pw);
		
		Tb_015 admin = trialAdminService.login(param);
		if(admin == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('비밀번호를 다시 입력해주세요.'); location.href='../user/main' </script> ");
			out.flush();
			out.close();
			return "redirect:" + request.getHeader("referer");
		}else {
			session.setAttribute("admin", admin);
			return "redirect:" + request.getHeader("referer");
		}
	}
	
	// 하다 수정 10-11 로그아웃시 메세지 출력
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('로그아웃 되었습니다.'); location.href='../user/main' </script> ");
		out.flush();
		out.close();
		return "redirect:../user/main";
	}
	
	@RequestMapping("boardAdmin")
	public String boardAdmin() {
		return "admin/boardAdmin";
	}
	
	@RequestMapping("statusAdmin")
	public String statusAdmin() {
		return "admin/statusAdmin";
	}
	
	@RequestMapping("assistantAdmin")
	public String assistantAdmin() {
		return "admin/assistantAdmin";
	}
	
	@RequestMapping("exampleProcess")
	public String exampleProcess(HttpSession session, Tb_015 param) {
		Tb_015 admin = trialAdminService.example(param);
		session.setAttribute("admin", admin);
		System.out.println("session" + session.getAttribute("admin"));
		return "redirect:../user/main";
	}
}
