package com.etiqa.admission.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class AppController {
 
    @RequestMapping("/")
    String home(ModelMap modal) {
        modal.addAttribute("title","Home Page");
        return "index";
    }
 
    @RequestMapping(value = {"student/list"}, method = RequestMethod.GET)
    public ModelAndView viewUsers() {
        return new ModelAndView("student_list");
    }
    
 
}