package com.itwspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwspace.model.ReservationVO;

public interface ReservationMapper {

	public void insert(ReservationVO resVO);
	
	public ReservationVO view(int reservationId);
	
	public List<ReservationVO> reservedList(@Param("userId") String userId);
	
	public void update(ReservationVO resVO);
	
	public void delete(int reservationId);
}
