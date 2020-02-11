package com.itwspace.service;

import java.util.List;

import com.itwspace.model.SpaceAttachVO;
import com.itwspace.model.SpaceVO;
import com.itwspace.paging.Criteria;

public interface SpaceService {

	public void register(SpaceVO board) throws Exception;

	public SpaceVO get(String space_id) throws Exception;

	public List<SpaceVO> list() throws Exception; 
	
	List<SpaceVO> myList(Criteria cri, String userId) throws Exception;

	public void modify(SpaceVO vo) throws Exception;

	public void delete(int id) throws Exception;

	public int getTotalCount(Criteria cri) throws Exception;
	
	public int getMyTotalCount(Criteria cri, String userId) throws Exception;

	public List<SpaceVO> listPage(Criteria cri) throws Exception;

	public void write(SpaceVO vo) throws Exception;

	public SpaceVO view(int id) throws Exception;
	
	public List<SpaceAttachVO> getAttachList(int space_id) throws Exception;

	boolean remove(String space_id) throws Exception;
	
	public List<SpaceVO> hostPage(int startPost, int countList) throws Exception;

}
