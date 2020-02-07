package com.itwspace.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.ReservationVO;

public interface ReservationService {

	public void insert(ReservationVO resVO);
	
	public ReservationVO view(int reservationId);
	
	public List<ReservationVO> reservedList(@Param("userId") String userId);	
	
	public List<ReservationVO> reservedListBySpace (@Param("space_id") int space_id);
	
	public void modify(ReservationVO resVO);
	
	public void delete(int reservationId);
	
	//게시물의 총 건수
	public int count(@Param("userId") String userId) throws Exception;
			
	//게시물 목록 (페이징)
	public List<ReservationVO> listPage(@Param("userId") String userId, int displayPost, int postNum) throws Exception;

	public List<ReservationVO> listBySpaceid(@Param("space_id") int space_id);
}
