package com.eaccid.spring.web.controllers;

import com.eaccid.spring.web.dao.Offer;
import com.eaccid.spring.web.service.OffersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
public class OffersController {

    private OffersService offersService;

    @Autowired
    public void setOffersService(OffersService offersService) {
        this.offersService = offersService;
    }

    //arguments described in home.xml
    @RequestMapping("/")
    public String showHome(Model model) {

        List<Offer> offers = offersService.getCurrent();
        model.addAttribute("offers", offers);

        return "home";
    }

}
