package com.itwspace.controller;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwspace.model.MemberAttachVO;
import com.itwspace.model.MemberVO;
import com.itwspace.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "사업자 회원만 등록가능합니다.");
	}
	

	@GetMapping("/login")
	public void loginInput(String error, String auth, Model model) {

		log.info("error: " + error);
		log.info("auth: " + auth);
		
		
		if (error != null) {
			model.addAttribute("msg", "아이디와 비밀번호를 확인하세요.");
		}else if (auth != null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		}
		else {
			model.addAttribute("msg", "환영합니다.");
		}
		
	}
	
	@PostMapping("/logout")
	public void logoutPost() {

		log.info("post user logout");
		return;
	}

	@GetMapping("/welcome")
	public void welcome() {
	}	
	
	@GetMapping("/register")
	public void register() {
	}	

	@PostMapping("/register")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		log.info("register" + vo);

		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getUserId());
		
		return "redirect:/member/welcome";	
	}
	
	
	@GetMapping("/modify")
	public void modify(@RequestParam("userId") String userId, Model model) throws Exception {
		MemberVO vo = service.get(userId);
		log.info("register" + vo);
		model.addAttribute("member", vo);
	}

	@PostMapping("/modify")
	public String modify(MemberVO vo, RedirectAttributes rttr) {
		log.info("modify" + vo);
		
		service.modify(vo);
		rttr.addFlashAttribute("result", "modified");
		
		if(vo.getAuth().equals("ROLE_MEMBER"))
			return "redirect:/memberInfo/myPage";
		else
			return "redirect:/memberInfo/hostPage";	
	}	

	@PostMapping("/remove")
	public String remove(@RequestParam("userId") String usdrId, RedirectAttributes rttr) {

		log.info("remove..." + usdrId);

		List<MemberAttachVO> attachList = service.getAttachList(usdrId);

		if (service.remove(usdrId)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "deleted");
		}
		return "redirect:/logout";
	}
	
	//중복된 id가 있는지 체크한다.
	@PostMapping("/duplicateId")
	@ResponseBody
	public ResponseEntity<String> duplicateId(String userId) {
		MemberVO vo = service.get(userId);
		log.info("duplicateId" + vo);
		if(vo == null){
			log.info("duplicateId - yes ");
			return new ResponseEntity<String>("yes", HttpStatus.OK);
		}

		return new ResponseEntity<String>("no",HttpStatus.OK);
	}
	
	//비밀번호 변경 화면으로 매핑
	@GetMapping("/changePw")
	public void changePassword() {
	}

	@PostMapping("/changePw")
	public String changePassword(String userId, String userNewPw, RedirectAttributes rttr) {
		log.info("changePassword: " + userId + userNewPw);
		service.changePassword(userId, userNewPw);
		MemberVO vo = service.get(userId);
		rttr.addFlashAttribute("result", "changed");
		if(vo.getAuth().equals("ROLE_MEMBER"))
			return "redirect:/memberInfo/myPage";
		else
			return "redirect:/memberInfo/hostPage";
	}
	
	//비밀번호 변경전에 현재 비밀번호를 먼저 확인한다.
	@PostMapping("/verifyPw")
	@ResponseBody
	public ResponseEntity<String> verifyPassword(String userId, String userPw) {
		MemberVO vo = service.get(userId);
		log.info("verifyPassword: " + userPw);
		
		if(service.verifyPassword(vo.getUserPw(), userPw)){
			log.info("verifyPassword match ");
			return new ResponseEntity<String>("match", HttpStatus.OK);
		}

		return new ResponseEntity<String>("nomatch",HttpStatus.OK);
	}
	
	private void deleteFiles(List<MemberAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		    
		log.info("delete attach files...................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {        
				Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());	
				Files.deleteIfExists(file);	
				if(Files.probeContentType(file).startsWith("image")) {	
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());	      
					Files.delete(thumbNail);
				}
		
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
	
	@GetMapping(value = "/getAttachList",
		    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<MemberAttachVO>> getAttachList(String userId) {

		log.info("getAttachList " + userId);
		
		return new ResponseEntity<>(service.getAttachList(userId), HttpStatus.OK);

	}	
}	
