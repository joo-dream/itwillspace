package com.itwspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.SpaceAttachVO;
import com.itwspace.model.SpaceVO;
import com.itwspace.paging.Criteria;

public interface SpaceMapper {
	
	public void insert(SpaceVO board);
	
	public SpaceVO findById(String space_id);

	public void modify(SpaceVO vo);
	
	public void delete(int id);

	public SpaceVO view(int id);

	public int getTotalCount(Criteria cri);
	
	public int getMyTotalCount(@Param("cri") Criteria cri, @Param("userId") String userId);

	public List<SpaceVO> listPage(Criteria cri);

	public void write(SpaceVO vo);

	public List<SpaceVO> list();
	
//	public List<SpaceVO> myList(String userId); //20.01.22 경로문제로 인한 문제해결
	
	public List<SpaceVO> myList(@Param("cri") Criteria cri, @Param("userId") String userId);

	public void deleteAll(String space_id);

	public int delete(String space_id);

	public List<SpaceAttachVO> findBySpace_id(String space_id);
	
	public List<SpaceVO> hostPage(@Param("startPost") int startPost, @Param("countList")int countList);
	
}

