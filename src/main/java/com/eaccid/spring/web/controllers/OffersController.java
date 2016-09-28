package com.eaccid.spring.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OffersController {

    //arguments described in home.xml

    @RequestMapping("/")
    public String showHome(Model model) {
        model.addAttribute("nameBold", "<b>Tiffany</b>");
        model.addAttribute("name", "<b>Tiffany</b>");
        return "home";
    }

}
