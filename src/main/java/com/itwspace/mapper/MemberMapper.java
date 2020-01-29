package com.itwspace.mapper;

import org.apache.ibatis.annotations.Param;

import com.itwspace.model.MemberVO;
import com.itwspace.model.ReservationVO;

public interface MemberMapper {
	
	public void insert(MemberVO board);
	
	public MemberVO findByUserId(String userId);
	
	public int update(MemberVO member);
	
	public int delete(String userId);
	
	public int updatePassword(@Param("userId") String userId, @Param("userPw") String userPw);
	
}
