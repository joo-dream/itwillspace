package com.itwspace.service;

import java.util.List;

import com.itwspace.model.ReviewPageDTO;
import com.itwspace.model.ReviewVO;

public interface ReviewService {

	public int add(ReviewVO vo);

	public ReviewVO get(Long reviewId);

	public int modify(ReviewVO vo);

	public int remove(Long reviewId);

	public List<ReviewVO> getList(int space_id);
	
	public ReviewPageDTO getListPage(int pageNum, int amount, int space_id);
}
