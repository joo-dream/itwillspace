package com.itwspace.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private String phone;	
	private String email;	
	private Date regDate;
	private boolean enabled;
	private String auth;
	
	private List<MemberAttachVO> attachList;
}
