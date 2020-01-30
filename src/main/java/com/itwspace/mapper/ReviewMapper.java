package com.itwspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.ReviewVO;

public interface ReviewMapper {
	
	public int create(ReviewVO vo);

	public ReviewVO findById(Long reviewId);

	public int delete(Long reviewId);

	public int update(ReviewVO review);

	public List<ReviewVO> list(int space_id); 
	
	public List<ReviewVO> getListWithPaging(@Param("pageNum") int pageNum, 
			@Param("amount") int amount, @Param("space_id") int space_id);
	
	public int getCount(@Param("space_id") int space_id);
}
