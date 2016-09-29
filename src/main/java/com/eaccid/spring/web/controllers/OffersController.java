package com.eaccid.spring.web.controllers;

import com.eaccid.spring.web.dao.Offer;
import com.eaccid.spring.web.service.OffersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class OffersController {

    private OffersService offersService;

    @Autowired
    public void setOffersService(OffersService offersService) {
        this.offersService = offersService;
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String showTest(Model model, @RequestParam("id") String id) {
        System.out.println("Id is: " + id);
        return "home";
    }


    @RequestMapping("/offers")
    public String showOffers(Model model) {

        List<Offer> offers = offersService.getCurrent();
        model.addAttribute("offers", offers);
        return "offers";
    }


    @RequestMapping("/createoffer")
    public String createOffer(Model model) {

        model.addAttribute("offer", new Offer()); //<sform:form method="post" action="${pageContext.request.contextPath}/docreate" commandName="offer">

        return "createoffer";
    }

    @RequestMapping(value = "/docreate", method = RequestMethod.POST)
    public String doCreate(Model model, @Valid Offer offer, BindingResult result) {

        if (result.hasErrors()) {
//            System.out.println("Form does not validate.");
//            List<ObjectError> errors = result.getAllErrors();
//            errors.stream().forEach(error -> System.out.println(error.getDefaultMessage()));
            return "createoffer";

        } else {
            System.out.println("Form validated.");
        }
        return "offercreated";
    }

}
