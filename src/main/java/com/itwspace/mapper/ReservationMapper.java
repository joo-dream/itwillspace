package com.itwspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwspace.model.ReservationVO;

public interface ReservationMapper {

	public void insert(ReservationVO resVO);
	
	public ReservationVO view(int reservationId);
	
	public List<ReservationVO> reservedList(@Param("userId") String userId);
	
	public List<ReservationVO> reservedListBySpace (@Param("space_id") int space_id);
	
	public void update(ReservationVO resVO);
	
	public void delete(int reservationId);
	
	//게시물의 총 건수
	public int count(@Param("userId") String userId) throws Exception;
			
	//게시물 목록 (페이징)
	public List<ReservationVO> listPage(@Param("userId") String userId, @Param("displayPost") int displayPost, @Param("postNum") int postNum) throws Exception;

	public List<ReservationVO> listBySpaceid(@Param("space_id") int space_id);
}
