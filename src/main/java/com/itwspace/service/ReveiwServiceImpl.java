package com.itwspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwspace.mapper.ReviewMapper;
import com.itwspace.model.ReviewPageDTO;
import com.itwspace.model.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReveiwServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper rMapper;
	
	@Override
	public int add(ReviewVO vo) {
	    log.info("addReview......" + vo);
	    return rMapper.create(vo);
	}

	@Override
	public ReviewVO get(Long reviewId) {
	    log.info("getReview......" + reviewId);
	    return rMapper.findById(reviewId);
	}

	@Override
	public int modify(ReviewVO vo) {
	    log.info("modifyReview......" + vo);
	    return rMapper.update(vo);
	}

	@Override
	public int remove(Long reviewId) {
	    log.info("removeReview...." + reviewId);
	    return rMapper.delete(reviewId);
	}

	@Override
	public List<ReviewVO> getList(int space_id) {
	    log.info("getListReview......" + space_id);
	    return rMapper.list(space_id);
	}

	@Override
	public ReviewPageDTO getListPage(int pageNum, int amount, int space_id) {
	       
	return new ReviewPageDTO(
			rMapper.getCount(space_id), 
			rMapper.getListWithPaging(pageNum, amount, space_id));
	}
}

