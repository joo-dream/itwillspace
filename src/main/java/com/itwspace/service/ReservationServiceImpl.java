package com.itwspace.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwspace.mapper.ReservationMapper;
import com.itwspace.model.ReservationVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationMapper mapper;
	
	@Override
	public void insert(ReservationVO resVO) {		
		
		mapper.insert(resVO);
		log.info(">>>booking......" + resVO);
	}

	@Override
	public ReservationVO view(int reservationId) {
		
		return mapper.view(reservationId);
	}

	@Override
	public List<ReservationVO> reservedList(String userId) {		
		log.info(">>>ReservationServiceImpl..."+mapper.reservedList(userId));
		return mapper.reservedList(userId);
	}
	
	@Override
	public List<ReservationVO> reservedListBySpace (@Param("space_id")int space_id){
		
		return mapper.reservedListBySpace(space_id);
	}

	@Override
	public void modify(ReservationVO resVO) {		
		mapper.update(resVO);
		log.info(">>>ReservationServiceImpl..."+resVO);
	}

	@Override
	public void delete(int reservationId) {
		mapper.delete(reservationId);
		
	}

	@Override
	public int count(@Param("userId") String userId) throws Exception {
		log.info("reservationServiceImpl>>"+ mapper.count(userId));
		return mapper.count(userId);
	}

	@Override
	public List<ReservationVO> listPage(@Param("userId") String userId, int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listPage(userId, displayPost, postNum);
	}

	@Override
	public List<ReservationVO> listBySpaceid(int space_id) {
		
		return mapper.listBySpaceid(space_id);
	}	


}
