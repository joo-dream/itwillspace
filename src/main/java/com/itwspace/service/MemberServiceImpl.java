package com.itwspace.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwspace.mapper.MemberAttachMapper;
import com.itwspace.mapper.MemberMapper;
import com.itwspace.model.MemberAttachVO;
import com.itwspace.model.MemberVO;
import com.itwspace.security.MyUserDetailsService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	@Autowired
	private PasswordEncoder pwencoder;
	@Autowired
	private MemberAttachMapper attachMapper;	
	@Autowired
	MyUserDetailsService authService;
	
	@Transactional
	@Override
	public void register(MemberVO member) {
		log.info("register......" + member);
		String pw = member.getUserPw();
		member.setUserPw(pwencoder.encode(pw));
		mapper.insert(member);
		if (member.getAttachList() == null || member.getAttachList().size() <= 0) {
			return;
		}		
		member.getAttachList().forEach(attach -> {
			attach.setUserId(member.getUserId());
			attachMapper.insert(attach);
		});			
	}

	@Override
	public MemberVO get(String userId) {
		log.info("get......" + userId);	
		return mapper.findByUserId(userId);
	}

	@Transactional
	@Override
	public boolean modify(MemberVO member) {

		log.info("modify......" + member);

		attachMapper.deleteAll(member.getUserId());
		boolean modifyResult= mapper.update(member) == 1;
		
		authService.resetAuthentication(member.getUserId());
		
		if(modifyResult && member.getAttachList()!=null && member.getAttachList().size()>0) {
			member.getAttachList().forEach(attach->{
				attach.setUserId(member.getUserId());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	public boolean changePassword(String userId, String userNewPw) {		
		boolean changeResult= mapper.updatePassword(userId, pwencoder.encode(userNewPw)) == 1;
		return changeResult;
	}
	@Override
	public boolean verifyPassword(String encodedPw, String userPw) {
		log.info("register......" + encodedPw);
		log.info("register......" + userPw);
		if(pwencoder.matches(userPw, encodedPw))
			return true;
		else 
			return false;
	}
	
	@Override
	public List<MemberAttachVO> getAttachList(String userId) {
		log.info("get Attach list by userId" + userId);

		return attachMapper.findByUserId(userId);
	}

	@Transactional
	@Override
	public boolean remove(String userId) {
		log.info("remove...." + userId);

		attachMapper.deleteAll(userId);
		return mapper.delete(userId) == 1;
	}

	
}
