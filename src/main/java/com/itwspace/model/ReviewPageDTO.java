package com.itwspace.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReviewPageDTO {

  private int reviewCnt;
  private List<ReviewVO> list;
}
