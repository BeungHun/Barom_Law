package com.br.law.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.br.law.service.user.ApplicationRegistrationService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;

@RestController
@RequestMapping("/user/*")
public class RestApplicationRegistrationUserController {

	@Autowired
	ApplicationRegistrationService applicationRegistrationService;
	//
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(RestApplicationRegistrationUserController.class);
	
	@RequestMapping("registerOverLabCheck")
	public HashMap<String, Object> registerOverLabCheck(@RequestParam("user_id")String user_id){
		System.out.println("aaa" +  user_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
	 	//true = 아이디존재, false = 중복아이디 없음
	 	map.put("count", applicationRegistrationService.registerOverLabCheck(user_id));
	 	
	 	return map;
	}
	
	@RequestMapping("isLogin")
	public Map<String, Object> isLogin(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		if(session.getAttribute("user") != null) {
			map.put("data", true);
		}else {
			map.put("data", false);
		}
		
		map.put("result", "success");
		System.out.println("he" + map);
		return map;
	}
	
	// 모집 중인 재판 조력자 불러오기
	@RequestMapping("chkFcltt")
	public HashMap<String, Object> chkFcltt() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Tb_010> list = applicationRegistrationService.chkFcltt();
 		
		map.put("result", "success");
		map.put("mLevel", applicationRegistrationService.searchMiddleLevel(list));
		return map;
	}
	
	// 재판조력자 소분류 불러오기
	@RequestMapping("callSmallLevel")
	public HashMap<String, Object> callSmallLevel(String mLevel) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Tb_010> list = applicationRegistrationService.chkFcltt();
 		
		map.put("result", "success");
		map.put("sLevel", applicationRegistrationService.searchSmallLevel(list, mLevel));
		return map;
	}
	
	// 소분류 선택시 임시저장 여부 불러오기
	@RequestMapping("chkTempData")
	public HashMap<String, Object> chkTempData(HttpSession session, String mLevel, String sLevel){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Tb_010 tb_010 = new Tb_010();
		tb_010.setTrial_fcltt_clasifi_code(mLevel);
		tb_010.setTrial_fcltt_sbcls_code(sLevel);
		
		tb_010 = applicationRegistrationService.searchTb010ByTb010(tb_010);
		Tb_002 tb_002 = applicationRegistrationService.searchTb002ByTb010(tb_010);
		
		int announce_proper_num = tb_002.getAnnounce_proper_num();
		Tb_001 user = (Tb_001)session.getAttribute("user");
		
		int user_proper_num = user.getUser_proper_num();
		//카운트
		int alpa = applicationRegistrationService.userDetailCount(user_proper_num, announce_proper_num);
		int beta = applicationRegistrationService.duplicate(announce_proper_num, user_proper_num);
		
		Tb_005 param = new Tb_005();
		param.setUser_proper_num(user_proper_num);
		param.setAnnounce_proper_num(announce_proper_num);
		
		if(beta != 0) {
			map.put("result", "fail");
			return map;
		}else {
			//기존에 자료가 있다면 자료 값 불러옴 
			map.put("result", "success");
			if(alpa != 0) {
				//자료가 없으면 불러오지 않음
				map.put("alpa", true);
				map.put("count", alpa);
				map.put("tb_005", applicationRegistrationService.userDetailSel(param));
			}
		}
		return map;
		
	}
	
	@RequestMapping("user/multiFileUpload")
	public Map<String, Object> requestupload1(HttpSession session, MultipartHttpServletRequest request, Tb_009 upload) {
		System.out.println("실행");
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MultipartFile> fileList = request.getFiles("file");
		ArrayList<Tb_009> list = new ArrayList<Tb_009>();
		
		String[] code = request.getParameterValues("file_code");
		String[] type = request.getParameterValues("file_type");
		
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		
		Tb_001 one = (Tb_001)session.getAttribute("user");
		int userNo  = one.getUser_proper_num();
		String userName = one.getUser_name();
		
		
		int i = 0;
		for(MultipartFile file : fileList) {

			String path ="C:/uploadFiles/";
			
			String originFileName = file.getOriginalFilename();
			
			
			String nameFile = System.currentTimeMillis() + originFileName;
			
			LOGGER.debug("이건 로거" + userName);
			
			File userFolder = new File(path + userNo + userName);
			System.out.println("확인용 : " + userNo + "," + userName);
			if(!userFolder.exists()) {
				userFolder.mkdirs();
			}
			//개별 insert
			try {
				file.transferTo(new File(path + userNo + userName + "/" + nameFile));
				System.out.println("테스트 : " + path + userNo + userName + nameFile);
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			//첨부파일 모든거 집어넣기
			Tb_009 image = new Tb_009();
			image.setOriginal_file_name(originFileName);
			image.setFile_path(userFolder + "/" + nameFile);
			image.setFile_code(code[i]);
			image.setFile_type(type[i]);
			LOGGER.debug("code" + code[i]);
			image.setAplcn_dtls_proper_num(fiveNo);
			
			list.add(image);
			i++;
		}
		applicationRegistrationService.uploadFilesIns(list);
		applicationRegistrationService.UserDetailExam(fiveNo);
		
		map.put("result", "success");
		
		return map;
	}
	
	/*
	 * @RequestMapping("hidden") public Map<String, Object> hidden(HttpSession
	 * session){
	 * 
	 * session.setAttribute(, session); }
	 */
	
	

}
