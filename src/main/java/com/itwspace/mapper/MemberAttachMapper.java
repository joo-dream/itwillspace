package com.itwspace.mapper;

import java.util.List;

import com.itwspace.model.MemberAttachVO;


public interface MemberAttachMapper {
	
	public void insert(MemberAttachVO vo);
	
	public void delete(String uuid);
	
	public List<MemberAttachVO> findByUserId(String userId);
	
	public void deleteAll(String userId);
	
	public List<MemberAttachVO> getOldFiles();
}
