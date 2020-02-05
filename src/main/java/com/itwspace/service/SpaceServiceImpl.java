package com.itwspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.itwspace.mapper.SpaceMapper;
import com.itwspace.model.SpaceVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SpaceServiceImpl implements SpaceService {

	@Autowired
	SpaceMapper mapper;

	@Override
	public void register(SpaceVO board) {
		log.info("register......" + board);
		mapper.insert(board);
	}

	@Override
	public SpaceVO get(String space_id) {
		log.info("get......" + space_id);
		return mapper.findById(space_id);
	}

	@Override
	public List<SpaceVO> list() {
		log.info("list.....");
		return mapper.list();
	}
	
	@Override
	public List<SpaceVO> myList(String userId) {
		log.info("myList.....");
		return mapper.myList(userId);
	}
	
	@Override
	public void write(SpaceVO vo) throws Exception {
		log.info("write....." + vo);
		mapper.write(vo);
	}

	@Override
	public SpaceVO view(int id) throws Exception {
		log.info("view....." + id);
		return mapper.view(id);
	}

	@Override
	public void modify(SpaceVO vo) throws Exception {
		log.info("modify....." + vo);
		mapper.modify(vo);
	}

	@Override
	public void delete(int id) throws Exception {
		log.info("delete....." + id);
		mapper.delete(id);
	}

	@Override
	public int count() throws Exception{
		log.info("count.....");
		return mapper.count();
	}

	@Override
	public List<SpaceVO> listPage(int startPost, int countList) throws Exception {
		return mapper.listPage(startPost, countList);
	}


}
