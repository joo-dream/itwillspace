package com.itwspace.model;

import java.util.Date;

import lombok.Data;

@Data
public class SpaceVO {
	private int space_id;
	private String userId;
	private String space_kind;
	private String space_title;
	private String space_price;
	private String space_address;
	private String space_image; //array_list
	private String space_content;
	private String space_account;
	private Date space_regDate;
	
	private List<SpaceAttachVO> attachList;
}
