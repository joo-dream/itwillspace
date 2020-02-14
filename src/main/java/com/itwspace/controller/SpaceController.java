package com.itwspace.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwspace.model.SpaceAttachVO;
import com.itwspace.model.SpaceVO;
import com.itwspace.paging.Criteria;
import com.itwspace.paging.PageMaker;
import com.itwspace.service.SpaceService;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/space/*")
public class SpaceController {

	@Inject
	private SpaceService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void getList(Model model)throws Exception{
		List<SpaceVO> list = service.list();
		model.addAttribute("list", list);
	}
	
//	@RequestMapping(value="/myList", method=RequestMethod.GET)
//	public void getMyList(Model model) throws Exception {
//		List<SpaceVO> myList = service.myList(userId);
//		log.info(myList);
//		model.addAttribute("myList", myList);
//	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void getWrite(Model model)throws Exception{
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String postWrite(SpaceVO vo) throws Exception {
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.write(vo);
		return "redirect:/memberInfo/hostPage";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void getView(@RequestParam("id") int id, Model model)throws Exception{
		SpaceVO vo = service.view(id);
		log.info("getview...."+ vo);
		model.addAttribute("view", vo);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void getModify(@RequestParam("id") int id, Model model)throws Exception{
		SpaceVO vo = service.view(id);
		log.info("getview...."+ vo);
		model.addAttribute("view", vo);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String postModify(SpaceVO vo)throws Exception{
		service.modify(vo);
		
		log.info("postview...."+vo);
		return "redirect:/space/listPage";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String getDelete(@RequestParam("id") int id)throws Exception{
		service.delete(id);
		return "redirect:/space/listPage";
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void getListPage(Criteria cri, Model model)throws Exception {
		log.info("listPage…..");
        //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<SpaceVO> boards = service.listPage(cri);
        //모델에 추가
		model.addAttribute("list",boards);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	private void deleteFiles(List<SpaceAttachVO> attachList) {
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
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<SpaceAttachVO>> getAttachList(int space_id) throws Exception {

		log.info("getAttachList " + space_id);
		
		return new ResponseEntity<>(service.getAttachList(space_id), HttpStatus.OK);
	}	
		
}	
