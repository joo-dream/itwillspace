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
		return "redirect:/space/list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String getDelete(@RequestParam("id") int id)throws Exception{
		service.delete(id);
		return "redirect:/space/list";
	}
	
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("page") int page)throws Exception{
		int totalPost = service.count();
		int countList=10;
		int totalPage=(int)Math.ceil((double)totalPost/countList);
		int startPost = (page - 1) * countList;
		int countPage = 10;
		int endPage = (int)(Math.ceil((double)page/(double)countPage)*countPage);
		int startPage = endPage -(countPage - 1);
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		boolean prev = startPage == 1? false : true;
		boolean next = endPage >= totalPage ? false : true;
		
		List<SpaceVO> list = service.listPage(startPost, countList);
		model.addAttribute("list", list);
		model.addAttribute("countList", countList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("curPage", page);
		
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
