package com.itwspace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwspace.model.ReviewPageDTO;
import com.itwspace.model.ReviewVO;
import com.itwspace.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/review/")
@RestController
@Log4j
@AllArgsConstructor
public class ReviewController {
	@Autowired
	private ReviewService service;

	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewVO vo) {

		log.info("ReviewVO: " + vo);

		int insertCount = service.add(vo);

		log.info("Review INSERT COUNT: " + insertCount);

		return insertCount == 1  
				?  new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/{reviewId}", 
			produces = { MediaType.APPLICATION_XML_VALUE, 
					     MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewVO> get(@PathVariable("reviewId") Long reviewId) {

		log.info("get: " + reviewId);

		return new ResponseEntity<>(service.get(reviewId), HttpStatus.OK);
	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reviewId}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			 @RequestBody ReviewVO vo, 
			 @PathVariable("reviewId") Long reviewId) {

		vo.setReviewId(reviewId);

		log.info("reviewId: " + reviewId);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@DeleteMapping(value = "/{reviewId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("reviewId") Long reviewId) {

		log.info("remove: " + reviewId);

		return service.remove(reviewId) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

//	 @GetMapping(value = "/pages/{space_id}/{page}", 
//			 produces = {
//					 MediaType.APPLICATION_XML_VALUE,
//					 MediaType.APPLICATION_JSON_UTF8_VALUE })
//	 public ResponseEntity<List<ReviewVO>> getList(
//			 @PathVariable("page") int page,
//			 @PathVariable("space_id") int space_id) {
//	
//		 
//		// log.info("getList.................");
//		// Criteria cri = new Criteria(page,10);
//		// log.info(cri);
//	
//	 return new ResponseEntity<>(service.getList(space_id), HttpStatus.OK);
//	 }

	@GetMapping(value = "/pages/{space_id}/{page}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getList(@PathVariable("page") Integer page, @PathVariable("space_id") Integer space_id) {
		
		log.info("getList : " + space_id);
		log.info("getList : " + page);
		int amount = 10; //한번에 보여지는 댓글수
		int pageNum = (page -1) * amount;
		log.info(service.getListPage(page, amount, space_id));
		return new ResponseEntity<>(service.getListPage(pageNum, amount, space_id), HttpStatus.OK);
	}

}

