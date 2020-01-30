package com.itwspace.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	private Long reviewId;
	private String content;
	private Date regDate;
	private String userId;
	private int space_id;
}
