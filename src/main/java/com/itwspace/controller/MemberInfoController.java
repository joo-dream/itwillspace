package com.itwspace.controller;


import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.itwspace.model.MemberVO;
import com.itwspace.model.ReservationVO;
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
	public void myPage(Principal user, Model model, @RequestParam("num") int num) throws Exception {
		String userId = user.getName();
		log.info("view " + userId);
		model.addAttribute("member", mService.get(userId));
		model.addAttribute("reservedList", rService.reservedList(userId));
		log.info("myPageController>>> "+rService.reservedList(userId));
		//게시물 총 건수
		int count = rService.count(userId);
		
		//한 페이지당 보여줄 게시물 건수
		int postNum = 9;				
		//하단 페이징 번호( [게시물 총 건수÷한 페이지에 보여줄 건수]의 올림)
		int pageNum = (int)Math.ceil((double)count/postNum);
				
		//출력할 게시물(displayPost)		
		int displayPost = (num -1) * postNum;						
		
		//한 번에 표시할 페이징 번호의 개수
		int pageNum_cnt = 5;
		
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);				
		
		//표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt-1);
				
		//마지막 번호를 재계산한다.
		int endPageNum_tmp = (int)(Math.ceil((double)count /(double)pageNum_cnt));
		//현재화면의 마지막 페이지가 모든 데이터의 마지막 페이지인지?
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
				
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
				
		List<ReservationVO> reservedList = rService.listPage(userId, displayPost, postNum);
		//log.info("size: "+reservedList.size());
		model.addAttribute("reservedList", reservedList);
		model.addAttribute("pageNum", 	pageNum);
				
		//시작 및 끝 번호
		model.addAttribute("startPageNum", 	startPageNum);
		model.addAttribute("endPageNum", 	endPageNum);				
		
		//이전 및 다음
		model.addAttribute("prev", 	prev);
		model.addAttribute("next", 	next);
				
		//현재 페이지
		model.addAttribute("select", num);
		
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
	
	@GetMapping("/resListPage")
	public void resListPage(@RequestParam("id") int space_id, Model model) {
		model.addAttribute("listBySpaceid", rService.listBySpaceid(space_id));
		log.info("resListPageController>>>>>> " );
	}
}	
