package com.itwspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.SpaceVO;

public interface SpaceMapper {
	
	public void insert(SpaceVO board);
	
	public SpaceVO findById(String space_id);

	public void modify(SpaceVO vo);
	
	public void delete(int id);

	public SpaceVO view(int id);

	public int count();

	public List<SpaceVO> listPage(@Param("startPost") int startPost, @Param("countList") int countList);

	public void write(SpaceVO vo);

	public List<SpaceVO> list();
	
	public List<SpaceVO> myList(String userId);
	
}
