package com.itwspace.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {
	
	private String res_date;
	private Timestamp res_tstamp;
	private String res_people;
	private String res_time;
	private int reservationId;	
	private String res_name;
	private String res_phone;	
	private String userId;	
	private int res_roomId;
	private int res_price;	
	private String res_account;	
	
}
