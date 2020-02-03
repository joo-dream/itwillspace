package com.itwspace.mapper;

import java.util.List;

import com.itwspace.model.SpaceAttachVO;


public interface SpaceAttachMapper {
	
	public void insert(SpaceAttachVO vo);
	
	public void delete(String uuid);
	
	public List<SpaceAttachVO> findByUserId(String userId);
	
	public void deleteAll(String space_id);
	
	public List<SpaceAttachVO> getOldFiles();
}
