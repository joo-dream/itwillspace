package com.itwspace.mapper;

import java.util.List;

import com.itwspace.model.SpaceAttachVO;


public interface SpaceAttachMapper {
	
	public void insert(SpaceAttachVO vo);
	
	public void delete(String uuid);
	
	public List<SpaceAttachVO> findBySpaceId(int space_id);
	
	public void deleteAll(int space_id);
	
	public List<SpaceAttachVO> getOldFiles();
}
