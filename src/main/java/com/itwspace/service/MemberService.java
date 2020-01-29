package com.itwspace.service;


import com.itwspace.model.MemberVO;

import java.util.List;

import com.itwspace.model.MemberAttachVO;

public interface MemberService {

	public void register(MemberVO member);

	public MemberVO get(String userId);
	
	public boolean modify(MemberVO member);
	
	public boolean remove(String userId);
	
	public boolean changePassword(String userId, String userNewPw);
	
	public boolean verifyPassword(String encodedPw, String userPw);	

	public List<MemberAttachVO> getAttachList(String userId);
}
