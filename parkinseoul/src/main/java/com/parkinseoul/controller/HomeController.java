package com.parkinseoul.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


  @RequestMapping(value = "/home.htm")
  public String home() {


    return "home.index";
  }

  @RequestMapping(value = "login.htm")
  public String login() {
    return "home.login";
  }

  @RequestMapping(value = "join.htm")
  public String join() {
    return "home.join";
  }

}
