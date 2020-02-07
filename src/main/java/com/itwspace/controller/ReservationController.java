package com.itwspace.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwspace.model.MemberAttachVO;
import com.itwspace.model.MemberVO;
import com.itwspace.model.ReservationVO;
import com.itwspace.model.SpaceVO;
import com.itwspace.service.ReservationService;
import com.itwspace.service.SpaceService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reservation/*")
public class ReservationController {

	@Autowired
	ReservationService service;	
	@Autowired
	private SpaceService  sService;

	
	@GetMapping("/booking")
	public void getInsertBooking(@RequestParam("space_id") int space_id, ReservationVO resVO,Model model) throws Exception {

		log.info("GET>>>>> reservation/book/" + space_id);
		
		SpaceVO vo = sService.view(space_id);
		model.addAttribute("spaceVO", vo);
		log.info(">>>>> space_id�� ����/����ó�� �ʿ���!!" + sService.view(space_id));
		
		model.addAttribute("reservedListBySpace", service.reservedListBySpace(space_id));
		log.info(">>>>> ������ ���� �̾ƿԴ�?" + service.reservedListBySpace(space_id));
		
		
	}
	
	
	@PostMapping("/booking")
	public String postInsertBooking(@RequestParam("space_id") int space_id, ReservationVO resVO, Model model) throws Exception {			
		log.info(">>>>>> booking Post ��Ʈ�ѷ� �Լ�!!!!");
		
		
		SpaceVO vo = sService.view(space_id);
		model.addAttribute("spaceVO", vo);
		log.info(">>>>> space_id�� ����/����ó�� �ʿ���!!" + sService.view(space_id));
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date res_date = df.parse(resVO.getRes_date());		
		log.info(">>>>>> Date Ÿ������  ��ȯ �Ϸ�!");
		
		service.view(resVO.getReservationId());		
		log.info(">>>>>> booking Post ��Ʈ�ѷ� _ service.view(�����ȣ) ����Ϸ�");
		
		model.addAttribute("view", resVO);
		log.info(">>>>>> booking Post ��Ʈ�ѷ� _ ������������ ������ ���� ��� �Ϸ�");
		
		service.insert(resVO);
		log.info(">>>>> reservation/bookinConfirm/" + resVO);
		
		return "reservation/bookingConfirm";		
	}
	
//	@PostMapping("/bookingConfirm")
//	public String postConfirmView() {			
//		log.info("bookingConfirm PostMapping");
//		return "memberInfo/myPage";
//	}		
			
	
	@GetMapping("/modify")
	public void getModify(@RequestParam("reservationId") int reservationId, Model model) {
		log.info("getmodify....." + reservationId);
		ReservationVO vo = service.view(reservationId);			
		log.info("getmodify....." + vo);
		model.addAttribute("view", vo);			
	}	
	
	@PostMapping("/modify")
	public String postModify(@RequestParam("space_id") int space_id, Model model, ReservationVO resVO, RedirectAttributes rttr) throws Exception {		
		SpaceVO spacevo = sService.view(space_id);
		model.addAttribute("spaceVO", spacevo);
		log.info("postmodify..."+spacevo);				
		service.modify(resVO);
		log.info("postmodify..." + resVO);		
		return "redirect:/memberInfo/myPage?num=1";	
	}	
	
	@GetMapping("/delete")
	public String getDelete(@RequestParam("reservationId") int reservationId, Model model) {
		log.info("getdelete....." + reservationId);
		
		ReservationVO vo = service.view(reservationId);	
		model.addAttribute("view", vo);	
		
		service.delete(reservationId);	
		log.info("!!!!!getdelete..... 실행완료!!!!!!");
		return "/reservation/delete";	
	}	
	  
	
	/*
	@PostMapping("/delete")
	public String Postdelete(@RequestParam("reservationId") int reservationId, RedirectAttributes rttr) {
		log.info("Postdelete..." + reservationId);
		service.delete(reservationId);		
		return "redirect:/memberInfo/myPage?num=1";	
	}
	*/
}
