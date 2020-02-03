package com.itwspace.service;

import java.util.List;

import com.itwspace.model.SpaceVO;

public interface SpaceService {

	public void register(SpaceVO board);

	public SpaceVO get(String space_id);

	public List<SpaceVO> list();
	
	public List<SpaceVO> myList(String userId);

	public void modify(SpaceVO vo) throws Exception;

	public void delete(int id) throws Exception;

	public int count() throws Exception;

	public List<SpaceVO> listPage(int startPost, int countList) throws Exception;

	public void write(SpaceVO vo) throws Exception;

	public SpaceVO view(int id) throws Exception;
	
	public List<SpaceAttachVO> getAttachList(String space_id) throws Exception;

	boolean remove(String space_id) throws Exception;
	
	public List<SpaceVO> hostPage(int startPost, int countList) throws Exception;

}
