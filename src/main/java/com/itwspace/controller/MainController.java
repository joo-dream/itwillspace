package com.itwspace.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwspace.model.SpaceVO;
import com.itwspace.service.SpaceService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {

   @Autowired
   private SpaceService  sService;
   
   @RequestMapping("/")
   public String main(Model model) {
      
      List<SpaceVO> vo = sService.list();
      model.addAttribute("spaceVO", vo);
      log.info(">>>>> bookingConfirm으로 끌고 갈 정보(hidden)" + sService.list());
      
      return "index";
   }
}