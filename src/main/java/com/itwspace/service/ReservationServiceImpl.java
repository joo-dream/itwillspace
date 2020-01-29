package com.itwspace.service;

import java.util.List;

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
		log.info(">>>ReservationServiceImpl..."+userId);
		return mapper.reservedList(userId);
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

	


}
