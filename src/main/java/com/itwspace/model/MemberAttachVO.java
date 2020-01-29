package com.itwspace.model;

import lombok.Data;

@Data
public class MemberAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  
  private String userId;
  
}
