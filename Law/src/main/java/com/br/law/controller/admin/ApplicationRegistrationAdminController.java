package com.br.law.controller.admin;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.service.admin.ApplicationRegistrationAdminService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_014;

@Controller
@RequestMapping("/admin/*")
public class ApplicationRegistrationAdminController {

	@Autowired
	ApplicationRegistrationAdminService applicationRegistrationAdminService ;
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ApplicationRegistrationAdminController.class);
	
//
	
	@RequestMapping("selUserList")
	public String selUserList(Model model) {
		List<Map<String, Object>> map = applicationRegistrationAdminService.selUserList();
		
		model.addAttribute("list", map);
		logger.info("userList 확인용 : " + map);
		
		return"admin/selUserList";
	}
	
	@RequestMapping("selUserListDetail")
	public String selUserListDetail(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int userNo = Integer.parseInt(request.getParameter("aplcn_dtls_proper_num"));
		map.put("aplcn_dtls_proper_num", userNo);
		Map<String, Object> param = applicationRegistrationAdminService.onestExamination(userNo);
		List<Tb_009> list = applicationRegistrationAdminService.uploadFileSel(userNo);
		
		model.addAttribute("map" , param);
		model.addAttribute("fileList", list);
		
		return "admin/selUserListDetail";
	}
	
	
	
	//불합격 상태 변경 프로세스
	@RequestMapping("upFailProcess")
	public String upFailProcess(int aplcn_dtls_proper_num) {
		applicationRegistrationAdminService.upFail(aplcn_dtls_proper_num);
		return "redirect:../user/main";
	}
	//합격 상태 변경 페이지 이동
	@RequestMapping("accept")
	public String accept(Model model, int aplcn_dtls_proper_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hi", aplcn_dtls_proper_num);
		Map<String, Object> getAll = applicationRegistrationAdminService.forComplete(map);
		model.addAttribute("map", getAll);
		return "admin/accept";
	}
	//합격 상태 변경 페이지 이동
	@RequestMapping("acceptProcess")
	public String acceptProcess(Model model,Tb_014 ins ,Tb_005 param, @Param("aplcn_dtls_proper_num")int aplcn_dtls_proper_num) {
		System.out.println("안들어올껄" + aplcn_dtls_proper_num);
		//five 전체
		param = applicationRegistrationAdminService.getFive(aplcn_dtls_proper_num);

//		여기서 선언을 해버리면 insert할때 param에서 가져올 수 없기 때문에 조심해야된다 sql 1111 typeException : xml, vo가 스펠링이 틀렸거나 param을 못받는경우 생김
//		Tb_014 ins = new Tb_014();

		ins.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
		ins.setCourt_proper_num(param.getCourt_proper_num());
		ins.setUser_proper_num(param.getUser_proper_num());
		
		logger.info("확인용 : " + ins);
		
		applicationRegistrationAdminService.acceptIns(ins);
		applicationRegistrationAdminService.upComplete(aplcn_dtls_proper_num);
		return "redirect:../user/main";
	}
	
	@RequestMapping("evaluationProcess")
	public String evaluationProcess(int aplcn_dtls_proper_num) {
		applicationRegistrationAdminService.evaluationCpUp(aplcn_dtls_proper_num);
		return "redirect:../admin/searchCondition";
	}
	
	@RequestMapping("companionProcess")
	public String companionProcess(int aplcn_dtls_proper_num) {
		applicationRegistrationAdminService.companionUp(aplcn_dtls_proper_num);
		return "redirect:../admin/searchCondition";
	}
	
	@RequestMapping("fileDownLoadProcess")
	public String fileDownLoadProcess(HttpServletResponse response, 
			@Param("aplcn_dtls_proper_num")int aplcn_dtls_proper_num,
			@Param("aplcn_atch_file_proper_num")int aplcn_atch_file_proper_num) {
		System.out.println("확인" + aplcn_atch_file_proper_num);
		System.out.println("확인" + aplcn_dtls_proper_num);
		Map<String, Object> map = new HashMap<>();
		//유저 넘버
		int fiveNo =  applicationRegistrationAdminService.userDetailPk(aplcn_dtls_proper_num);
		//유저 정보
		Tb_001 one = applicationRegistrationAdminService.getUserNameAndPk(fiveNo);
		
		Tb_009 nine = applicationRegistrationAdminService.noForUploadFileSel(aplcn_atch_file_proper_num);
		

		
		String userNo = Integer.toString(fiveNo);
		String userName = one.getUser_name();
		String sum = userNo + userName;
		System.out.println("확인방법?" + sum);
		

		
		String filename = nine.getOriginal_file_name();
		
		File file = new File(nine.getFile_path());

		try {
			byte[] data = FileUtils.readFileToByteArray(file);
			
			response.setContentType("application/octet-stream");
			response.setContentLength(data.length);
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(filename, "UTF-8") + "\";");

			response.getOutputStream().write(data);
			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (IOException e) {
			throw new RuntimeException("파일 다운로드에 실패하였습니다.");

		} catch (Exception e) {
			throw new RuntimeException("시스템에 문제가 발생하였습니다.");
		}
		map.put("result", "success");
		
		return "admin/fileDownLoadProcess";
	}
	
	@RequestMapping("acting")
	public String acting() {
		return "user/acting";
	}
	

	
	
}
