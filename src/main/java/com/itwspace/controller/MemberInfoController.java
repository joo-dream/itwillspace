package com.itwspace.controller;


import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itwspace.model.MemberVO;
import com.itwspace.model.SpaceVO;
import com.itwspace.model.MemberAttachVO;
import com.itwspace.service.MemberService;
import com.itwspace.service.ReservationService;
import com.itwspace.service.SpaceService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/memberInfo/*")
public class MemberInfoController {

	@Autowired
	MemberService mService;
	
	@Autowired
	ReservationService rService;
	
	@Inject
	private SpaceService service;
	
	@GetMapping("/myPage")
	public void myPage(Principal user, Model model) {
		String userId = user.getName();
		log.info("view " + userId);
		model.addAttribute("member", mService.get(userId));
		model.addAttribute("reservedList", rService.reservedList(userId));
	}	
	
	@GetMapping("/hostPage")
	public void hostPage(Principal user, Model model) {
		String userId = user.getName();
		List<SpaceVO> myList = service.myList(userId);
		log.info("view " + userId);
		log.info(myList);
		model.addAttribute("member", mService.get(userId));
		model.addAttribute("myList", myList);
	}	
		
}	
