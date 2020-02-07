package com.itwspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwspace.mapper.MemberAttachMapper;
import com.itwspace.mapper.SpaceAttachMapper;
import com.itwspace.mapper.SpaceMapper;

import com.itwspace.model.SpaceAttachVO;
import com.itwspace.model.SpaceVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SpaceServiceImpl implements SpaceService {

	@Autowired
	SpaceMapper mapper;
	@Autowired
	SpaceAttachMapper attachMapper;

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
	
	@Transactional
	@Override
	public void write(SpaceVO vo) throws Exception {
		log.info("write....." + vo);
		mapper.write(vo);
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}		
		vo.getAttachList().forEach(attach -> {
			attach.setSpace_id(vo.getSpace_id());
			attachMapper.insert(attach);
		});			
	}

	@Override
	public SpaceVO view(int id) throws Exception {
		log.info("view....." + id);
		return mapper.view(id);
	}
	
	@Transactional
	@Override
	public void modify(SpaceVO vo) throws Exception {
		log.info("modify....." + vo);
		attachMapper.deleteAll(vo.getSpace_id());
		mapper.modify(vo);
		
		if(vo.getAttachList()!=null && vo.getAttachList().size()>0) {
			vo.getAttachList().forEach(attach->{
				attach.setSpace_id(vo.getSpace_id());
				attachMapper.insert(attach);
			});
		}		
	}
	
	@Transactional
	@Override
	public void delete(int id) throws Exception {
		log.info("delete....." + id);
		attachMapper.deleteAll(id);
		mapper.delete(id);
	}

	@Override
	public int count() throws Exception{
		log.info("count....." );
		return mapper.count();
	}

	@Override
	public List<SpaceVO> listPage(int startPost, int countList) throws Exception {
		return mapper.listPage(startPost, countList);
	}
	
	//1.29 add getAttachList(String space_id)
	@Override
	public List<SpaceAttachVO> getAttachList(int space_id) {
		log.info("get Attach list by space_id" + space_id);

		return attachMapper.findBySpaceId(space_id);
	}

	@Transactional
	@Override
	public boolean remove(String space_id) {
		log.info("remove...." + space_id);

		mapper.deleteAll(space_id);
		return mapper.delete(space_id) == 1;
	}

	@Override
	public List<SpaceVO> hostPage(int startPost, int countList) throws Exception {
		return mapper.hostPage(startPost, countList);
	}
}
