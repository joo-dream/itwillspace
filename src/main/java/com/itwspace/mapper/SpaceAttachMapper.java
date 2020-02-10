package com.itwspace.mapper;

import java.util.List;

import com.itwspace.model.SpaceAttachVO;


public interface SpaceAttachMapper {
	
	public void insert(SpaceAttachVO vo);
	
	public void delete(String uuid);
	
	public List<SpaceAttachVO> findBySpaceId(int space_id);
	
	public SpaceAttachVO findOneBySpaceId(int space_id); //yeounjoo space vo에 이미지 정보 추가	
	
	public void deleteAll(int space_id);
	
	public List<SpaceAttachVO> getOldFiles();
}
