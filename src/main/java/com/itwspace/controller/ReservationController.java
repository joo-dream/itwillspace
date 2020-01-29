package com.itwspace.controller;

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
import com.itwspace.service.ReservationService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reservation/*")
public class ReservationController {

	@Autowired
	ReservationService service;		
	
	@GetMapping("/booking")
	public void getInsertBooking() {
		log.info("GET>>>>> reservation/book/" );			
	}
	
	@PostMapping("/booking")
	public String postInsertBooking(ReservationVO resVO, Model model) throws Exception {			
		
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		//Date res_date = df.parse(resVO.getRes_date());		
		
		service.view(resVO.getReservationId());		
		model.addAttribute("view", resVO);
		service.insert(resVO);
		log.info(">>>>> reservation/bookinConfirm/" + resVO);
		return "reservation/bookingConfirm";		
	}
	
	@PostMapping("/bookingConfirm")
	public String postConfirmView() {			
	
		return "memberInfo/myPage";
	}		
			
	
	@GetMapping("/modify")
	public void getModify(@RequestParam("reservationId") int reservationId, Model model) {
		log.info("getmodify....." + reservationId);
		ReservationVO vo = service.view(reservationId);			
		log.info("getmodify....." + vo);
		model.addAttribute("view", vo);		
	}	
	@PostMapping("/modify")
	public String postModify(ReservationVO vo, RedirectAttributes rttr) {
		
		log.info("postmodify..." + vo);		
		service.modify(vo);
		
	//	rttr.addFlashAttribute("result", "modified");		
		return "redirect:/memberInfo/myPage";	
	}	
	
	@GetMapping("/delete")
	public void getDelete(@RequestParam("reservationId") int reservationId, Model model) {
		log.info("getdelete....." + reservationId);
		service.delete(reservationId);	
	}	
	
//	@PostMapping("/delete")
//	public String Postdelete(int reservationId, RedirectAttributes rttr) {
//		log.info("delete..." + reservationId);
//		service.delete(reservationId);		
//		return "redirect:/memberInfo/myPage";	
//	}
	
}
