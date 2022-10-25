package com.br.law.controller.user;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

import com.br.law.service.user.TrialUserService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;

@RestController
@RequestMapping("/user/*")
public class TrialUserRestController {

	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(TrialUserController.class);
	
	@Autowired
	private TrialUserService trialMainService;
	
	@RequestMapping("chkPassword")
	public Map<String, Object> chkPassword(String user_pw, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("입력한 user_pw : " + user_pw);
		
		Tb_001 sessionUser = (Tb_001)session.getAttribute("user");
		if(sessionUser.getUser_pw().equals(user_pw)) {
			session.setAttribute("identityVerificate", true);
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@RequestMapping("modifyMyInfo")
	public Map<String, Object> modifyMyInfo(Tb_001 user, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			trialMainService.modifyMyInfo(user);
			LOGGER.info("trialMainService modifyMyInfo Success! Tb_001(user) : " + user.toString());
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping("modifyPasswordProcess")
	public Map<String, Object> modifyPassword(int user_proper_num, String new_pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			trialMainService.modifyPassword(user_proper_num, new_pw);
			LOGGER.info("trialMainService modifyPassword Success! user_proper_num : " + user_proper_num + ", new_pw : " + new_pw);
			map.put("result", "success");
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyPassword ERROR! Tb_001(user) : " + user_proper_num);
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("withdrawalProcess")
	public Map<String, Object> withdrawalProcess(HttpSession session, int user_proper_num, String user_pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			boolean result = trialMainService.withdrawal(user_proper_num, user_pw);
			
			if(result) {
				map.put("result", "success");
				session.invalidate(); // 세션 초기화
				
				LOGGER.info("trialMainService withdrawalProcess Success! user_proper_num : " + user_proper_num + ", user_pw : " + user_pw);
			} else {
				map.put("result", "fail");
				LOGGER.info("trialMainService withdrawalProcess Fail! user_proper_num : " + user_proper_num + ", user_pw : " + user_pw);
			}
			
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyPassword ERROR! Tb_001(user) : " + user_proper_num);
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	@RequestMapping("modifyUserDetail")
	public Map<String, Object> modifyUserDetail(Tb_001 user) {
		//System.out.println("modifyUserDetail ~~~~~~~~~~~~~~~~~~~~~~~~ : " + user);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			if(trialMainService.modifyMyInfo(user) > 0) {
				map.put("result", "success");
				map.put("msg", "저장되었습니다");
			} else {
				
				map.put("result", "fail");
				map.put("msg", "저장에 실패하였습니다.");
			}
			
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyUserDetail ERROR! user_proper_num : " + user.getUser_proper_num());
			e.printStackTrace();
		}
		
		return map;
	}
	
	@RequestMapping("modifyTableFive")
	public Map<String, Object> modifyTableFive(Tb_005 param) {
		Map<String, Object> map = new HashMap<String, Object>();
		//System.out.println("modifyTableFive param : " + param);
		try {
			
			if(trialMainService.modifyTableFive(param) > 0) {
				map.put("result", "success");
				map.put("msg", "저장되었습니다");
			} else {
				
				map.put("result", "fail");
				map.put("msg", "저장에 실패하였습니다.");
			}
			
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyTableFive ERROR! aplcn_dtls_proper_num : " + param.getAplcn_dtls_proper_num());
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	@RequestMapping("modifyTableSix")
	public Map<String, Object> modifyTableSix(Tb_006 param) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			if(trialMainService.modifyTableSix(param) > 0) {
				map.put("result", "success");
				map.put("msg", "저장되었습니다");
				LOGGER.info("trialMainServie modifyTableSix Success! Tb_006 : " + param.toString());
			} else {
				map.put("result", "fail");
				map.put("msg", "저장에 실패하였습니다.");
			}
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyTableSix ERROR! aplcn_dtls_proper_num : " + param.getAplcn_dtls_proper_num());
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("modifyTableSeven")
	public Map<String, Object> modifyTableSeven(Tb_007 param) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			if(trialMainService.modifyTableSeven(param) > 0) {
				map.put("result", "success");
				map.put("msg", "저장되었습니다");
				LOGGER.info("trialMainServie modifyTableSeven Success! Tb_007 : " + param.toString());
			} else {
				map.put("result", "fail");
				map.put("msg", "저장에 실패하였습니다.");
			}
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyTableSeven ERROR! aplcn_dtls_proper_num : " + param.getAplcn_dtls_proper_num());
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("modifyTableEight")
	public Map<String, Object> modifyTableEight(Tb_008 param) {
		Map<String, Object> map = new HashMap<String, Object>();
		LOGGER.debug("modifyTableEight Tb_008 : " + param);
		
		try {
			if(trialMainService.modifyTableEight(param) > 0) {
				map.put("result", "success");
				map.put("msg", "저장되었습니다");
				LOGGER.info("trialMainServie modifyTableEight Success! Tb_008 : " + param.toString());
			} else {
				map.put("result", "fail");
				map.put("msg", "저장에 실패하였습니다.");
			}
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyTableEight ERROR! aplcn_dtls_proper_num : " + param.getAplcn_dtls_proper_num());
			e.printStackTrace();
		}
		return map;
	}
	
	
	@RequestMapping("modifyTableNine")
	public Map<String, Object> modifyTableNine(@RequestParam HashMap<Object, Object> param, MultipartHttpServletRequest request, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Tb_001 sessionUser = (Tb_001)session.getAttribute("user");
		int aplcn_dtls_proper_num =  Integer.parseInt(request.getParameter("aplcn_dtls_proper_num"));
		
		try {
			int userNo = sessionUser.getUser_proper_num();
			String userName = sessionUser.getUser_name();
			
			List<MultipartFile> fileList = new ArrayList<MultipartFile>();
			
			String[] codes = ((String)param.get("codes")).split(",");
			String[] types = ((String)param.get("types")).split(",");
			
			Iterator<String> iter = request.getFileNames(); 
			MultipartFile mfile = null; 
		    String fieldName = "";
		    String path = "C:/uploadFiles/";
		    
		    int i=0;
		    while (iter.hasNext()) { 
		        fieldName = (String) iter.next(); 	 //파일이름, 위에서 file1과 file2로 보냈으니 file1, file2로 나온다.
		        mfile = request.getFile(fieldName);  //저장된 파일 객체
		        
		        // 추가
		        String originFileName = mfile.getOriginalFilename();
		        String nameFile = System.currentTimeMillis() + originFileName;
		        File userFolder = new File(path + userNo + userName);
		        
		        if(!userFolder.exists()) {
		        	userFolder.mkdirs();
		        }
		        
		        // 개별 update or insert
		        mfile.transferTo(new File(path + userNo + userName + "/" + nameFile));
		        Tb_009 atch = new Tb_009();
		        atch.setOriginal_file_name(originFileName);
		        atch.setFile_path(userFolder + "/" + nameFile);
		        atch.setFile_type(types[i]);
		        atch.setFile_code(codes[i]);
		        atch.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
		        
		        //fileList.add(mfile);
		        
		        
		        // 파일 업데이트 or 인서트
				if(trialMainService.modifyTableNine(atch)) {
					map.put("result", "success");
					map.put("msg", "저장되었습니다");
					LOGGER.info("trialMainService modifyTableNine SUCCESS! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num + ", file_type : " + types[i]);
				} else {
					map.put("result", "fail");
					map.put("msg", "알수없는 오류로 저장에 실패하였습니다.");
					LOGGER.info("trialMainService modifyTableNine FAIL! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num + ", file_code : " + codes[i]);
				}
		        i++;
		    }		
					
			
			
			/*
			String path = "uploadFiles/";
			int i=0; 
			for(MultipartFile file : fileList) {
				String originFileName = file.getOriginalFilename();
				String nameFile = System.currentTimeMillis() + originFileName;
				File userFolder = new File(path + userNo + userName);
				if(!userFolder.exists()) {
					userFolder.mkdirs();
				}
				
				// 개별 update
				file.transferTo(new File(path + userNo + userName + "/" + nameFile));
				Tb_009 atch = new Tb_009();
				atch.setOriginal_file_name(originFileName);
				atch.setFile_path(path);
				atch.setFile_type(types[i]);
				atch.setFile_code(codes[i]);
				atch.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
				
				// 파일 업데이트 or 인서트
				if(trialMainService.modifyTableNine(atch)) {
					map.put("result", "success");
					map.put("msg", "저장되었습니다");
					LOGGER.info("trialMainService modifyTableNine SUCCESS! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num + ", file_type : " + types[i]);
				} else {
					map.put("result", "fail");
					map.put("msg", "알수없는 오류로 저장에 실패하였습니다.");
					LOGGER.info("trialMainService modifyTableNine FAIL! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num + ", file_code : " + codes[i]);
				}
				i++;
			}
			*/
			    
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "error");
			map.put("msg", "저장에 실패하였습니다");
		}
		
		return map;
	}
	
	
	
	/*
	@RequestMapping("modifyTableNine")
//	public Map<String, Object> modifyTableNine(MultipartHttpServletRequest request, HttpSession session) {
	public Map<String, Object> modifyTableNine(@RequestParam HashMap<Object, Object> param, MultipartHttpServletRequest request, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Tb_001 sessionUser = (Tb_001)session.getAttribute("user");
		int aplcn_dtls_proper_num =  Integer.parseInt(request.getParameter("aplcn_dtls_proper_num"));
		
		try {
			
			
			Iterator<String> iter = request.getFileNames();
			MultipartFile mfile = null;
			String fileName = "";
			while(iter.hasNext()) {
				fileName = (String) iter.next();	// 파일이름
				mfile = request.getFile(fileName);
			}
			
			
			List<MultipartFile> fileList = request.getFiles("files");
			List<Tb_009> list = new ArrayList<Tb_009>();
			
			String[] codes = request.getParameterValues("codes");
					
			String[] types = request.getParameterValues("types");
			
			System.out.println("codes : " + Arrays.toString(codes));
			System.out.println("types : " + Arrays.toString(types));
			
			int i=0;
			for(MultipartFile file : fileList) {
				String path = "uploadFiles/";
				String originFileName = file.getOriginalFilename();
				String nameFile = System.currentTimeMillis() + originFileName;
				File userFolder = new File(path + userNo + userName);
				if(!userFolder.exists()) {
					userFolder.mkdirs();
				}
				
				// 개별 insert
				file.transferTo(new File(path + userNo + userName + "/" + nameFile));
				Tb_009 atch = new Tb_009();
				atch.setOriginal_file_name(originFileName);
				atch.setFile_path(path);
				atch.setFile_code(codes[i]);
				atch.setFile_type(types[i]);
				atch.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
				
				list.add(atch);
				i++;
			}
			
			trialMainService.modifyTableNine(list);
			map.put("result", "success");
			map.put("msg", "저장되었습니다");
			LOGGER.info("trialMainService modifyTableNine SUCCESS! list : " + list);
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			LOGGER.error("trialMainService modifyTableNine ERROR! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num);
			e.printStackTrace();
		}
		return map;
	}
	*/
	
	
	@RequestMapping("updateAplcnStsToExamination")
	public Map<String, Object> updateAplcnStsToExamination(HttpSession session, String aplcn_dtls_proper_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int result = trialMainService.updateApplicationStatus(Integer.parseInt(aplcn_dtls_proper_num), "examination");
			
			if(result > 0) {
				
				LOGGER.info("trialMainService updateAplcnStsToExamination SUCCESS! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num);
				map.put("result", "success");
				map.put("msg", "수정완료 되었습니다.");
			} else {
				
				LOGGER.error("trialMainService updateAplcnStsToExamination ERROR! aplcn_dtls_proper_num : " + aplcn_dtls_proper_num);
				map.put("result", "fail");
				map.put("msg", "수정실패하였습니다.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "error");
			map.put("msg", e.getMessage());
		}
		
		return map;
	}
	
	@RequestMapping("updateAcceptActYn")
	public Map<String, Object> activePause(HttpSession session, String accept_proper_num, String accept_act_yn) {
		Map<String, Object> map = new HashMap<String, Object>();
		Tb_001 sessionUser = (Tb_001)session.getAttribute("user");
		
		System.out.println("accept_act_yn : " + accept_act_yn);
		System.out.println("accept_proper_num : " + accept_proper_num);
		
		int properNum = Integer.parseInt(accept_proper_num);
		
		try {
			// 활동중지/철회 신청
			int result = trialMainService.updateAcceptActYn(properNum, accept_act_yn);
			System.out.println("result : " + result);
			
			if(result > 0) {
				map.put("result", "success");
				
				if(accept_act_yn.equals("n")) {
					map.put("msg", "중지 신청이 완료되었습니다.");
				} else if(accept_act_yn.equals("y")) {
					map.put("msg", "중지철회 신청이 완료되었습니다.");
					
				}
				
				LOGGER.info("trialMainService updateAcceptActYn SUCCESS! accept_proper_num : " + properNum);
			}
			
		} catch (Exception e) {
			map.put("result", "error");
			map.put("msg", e.getMessage());
			e.printStackTrace();
			LOGGER.error("trialMainService updateAcceptActYn ERROR! accept_proper_num : " + properNum);
		}
		return map;
	}
	
}
