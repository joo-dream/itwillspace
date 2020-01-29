package com.itwspace.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.ReservationVO;

public interface ReservationService {

	public void insert(ReservationVO resVO);
	
	public ReservationVO view(int reservationId);
	
	public List<ReservationVO> reservedList(@Param("userId") String userId);
	
	public void modify(ReservationVO resVO);
	
	public void delete(int reservationId);
}
